import '../../../../models/post_model.dart';
import '../datasource/posts_datasource.dart';

class PostRepository {
  final PostsDatasource _postsDatasource;

  PostRepository({required PostsDatasource postsDatasource}) : _postsDatasource = postsDatasource;

  Future<List<PostModel>> getPosts() async {
    return await _postsDatasource.getPosts();
  }
}
