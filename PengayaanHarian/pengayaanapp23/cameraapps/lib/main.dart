import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera and Barcode Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: 
      // MateriCamera()
      MateriBarcode(),
    );
  }
}

class MateriCamera extends StatefulWidget {
  const MateriCamera({super.key});

  @override
  State<MateriCamera> createState() => _MateriCameraState();
}

class _MateriCameraState extends State<MateriCamera> {
  // Define Camera controller
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    // Jalankan inisialisasi kamera setelah widget berhasil dimuat
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // Cari kamera yang tersedia
      final List<CameraDescription> cameras = await availableCameras();
      // Pilih camera yang paling awal terdeteksi
      final firstCamera = cameras.firstOrNull;
      if (firstCamera != null) {
        // Buat Instance CameraController
        controller = CameraController(firstCamera, ResolutionPreset.max);
        // Inisialisasikan Kamera
        await controller?.initialize();
        // Lakukan SetState
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Materi Camera",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: controller != null
            ? Stack(
                children: [
                  CameraPreview(controller!),

                  /// Button Ambil Gambar.
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        iconSize: 40,
                        onPressed: () {
                          /// Panggil method [takePicture] untuk mengambil gambar
                          controller?.takePicture().then(
                            (value) {
                              /// Tampilkan dialog hasil dari gambar.
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Image.file(
                                        File(value.path),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.camera_alt),
                      ),
                    ),
                  ),
                ],
              )
            : Container(color: Colors.black),
      ),
      // body: Center(
      //   child: controller == null
      //       ? CameraPreview(controller!)
      //       : Container(color: Colors.black),
      // ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class MateriBarcode extends StatefulWidget {
  const MateriBarcode({super.key});

  @override
  State<MateriBarcode> createState() => _MateriBarcodeState();
}

class _MateriBarcodeState extends State<MateriBarcode> {
  /// Mobile Scanner Controller
  final controller = MobileScannerController(returnImage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Materi Barcode",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: MobileScanner(
          fit: BoxFit.contain,
          controller: controller,
          onDetect: (capture) async {
            /// Dapatkan gambar barcode yang terdeteksi.
            final Uint8List? image = capture.image;

            /// Jika ada barcode yang terdeteksi, tampilkan dialog beserta isinya.
            if (image != null) {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Barcode Value : ${capture.barcodes.map((e) => e.displayValue)}',
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
