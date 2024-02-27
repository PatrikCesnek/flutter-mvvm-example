import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/post.dart';
import 'package:http/http.dart' as http;

class PostsViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  Future<void> fetchPosts() async {
    isLoading = true;
    await _fetchPostsFromApi();
    isLoading = false;
  }

  Future<List<Post>> _fetchPostsFromApi() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      final List<dynamic> data = json.decode(response.body);
      List<Post> posts = data.map((json) => Post.fromJson(json)).toList();
      _posts = posts;
      notifyListeners(); // Notify listeners after updating data
      return _posts;
    } catch (e) {
      error = e.toString();
      throw Exception('Failed to load posts');
    }
  }
}