import '../../../../models/comments_model.dart';
import '../datasource/comments_datasource_impl.dart';
import 'comment_repository.dart';

class CommentRepositoryImpl implements  CommentRepository{
  final CommentDatasourceImpl _commentDatasource;

  CommentRepositoryImpl({required CommentDatasourceImpl commentDatasource})
      : _commentDatasource = commentDatasource;

  @override
  Future<List<CommentModel>> getComment({required int id}) async {
    return await _commentDatasource.getCommmet(id);
  }
}
