import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/post_model.dart';
import '../data/repositories/post_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository repository;
  
  PostsBloc(this.repository) : super(const PostsInitial()) {
   on<PostsListDataEvent>(_postsListDataEvent);
  }
  
  Future<void> _postsListDataEvent(PostsListDataEvent event, Emitter<PostsState> emit) async {
    emit(const PostsLoading());
    try {
      final posts = await repository.getPosts();
      emit(PostsData(postModel: posts));
    } catch (e) {
      emit(PostsError(e.toString()));
    }
  }
}
