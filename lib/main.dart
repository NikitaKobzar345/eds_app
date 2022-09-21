import 'package:eds_app/screens/users_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: Colors.grey),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple[800],
        ),
      ),
      home: const UsersListPage(),
    );
  }
}
