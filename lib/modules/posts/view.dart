import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_archi/data/models/post.dart';
import 'package:poc_archi/modules/posts/notifier.dart';
import 'package:poc_archi/modules/posts/search_bar.dart';
import 'package:poc_archi/router/router.dart';

class PostsView extends ConsumerWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ret = ref.watch(postsProvider);

    return ret.when(
      data: (datas) => _ListView(posts: datas),
      error: (error, st) => const SizedBox.shrink(),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    super.key,
    required this.posts,
  });

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchBarView(),
        if (posts.isEmpty)
          const Text('Empty data')
        else
          Expanded(
            child: ListView.separated(
              itemCount: posts.length,
              itemBuilder: (context, index) => _PostTile(
                post: posts[index],
              ),
              separatorBuilder: (context, _) => const Divider(),
            ),
          ),
      ],
    );
  }
}

class _PostTile extends StatelessWidget {
  const _PostTile({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(post.body),
      onTap: () => context.go('/${AppRoute.detail}', extra: post),
    );
  }
}
