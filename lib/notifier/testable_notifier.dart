import 'package:poc_archi/modules/posts/notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'testable_notifier.g.dart';

@riverpod
String basicString(BasicStringRef ref) =>
    'search: ${ref.watch(searchBarServiceProvider)}';

@riverpod
Future<String> futureString(FutureStringRef ref) async => 'Hello world';

@riverpod
class TestMulti extends _$TestMulti {
  @override
  String build() {
    return 'multi: ${ref.watch(searchBarServiceProvider)}';
  }
}
