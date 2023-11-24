import 'package:go_router/go_router.dart';
import 'package:poc_archi/data/models/post.dart';
import 'package:poc_archi/modules/detail/view.dart';
import 'package:poc_archi/modules/home/view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: AppRoute.root,
    routes: [
      GoRoute(
        path: AppRoute.root,
        builder: (context, state) => const HomeView(),
        routes: [
          GoRoute(
            path: AppRoute.detail,
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
  static const String root = '/';
  static const String detail = 'detail';
}
