import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pengayaanfirebase/screens/sign_up.dart';

import '../bloc/auth/authentication_bloc.dart';
import '../bloc/images/images_cubit.dart';
import 'upload_file_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'profile_screen';

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController aboutMeController = TextEditingController();

  String? profileImageUrl;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final databaseRef =
          FirebaseDatabase.instance.ref().child('users').child(user.uid);
      final snapshot = await databaseRef.child('profileImageUrl').get();
      if (snapshot.exists) {
        setState(() {
          profileImageUrl = snapshot.value as String;
        });
      }
    }
  }
  
  Future<void> pickImage() async {
    // Inisialisasi Image Picker
    final ImagePicker picker = ImagePicker();

    // Pilih Image dari Sumber Galery
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // Kembalikan path dari gambar
    if (image?.path != null) {
      context.read<ImagesCubit>().uploadImage(image!.path);

      //
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profileImages')
          .child(FirebaseAuth.instance.currentUser!.uid);
      final uploadTask = storageRef.putFile(File(image.path));

      final TaskSnapshot snapshot = await uploadTask;

      final String downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        profileImageUrl = downloadUrl;
      });

      // Save the image URL to Firestore
      await FirebaseFirestore.instance
          .collection('dataUsers')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'profileImageUrl': downloadUrl});
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return const Scaffold(
        body: Center(
          child: Text("No user signed in"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationSuccessState) {
              var userEmail = state.user.email;
              return Text('Profile of $userEmail');
            } else {
              return const Text('Profile');
            }
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(SignOut());
              Navigator.pushNamedAndRemoveUntil(
                context,
                SignupScreen.id,
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('dataUsers')
            .doc(currentUser.uid)
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

          fullNameController.text = userData['fullName'];
          usernameController.text = userData['username'];
          addressController.text = userData['address'];
          aboutMeController.text = userData['aboutMe'];

          return BlocBuilder<ImagesCubit, ImageState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Visibility(
                      visible: userData['profileImageUrl'] != null,
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.all(8),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: Image.network(
                          (userData['profileImageUrl'] != null)
                              ? userData['profileImageUrl']
                              : "",
                        ),
                      ),
                    ),
                    // Button Pilih Gambar
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: state.isLoading
                            ? CircularProgressIndicator(
                                value: state.uploadProgress,
                                backgroundColor: Colors.grey,
                              )
                            : ElevatedButton.icon(
                                onPressed: () async {
                                  await pickImage();
                                  //  _pickAndUploadImage();
                                },
                                icon: const Icon(Icons.image_rounded),
                                label: const Text('Upload Gambar'),
                              ),
                      ),
                    ),
                    // Link Hasil Upload
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SelectableText.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'Link Hasil Upload : '),
                            TextSpan(
                              text: userData['profileImageUrl'] ?? '',
                              style: TextStyle(
                                color: Colors.blue.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ListTile(
                      title: const Text("Email"),
                      subtitle: Text(userData['email']),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: fullNameController,
                      decoration: const InputDecoration(
                        labelText: "Full Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        labelText: "Address",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: aboutMeController,
                      decoration: const InputDecoration(
                        labelText: "About Me",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('dataUsers')
                            .doc(currentUser.uid)
                            .update({
                          'fullName': fullNameController.text.trim(),
                          'username': usernameController.text.trim(),
                          'address': addressController.text.trim(),
                          'aboutMe': aboutMeController.text.trim(),
                          'profileImageUrl':
                              profileImageUrl, // Save the image URL
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Profile updated successfully')),
                        );
                      },
                      child: const Text("Save Changes"),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => UploadFileScreen(),
            ),
          );
        },
        child: const Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}
