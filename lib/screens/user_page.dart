import 'package:eds_app/screens/users_posts_page.dart';
import 'package:flutter/material.dart';
import 'package:swipe/swipe.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key, required this.userData, this.publications})
      : super(key: key);

  final List<String> userData;
  final List<String>? publications;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _mapUsernameToText.call(),
      ),
      body: Swipe(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ListView(
            children: [..._mapUserDataToWidget.call()],
          ),
        ),
        onSwipeLeft: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return  UsersPostsPage(
                    usersPosts: widget.publications!,
                    );
              },
            ),
          );
        },
      ),
    );
  }

  Text _mapUsernameToText() {
    return widget.userData.map((username) => Text(username)).first;
  }

  Iterable _mapUserDataToWidget() {
    return widget.userData.map(
      (data) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          data,
          style: const TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
