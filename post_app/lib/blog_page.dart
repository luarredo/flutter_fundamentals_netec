import 'package:flutter/material.dart';
import 'package:post_app/post.dart';
import 'package:post_app/post_service.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});
  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final ApiService apiService = ApiService();
  List<Post> posts = [];
  bool isLoading = false;
  int start = 0;
  final int limit = 20;

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    fetchPosts();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchPosts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchPosts() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    List<Post> newPosts = await apiService.fetchPosts(start, limit);
    setState(() {
      posts.addAll(newPosts);
      start += limit;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: posts.length + 1,
        itemBuilder: (context, index) {
          if (index == posts.length) {
            return isLoading
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink();
          }
          final post = posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          );
        },
      ),
    );
  }
}
