import 'package:eds_app/data/fetch_users_data.dart';
import 'package:eds_app/screens/user_page.dart';
import 'package:flutter/material.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  late Future<List<dynamic>> usersList;
  late Future<List<dynamic>> posts;

  @override
  void initState() {
    super.initState();
    usersList = FetchUsersList().fetchUsersData();
    posts = FetchUsersPosts().fetchUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: usersList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: ListTile(
                    title: Text(snapshot.data![index]['name']),
                    subtitle: Text(snapshot.data![index]['username']),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UserPage(
                            userData: [
                              snapshot.data![index]['username'],
                              snapshot.data![index]['name'],
                              snapshot.data![index]['email'],
                              snapshot.data![index]['phone'],
                              snapshot.data![index]['website'],
                              [
                                snapshot.data![index]['company']['name'],
                                snapshot.data![index]['company']['catchPhrase'],
                                snapshot.data![index]['company']['bs'],
                              ].join(','),
                              [
                                snapshot.data![index]['address']['street'],
                                snapshot.data![index]['address']['suite'],
                                snapshot.data![index]['address']['city'],
                                snapshot.data![index]['address']['zipcode'],
                                snapshot.data![index]['address']['geo']['lat'],
                                snapshot.data![index]['address']['geo']['lng'],
                              ].join(','),
                            ],
                            publications: [
                              snapshot.data![index]['title'],
                              snapshot.data![index]['body'],
                            ],
                          );
                        },
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 10.0,
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
