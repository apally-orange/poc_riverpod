import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_archi/modules/posts/notifier.dart';

class AddPostButton extends ConsumerWidget {
  const AddPostButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => ref.read(postsProvider.notifier).addPost(),
      child: const Icon(Icons.add),
    );
  }
}
