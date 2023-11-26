import 'package:poc_archi/data/models/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_data.g.dart';

@riverpod
CachePost cachePost(CachePostRef ref) {
  return CachePost();
}

// Basic cache can be improve with use localData (Hive, Isar...)
class CachePost {
  CachePost();

  List<Post> get cachePosts => _cachePosts;
  List<Post> _cachePosts = const [];

  DateTime get lastUpdate => _lastUpdate;
  DateTime _lastUpdate = DateTime.fromMillisecondsSinceEpoch(0);

  void updatePost(List<Post> post) {
    _cachePosts = post;
    _lastUpdate = DateTime.now();
  }

  void addPost(Post value) => _cachePosts.add(value);
}
