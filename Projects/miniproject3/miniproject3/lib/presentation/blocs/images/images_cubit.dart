import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImageState> {
  ImagesCubit() : super(const ImageState());

  // Upload Image Method
  Future<void> uploadImage( String path) async {
    // Image Reference pada Storage
    final imageRef = FirebaseStorage.instance.ref().child('images/');

    // Upload Gambar ke Referance Image
    try {
      // Emit Loading state
      emit(const ImageState(isLoading: true));
      
      // Generate Random ID
      final randomID = "\$${Random().nextInt(99) + 256}";
      
      // Upload Task untuk gambar dengan random ID.
      final uploadTask = imageRef.child(randomID).putFile(File(path));
      
      // Lakukan dan listen pada proses upload
      uploadTask.snapshotEvents.listen((event) {
        switch (event.state) {
          // Upload Progress
          case TaskState.running:
            final progress = 100 * (event.bytesTransferred / event.totalBytes);
            // Emit Loading and the upload progress
            emit(ImageState(
              isLoading: true,
              uploadProgress: progress / 100,
            ));
            break;

          // TaskState.success:
          case TaskState.success:
            // Ambil download link dari gambar
            event.ref.getDownloadURL().then((value) => emit(ImageState(
                  isLoading: false,
                  linkGambar: value,
                )));
            break;

          // TaskState.error:
          case TaskState.error:
            emit(ImageState(errorMessage: e.toString()));
            break;
          // TaskState.canceled || TaskState.paused:
          case TaskState.canceled || TaskState.paused:
            break;
        }
      });
    } catch (e) {
      // emit(ImageState(errorMessage: e.toString()));
      emit(ImageState(errorMessage: e.toString()));
    }
  }
}