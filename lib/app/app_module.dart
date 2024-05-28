import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_open_co/features/comments/comments_module.dart';
import 'package:teste_open_co/features/posts/posts_module.dart';

class AppModule extends Module {

  @override
  void exportedBinds(i) {
    i.addInstance<Dio>(Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com')));
  }

  @override
  void routes(r) {
    r.module('/', module: PostsModule());
    r.module('/comments', module: CommentsModule());
  }
}
