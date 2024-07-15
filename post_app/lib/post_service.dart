import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post.dart';

class ApiService {
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  Future<List<Post>> fetchPosts(int start, int limit) async {
    final response =
        await http.get(Uri.parse('$apiUrl?_start=$start&_limit=$limit'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
