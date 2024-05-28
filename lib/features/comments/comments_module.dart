import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_open_co/features/comments/presentation/comments_page.dart';

import '../../app/app_module.dart';
import 'bloc/comments_bloc.dart';
import 'data/datasource/comments_datasource.dart';
import 'data/repositories/comment_repository.dart';

class CommentsModule extends Module {
  @override
  List<Module> get imports => [
    AppModule(),
  ];

  @override
  void binds(i) {
    i.addSingleton(CommentRepository.new);
    i.addSingleton(CommentDatasource.new);
    i.addSingleton(CommentsBloc.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const CommentsPage());
  }
}