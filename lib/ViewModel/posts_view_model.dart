import 'dart:convert';
import '../Model/posts.dart';
import 'package:http/http.dart' as http;

class PostsViewModel {
  bool isLoading = false;
  List<Posts> _posts = [];

  List<Posts> get posts => _posts;

  Future<void> fetchPosts() async {
    isLoading = true;
    print("Should start loading... result is: ${isLoading}");
    List<Posts> fetchedPosts = await _fetchPostsFromApi();

    _posts = fetchedPosts;
    print(fetchedPosts.first);
    print(fetchedPosts.length);
    isLoading = false;
    print("Should stop loading... result is: ${isLoading}");
  }

  Future<List<Posts>> _fetchPostsFromApi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      //TODO: Delete the print statement!!
      print(data);

      return data.map((json) => Posts(userId: json['userId'], id: json['id'], title: json['title'], body: json['body'])).toList();
    } else {
      print("There was an error fetching data");
      throw Exception('Failed to load posts');
    }
  }
}