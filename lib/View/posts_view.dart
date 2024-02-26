import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/ViewModel/posts_view_model.dart';

class PostView extends StatelessWidget {
  final PostsViewModel viewModel;

  const PostView({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: ListView.builder(
        itemCount: viewModel.posts.length,
        itemBuilder: (context, index) {
          final post = viewModel.posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.fetchPosts(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}