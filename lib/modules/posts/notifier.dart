import 'package:poc_archi/data/models/post.dart';
import 'package:poc_archi/data/sources/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

@riverpod
class Posts extends _$Posts {
  @override
  FutureOr<List<Post>> build() {
    final datas = ref.watch(apiPostsProvider).asData?.value ?? [];
    final search = ref.watch(searchBarServiceProvider);

    return datas
        .where(
          (post) => post.title.toLowerCase().contains(search),
        )
        .toList();
  }

  void addPost() async {
    final previouState = await future;

    state = AsyncData([
      const Post(id: 1, title: 'title', body: 'body'),
      ...previouState,
    ]);
  }
}

@riverpod
class SearchBarService extends _$SearchBarService {
  @override
  String build() {
    return '';
  }

  void search(String value) {
    state = value.toLowerCase();
  }
}
