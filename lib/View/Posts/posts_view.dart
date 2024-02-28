import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/View/Posts/posts_detail_view.dart';
import 'package:mvvm_flutter/View/SubViews/ErrorView.dart';
import 'package:mvvm_flutter/ViewModel/Posts/posts_view_model.dart';

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
        appBar: AppBar(
          title: Text("Posts"),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      if(widget.viewModel.error == null) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Posts'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: widget.viewModel.posts.length,
              itemBuilder: (context, index) {
                final post = widget.viewModel.posts[index];
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostsDetailView(
                              detailText: widget.viewModel.posts[index].body
                          ),
                        ),
                      );
                    },
                    title: Text(post.title),
                  ),
                );
              },
            ),
          ),
        );
      } else {
        return ErrorView(
          error: widget.viewModel.error,
          tryAgain: widget.viewModel.reloadPosts,
        );
      }
    }
  }
}
