import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_open_co/features/comments/presentation/comments_page.dart';

import '../../app/app_module.dart';
import 'bloc/comments_bloc.dart';
import 'data/datasource/comments_datasource.dart';
import 'data/datasource/comments_datasource_impl.dart';
import 'data/repositories/comment_repository.dart';
import 'data/repositories/comment_repository_impl.dart';

class CommentsModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(i) {
    i.addSingleton<CommentRepository>(CommentRepositoryImpl.new);
    i.addSingleton<CommentDatasource>(CommentDatasourceImpl.new);
    i.addSingleton(CommentsBloc.new);
  }

  @override
  void routes(r) {
    r.child('/:postId',
        child: (context) => CommentsPage(postId: int.parse(r.args.params['postId'])));
  }
}
