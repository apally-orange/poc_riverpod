import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:poc_archi/data/models/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

@riverpod
Future<List<Post>> posts(Ref ref) async {
  final resp = await http.get(
    headers: {
      'Content-type': 'application/json; charset=UTF-8',
    },
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );

  final datas = jsonDecode(resp.body) as List<dynamic>;
  return datas
      .map(
        (e) => Post.fromJson(e),
      )
      .toList();
}
