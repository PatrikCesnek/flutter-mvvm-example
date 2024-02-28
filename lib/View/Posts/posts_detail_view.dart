import 'package:flutter/material.dart';

class PostsDetailView extends StatelessWidget {

  final String detailText;

  const PostsDetailView({
    Key? key,
    required this.detailText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Detail"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(detailText),
            ),
          ),
        ),
      ),
    );
  }
}
