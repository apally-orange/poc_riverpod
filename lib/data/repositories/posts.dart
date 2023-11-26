import 'package:poc_archi/data/models/post.dart';
import 'package:poc_archi/data/sources/api_post.dart';
import 'package:poc_archi/data/sources/local_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts.g.dart';

@riverpod
PostRepository postRepository(PostRepositoryRef ref) {
  final api = ref.watch(apiPostsProvider);
  final cache = ref.watch(cachePostProvider);

  return PostRepository(
    api: api,
    cache: cache,
  );
}

class PostRepository {
  const PostRepository({
    required this.api,
    required this.cache,
  });

  final ApiPost api;
  final CachePost cache;

  FutureOr<List<Post>> getPost() async {
    final now = DateTime.now();
    late final List<Post> ret;

    if (now.isAfter(cache.lastUpdate.add(const Duration(minutes: 10)))) {
      ret = await api.getPosts();
      cache.updatePost(ret);
      print('Repo: getRemote ${ret.length}');
    } else {
      ret = cache.cachePosts;
      print('Repo: getCache ${ret.length}');
    }

    return ret;
  }

  void addPost(Post value) {
    print('Repo: addPost ${value.title}');
    cache.addPost(value);
  }
}
