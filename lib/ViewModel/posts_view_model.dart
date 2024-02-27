import 'dart:convert';
import '../Model/post.dart';
import 'package:http/http.dart' as http;

class PostsViewModel {
  bool isLoading = false;
  String? error;
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  Future<void> fetchPosts() async {
    isLoading = true;
    print("Should start loading... result is: ${isLoading}");
    _posts = await _fetchPostsFromApi();

    isLoading = false;
    print("Should stop loading... result is: ${isLoading}");
  }

  Future<List<Post>> _fetchPostsFromApi() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      final List<dynamic> data = json.decode(response.body);
      //TODO: Delete the print statement!!
      print(data);
      return data.map((json) => Post(
          userId: json['userId'],
          id: json['id'],
          title: json['title'],
          body: json['body']
      )).toList();
    } catch (e) {
      error = e.toString();
      throw Exception('Failed to load posts');
    }
  }
}