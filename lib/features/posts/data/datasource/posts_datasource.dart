import 'package:teste_open_co/models/post_model.dart';

abstract class PostsDatasource {
  Future<List<PostModel>> getPosts();
}
