import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_open_co/features/posts/presentation/posts_page.dart';

import '../../app/app_module.dart';
import '../comments/presentation/comments_page.dart';
import 'bloc/posts_bloc.dart';
import 'data/datasource/posts_datasource.dart';
import 'data/repositories/post_repository.dart';

class PostsModule extends Module {

  @override
  List<Module> get imports => [
    AppModule(),
  ];

  @override
  void binds(i) {
    i.addSingleton(PostRepository.new);
    i.addSingleton(PostsDatasource.new);
    i.addSingleton(PostsBloc.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const PostsPage());
    r.child('/comments', child: (context) => const CommentsPage());
  }
}