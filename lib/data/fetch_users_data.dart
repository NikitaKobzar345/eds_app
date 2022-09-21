import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

abstract class FetchUsersData {
  Future<List<dynamic>> fetchUsersData();
}

class FetchUsersList implements FetchUsersData {
  @override
  Future<List<dynamic>> fetchUsersData() async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw const HttpException('Failed to load');
    }
  }
}

class FetchUsersPosts implements FetchUsersData {
  @override
  Future<List<dynamic>> fetchUsersData() async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw const HttpException('Failed to load');
    }
  }
}

class FetchUsersComments implements FetchUsersData {
  @override
  Future<List<dynamic>> fetchUsersData() async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/comments');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw const HttpException('Failed to load');
    }
  }
}

class FetchUsersAlbums implements FetchUsersData {
  @override
  Future<List<dynamic>> fetchUsersData() async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/albums');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw const HttpException('Failed to load');
    }
  }
}
