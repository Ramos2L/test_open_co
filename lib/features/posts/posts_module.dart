import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_open_co/features/posts/data/datasource/posts_datasource_impl.dart';
import 'package:teste_open_co/features/posts/presentation/posts_page.dart';

import '../../app/app_module.dart';
import '../../core/services/client_service.dart';
import '../../core/services/dio_service.dart';
import '../comments/presentation/comments_page.dart';
import 'bloc/posts_bloc.dart';
import 'data/datasource/posts_datasource.dart';
import 'data/repositories/post_repository.dart';
import 'data/repositories/post_repository_impl.dart';

class PostsModule extends Module {

  @override
  List<Module> get imports => [
    AppModule(),
  ];

  @override
  void binds(i) {
    i.addSingleton<ClientService>(DioService.new);
    i.addSingleton<PostRepository>(PostRepositoryImpl.new);
    i.addSingleton<PostsDatasource>(PostsDatasourceImpl.new);
    i.addSingleton(PostsBloc.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const PostsPage());
    r.child('/comments/:postId', child: (context) => CommentsPage(postId: int.parse(r.args.params['postId'])));
  }
}