import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadFileScreen extends StatefulWidget {
  static const String id = 'upload_file_screen';

  const UploadFileScreen({super.key});

  @override
  State<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  UploadTask? task;
  File? file;
  String? fileUrl;

  @override
  Widget build(BuildContext context) {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    final fileNameEdit = file != null ? basename(file!.path) : '';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload File"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('dataUsers')
                .doc(currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }
              if (!snapshot.hasData || !snapshot.data!.exists) {
                return const Center(child: Text("User data not found"));
              }

              final userData = snapshot.data!.data() as Map<String, dynamic>;

              return Container(
                padding: const EdgeInsets.all(32),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWidget(
                        text: 'Select File',
                        icon: Icons.attach_file,
                        onClicked: selectFile,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        fileName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 48),
                      ButtonWidget(
                        text: 'Upload File',
                        icon: Icons.cloud_upload_outlined,
                        onClicked: uploadFile,
                      ),
                      const SizedBox(height: 20),
                      task != null ? buildUploadStatus(task!) : Container(),
                      const SizedBox(height: 20),
                      if (userData['dataFileUrl'] != null)
                        Row(
                          children: [
                            Card(
                              color: const Color.fromARGB(255, 162, 194, 248),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: EditWidget(
                                  icon: Icons.edit,
                                  text: "Edit",
                                  onClicked: editFile,
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (userData['dataFileUrl'] != null)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        SelectableText.rich(
                                          TextSpan(
                                            children: [
                                              const TextSpan(
                                                  text: 'Link File : '),
                                              TextSpan(
                                                text: userData['dataFileUrl'],
                                                style: TextStyle(
                                                  color: Colors.blue.shade800,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        const Divider(),
                                        Text(
                                          fileNameEdit,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Divider(),
                                        task != null ? buildUploadStatus(task!) : Container(),
                                        const SizedBox(height: 8),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 202, 219, 248),
                                          ),
                                          onPressed: () => deleteFile(
                                              userData['dataFileUrl']),
                                          child: const Text("Hapus File"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                      if (fileUrl != null)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SelectableText.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                    text: 'Link Hasil Upload File Terbaru : '),
                                TextSpan(
                                  text: fileUrl,
                                  style: TextStyle(
                                    color: Colors.blue.shade800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future editFile() async {
    // Meminta izin untuk membaca penyimpanan eksternal
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // Meminta izin jika belum diberikan
      if (await Permission.storage.request().isDenied) {
        // Jika pengguna menolak permintaan izin
        print('Izin membaca penyimpanan eksternal ditolak');
        return;
      }
    }

    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));

    //
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    setState(() {
      fileUrl = urlDownload;
    });

    // Simpan URL file ke Firestore
    final User? currentUser = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('dataUsers')
        .doc(currentUser!.uid)
        .update({'dataFileUrl': fileUrl});

    print('Download-Link: $urlDownload');
  }

  Future selectFile() async {
    // Meminta izin untuk membaca penyimpanan eksternal
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // Meminta izin jika belum diberikan
      if (await Permission.storage.request().isDenied) {
        // Jika pengguna menolak permintaan izin
        print('Izin membaca penyimpanan eksternal ditolak');
        return;
      }
    }

    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    setState(() {
      fileUrl = urlDownload;
    });

    // Simpan URL file ke Firestore
    final User? currentUser = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('dataUsers')
        .doc(currentUser!.uid)
        .update({'dataFileUrl': fileUrl});

    print('Download-Link: $urlDownload');
  }

  Future deleteFile(String fileUrl) async {
    final User? currentUser = FirebaseAuth.instance.currentUser;

    // Hapus file dari Firebase Storage
    final ref = FirebaseStorage.instance.refFromURL(fileUrl);
    await ref.delete();

    // Hapus URL file dari Firestore
    await FirebaseFirestore.instance
        .collection('dataUsers')
        .doc(currentUser!.uid)
        .update({'dataFileUrl': FieldValue.delete()});

    setState(() {
      this.fileUrl = null;
    });

    print('File deleted from Storage and Firestore');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        child: buildContent(),
        onPressed: onClicked,
      );

  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(fontSize: 22, color: Colors.black),
          ),
        ],
      );
}

class EditWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;

  const EditWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: buildContent(),
        onTap: onClicked,
      );

  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(fontSize: 22, color: Colors.black),
          ),
        ],
      );
}

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static UploadTask? uploadBytes(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putData(data);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
