import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_archi/modules/posts/notifier.dart';

class SearchBarView extends ConsumerWidget {
  const SearchBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchBar(
      onChanged: (value) => ref.read(searchBarServiceProvider.notifier).search(
            value,
          ),
    );
  }
}
