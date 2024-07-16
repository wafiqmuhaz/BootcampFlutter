import 'package:equatable/equatable.dart';
import '../model/post_model.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<Post> posts;

  const PostLoadedState(this.posts);

  @override
  List<Object> get props => [posts];
}

class PostErrorState extends PostState {
  final String error;

  const PostErrorState(this.error);

  @override
  List<Object> get props => [error];
}
