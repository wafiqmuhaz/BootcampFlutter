part of 'images_cubit.dart';

class ImageState extends Equatable {
  final String? linkGambar;
  final bool isLoading;
  final double uploadProgress;
  final String errorMessage;

  const ImageState({
    this.linkGambar,
    this.isLoading = false,
    this.uploadProgress = 0,
    this.errorMessage = "",
  });

  @override
  List<Object?> get props => [linkGambar, isLoading, uploadProgress];
}