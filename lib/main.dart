import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_archi/data/sources/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

@riverpod
String helloWorld(Ref ref) {
  return 'HelloWold';
}

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(helloWorldProvider);
    final ret = ref.watch(postsProvider);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ret.when(
            data: (data) => Text(data.length.toString()),
            error: (_, __) => const SizedBox.shrink(),
            loading: () => const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
