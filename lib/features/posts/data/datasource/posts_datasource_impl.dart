import 'package:dio/dio.dart';
import 'package:teste_open_co/features/posts/data/datasource/posts_datasource.dart';
import 'package:teste_open_co/models/post_model.dart';

class PostsDatasourceImpl implements PostsDatasource {
  final Dio _dio;

  PostsDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await _dio.get('/posts');
    if (response.statusCode == 200) {
      return (response.data as List).map((post) => PostModel.fromJson(post)).toList();
    } else {
      throw Exception('Erro ao buscar os posts');
    }
  }
}
