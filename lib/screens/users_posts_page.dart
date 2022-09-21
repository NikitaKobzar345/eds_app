import 'package:flutter/material.dart';

class UsersPostsPage extends StatefulWidget {
  const UsersPostsPage({Key? key, this.usersPosts}) : super(key: key);

  final List<String>? usersPosts;

  @override
  State<UsersPostsPage> createState() => _UsersPostsPageState();
}

class _UsersPostsPageState extends State<UsersPostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Публикации'),
      ),
      body: ListView(
        children: [Text(widget.usersPosts.toString())],
      ),
    );
  }
}
