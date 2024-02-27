import 'package:flutter/material.dart';


class ErrorView extends StatelessWidget {
  final String? error;

  const ErrorView({
    super.key,
    required this.error
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Something went wrong"),
      ),
      body: Column(
        children: [
          Text("Ooops, something went wrong."),
          Text(error ?? "")
        ],
      ),
    );
  }
}