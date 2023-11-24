import 'package:flutter/material.dart';
import 'package:poc_archi/modules/posts/add_button.dart';
import 'package:poc_archi/modules/posts/view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poc'),
      ),
      body: const PostsView(),
      floatingActionButton: const AddPostButton(),
    );
  }
}
