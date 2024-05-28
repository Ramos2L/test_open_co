import '../../../../models/comments_model.dart';
import '../datasource/comments_datasource.dart';

class CommentRepository {
  final CommentDatasource _commentDatasource;

  CommentRepository({required CommentDatasource commentDatasource})
      : _commentDatasource = commentDatasource;

  Future<List<CommentModel>> getComment({required int id}) async {
    return await _commentDatasource.getCommmet(id);
  }
}
