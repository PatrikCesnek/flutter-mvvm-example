import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/ViewModel/posts_view_model.dart';

class PostView extends StatefulWidget {
  final PostsViewModel viewModel;

  const PostView({required this.viewModel});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {

  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewModel.isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Posts ${widget.viewModel.posts.length}'),
        ),
        body: ListView.builder(
          itemCount: widget.viewModel.posts.length,
          itemBuilder: (context, index) {
            final post = widget.viewModel.posts[index];
            return Card(
              child: ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => widget.viewModel.fetchPosts(),
          child: Icon(Icons.refresh),
        ),
      );
    }
  }
}