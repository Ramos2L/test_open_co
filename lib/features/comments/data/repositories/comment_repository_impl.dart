import '../../../../models/comments_model.dart';
import '../datasource/comments_datasource.dart';
import 'comment_repository.dart';

class CommentRepositoryImpl implements  CommentRepository{
  final CommentDatasource _commentDatasource;

  CommentRepositoryImpl({required CommentDatasource commentDatasource})
      : _commentDatasource = commentDatasource;

  @override
  Future<List<CommentModel>> getComment({required int id}) async {
    return await _commentDatasource.getCommmet(id);
  }
}
