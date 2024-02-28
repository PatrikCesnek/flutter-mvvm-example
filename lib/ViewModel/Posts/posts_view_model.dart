import 'dart:convert';
import 'package:flutter/material.dart';
import '../../Model/Post/post.dart';
import 'package:http/http.dart' as http;

class PostsViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  Future<void> fetchPosts() async {
    await _fetchPostsFromApi();
  }

  Future<List<Post>> _fetchPostsFromApi() async {
    try {
      isLoading = true;
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<Post> posts = data.map((json) => Post.fromJson(json)).toList();
        _posts = posts;
        notifyListeners();
        isLoading = false;
        return _posts;
      } else {
        isLoading = false;
        error = 'Failed to load posts: ${response.statusCode}';
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
      throw Exception('Failed to load posts');
    }
  }

  Future<void> reloadPosts() async {
    try {
      error = null;
      await fetchPosts();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}