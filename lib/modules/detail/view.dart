import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_archi/data/models/post.dart';
import 'package:poc_archi/modules/detail/data/models/comment.dart';
import 'package:poc_archi/modules/detail/data/repositories/comments.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view.g.dart';

@Riverpod(dependencies: [])
Post _currentPost(_CurrentPostRef ref) {
  throw Exception();
}

@Riverpod(dependencies: [_currentPost])
class Comments extends _$Comments {
  @override
  FutureOr<List<Comment>> build() {
    final postId = ref.watch(_currentPostProvider).id;

    return ref.watch(commentRepositoryProvider).getComments(postId);
  }
}

class DetailView extends ConsumerWidget {
  const DetailView({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        _currentPostProvider.overrideWithValue(post),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Poc detail'),
        ),
        body: const Center(
          child: _InnerView(),
        ),
      ),
    );
  }
}

class _InnerView extends ConsumerWidget {
  const _InnerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(_currentPostProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title),
          const SizedBox(height: 10),
          Text(post.body),
          const SizedBox(height: 10),
          const Text('Comments :'),
          const CommentView(),
        ],
      ),
    );
  }
}

class CommentView extends ConsumerWidget {
  const CommentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncComments = ref.watch(commentsProvider);

    return switch (asyncComments) {
      AsyncData(:final value) => Expanded(
          child: ListView.separated(
            itemCount: value.length,
            itemBuilder: (context, index) {
              final comment = value[index];

              return Text(comment.name);
            },
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      AsyncError() => const Text('Load comment Error'),
      _ => const CircularProgressIndicator(),
    };
  }
}
