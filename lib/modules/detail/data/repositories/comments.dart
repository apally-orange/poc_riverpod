import 'package:poc_archi/modules/detail/data/models/comment.dart';
import 'package:poc_archi/modules/detail/data/sources/api_comment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comments.g.dart';

@riverpod
CommentRepository commentRepository(CommentRepositoryRef ref) {
  return CommentRepository(ref.watch(apiCommentsProvider));
}

class CommentRepository {
  const CommentRepository(this.api);

  final ApiComment api;

  FutureOr<List<Comment>> getComments(int postId) {
    return api.getComments(postId);
  }
}
