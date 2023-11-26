import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:poc_archi/core/config.dart';
import 'package:poc_archi/data/models/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_post.g.dart';

@Riverpod(keepAlive: true)
Client apiClient(ApiClientRef ref) {
  return Client();
}

@riverpod
ApiPost apiPosts(ApiPostsRef ref) {
  final client = ref.watch(apiClientProvider);
  final config = ref.watch(configProvider);

  return ApiPost(
    client: client,
    config: config,
  );
}

class ApiPost {
  const ApiPost({
    required this.client,
    required this.config,
  });

  final Client client;
  final Config config;

  Future<List<Post>> getPosts() async {
    final resp = await client.get(
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
      Uri.parse('${config.authority}/posts'),
    );

    final datas = jsonDecode(resp.body) as List<dynamic>;
    print('Api: getPosts ${datas.length}');
    return datas
        .map(
          (post) => Post.fromJson(post),
        )
        .toList();
  }
}
