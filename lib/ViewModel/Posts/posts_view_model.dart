import 'dart:convert';
import 'package:flutter/material.dart';
import '../../Model/Post/post.dart';
import 'package:http/http.dart' as http;

class PostsViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? error;
  List<Post> _posts = [];

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();
    await _fetchPostsFromApi();
  }

  Future<List<Post>> _fetchPostsFromApi() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<Post> posts = data.map((json) => Post.fromJson(json)).toList();
        _posts = posts;
        notifyListeners();
        _isLoading = false;
        notifyListeners();
        return _posts;
      } else {
        _isLoading = false;
        error = 'Failed to load posts';
        notifyListeners();
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      _isLoading = false;
      error = e.toString();
      notifyListeners();
      throw Exception('Failed to load posts');
    }
  }

  Future<void> reloadPosts() async {
    try {
      _isLoading = true;
      error = null;
      notifyListeners();
      await fetchPosts();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}
