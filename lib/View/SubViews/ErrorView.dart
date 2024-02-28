import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String? error;
  final Function()? tryAgain;

  const ErrorView({
    Key? key,
    @required this.error,
    this.tryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Something went wrong"),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Oops, something went wrong.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                ),
                SizedBox(height: 8),
                Text(
                    error ?? "",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 10,
                ),
                SizedBox(height: 8),
                ElevatedButton(
                    onPressed: tryAgain,
                    child: Text("Try again")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}