import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_archi/data/models/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view.g.dart';

@riverpod
Post _currentPost(Ref ref) {
  throw Exception();
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
          title: const Text('Poc'),
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
    return Text(post.title);
  }
}
