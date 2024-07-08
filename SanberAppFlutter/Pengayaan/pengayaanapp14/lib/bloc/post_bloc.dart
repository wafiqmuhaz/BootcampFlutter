import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/post_service.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostService postService;

  PostBloc(this.postService) : super(PostLoadingState()) {
    on<LoadPostsEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        final posts = await postService.fetchPosts();
        emit(PostLoadedState(posts));
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    });
  }
}
