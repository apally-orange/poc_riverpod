import 'package:poc_archi/data/models/post.dart';
import 'package:poc_archi/data/repositories/posts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

int _globalIndex = 200;

@riverpod
class Posts extends _$Posts {
  @override
  FutureOr<List<Post>> build() {
    return ref.watch(postRepositoryProvider).getPost();
  }

  void addPost() async {
    _globalIndex++;

    final newPost = Post(
      id: _globalIndex,
      title: 'title $_globalIndex',
      body: 'body',
    );

    ref.read(postRepositoryProvider).addPost(newPost);

    print('PostNotifier: add ${newPost.id}');

    ref.invalidateSelf();
  }
}

@riverpod
class SearchBarService extends _$SearchBarService {
  @override
  String build() {
    return '';
  }

  void search(String value) {
    print('Search: update $value');
    state = value.toLowerCase();
  }
}

@riverpod
class FilteredPost extends _$FilteredPost {
  @override
  FutureOr<List<Post>> build() async {
    final search = ref.watch(searchBarServiceProvider);
    final datas = await ref.watch(postsProvider.future);
    print('Filter: update ${datas.length}');

    return datas
        .where(
          (post) => post.title.toLowerCase().contains(search),
        )
        .toList();
  }
}
