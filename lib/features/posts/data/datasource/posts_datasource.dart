import 'package:dio/dio.dart';
import 'package:teste_open_co/models/post_model.dart';

class PostsDatasource {
  final Dio _dio;

  PostsDatasource({required Dio dio}) : _dio = dio;

  Future<List<PostModel>> getPosts() async {
    final response = await _dio.get('/posts');
    if (response.statusCode == 200) {
      return (response.data as List).map((post) => PostModel.fromJson(post)).toList();
    } else {
      throw Exception('Erro ao buscar os posts');
    }
  }
}
