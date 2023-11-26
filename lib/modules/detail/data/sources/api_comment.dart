import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:poc_archi/core/api_client.dart';
import 'package:poc_archi/core/config.dart';
import 'package:poc_archi/modules/detail/data/models/comment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_comment.g.dart';

@riverpod
ApiComment apiComments(ApiCommentsRef ref) {
  final client = ref.watch(apiClientProvider);
  final config = ref.watch(configProvider);

  return ApiComment(
    client: client,
    config: config,
  );
}

class ApiComment {
  const ApiComment({
    required this.client,
    required this.config,
  });

  final Client client;
  final Config config;

  FutureOr<List<Comment>> getComments(int postId) async {
    final resp = await client.get(
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
      Uri.parse('${config.authority}/comments?postId=$postId'),
    );

    final datas = jsonDecode(resp.body) as List<dynamic>;
    print('Api: getComments ${datas.length}');

    return datas
        .map(
          (post) => Comment.fromJson(post),
        )
        .toList();
  }
}
