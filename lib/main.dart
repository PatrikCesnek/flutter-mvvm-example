import 'package:flutter/material.dart';
import 'package:mvvm_flutter/ViewModel/posts_view_model.dart';
import 'package:mvvm_flutter/View/posts_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter MVVM Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/': (context) => PostView(viewModel: PostsViewModel(),),
        },
    );
  }
}
