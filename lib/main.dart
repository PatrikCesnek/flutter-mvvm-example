import 'package:flutter/material.dart';
import 'package:mvvm_flutter/ViewModel/posts_view_model.dart';
import 'package:mvvm_flutter/View/posts_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostsViewModel>(
      create: (context) => PostsViewModel(),
      child: MaterialApp(
        title: 'Flutter MVVM Demo',
        debugShowCheckedModeBanner: false,
        home: Consumer<PostsViewModel>(
          builder: (context, viewModel, _) => PostView(viewModel: viewModel),
        ),
      ),
    );
  }
}