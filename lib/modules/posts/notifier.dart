import 'package:poc_archi/data/models/post.dart';
import 'package:poc_archi/data/sources/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

@riverpod
class Posts extends _$Posts {
  @override
  FutureOr<List<Post>> build() {
    final datas = ref.watch(apiPostsProvider).asData?.value ?? [];
    return datas.take(3).toList();
  }

  void addPost() async {
    final previouState = await future;

    state = AsyncData([
      const Post(id: 1, title: 'title', body: 'body'),
      ...previouState,
    ]);
  }
}
