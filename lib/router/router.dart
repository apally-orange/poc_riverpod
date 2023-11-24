import 'package:go_router/go_router.dart';
import 'package:poc_archi/data/models/post.dart';
import 'package:poc_archi/modules/detail/view.dart';
import 'package:poc_archi/modules/home/view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: AppRoute.root.path,
    routes: [
      GoRoute(
        path: AppRoute.root.path,
        name: AppRoute.root.name,
        builder: (context, state) => const HomeView(),
        routes: [
          GoRoute(
            path: AppRoute.detail.path,
            name: AppRoute.detail.name,
            builder: (context, state) {
              final post = state.extra as Post;

              return DetailView(post: post);
            },
          ),
        ],
      ),
    ],
  );
}

class AppRoute {
  const AppRoute._(this.path, this.name);
  final String path;
  final String name;

  static const AppRoute root = AppRoute._('/', 'root');
  static const AppRoute detail = AppRoute._('detail', 'detail');
}
