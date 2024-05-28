import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/comments_model.dart';
import '../data/repositories/comment_repository.dart';

part 'comments_event.dart';

part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final CommentRepository repository;

  CommentsBloc(this.repository) : super(const CommentsInitial()) {
    on<CommentsDataEvent>(_commentsDataEvent);
  }

  Future<void> _commentsDataEvent(CommentsDataEvent event, Emitter<CommentsState> emit) async {
    emit(const CommentsLoading());
    try {
      final comments = await repository.getComment(id: event.postId);
      emit(CommentsData(commentModel: comments));
    } catch (e) {
      emit(CommentsError(e.toString()));
    }
  }
}
