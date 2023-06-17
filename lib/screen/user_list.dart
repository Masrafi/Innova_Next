import 'package:flutter/material.dart';
import 'package:innova_next/model/model.dart';
import 'package:innova_next/screen/user_details.dart';

import '../repository/repo.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel>(
        future: fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: ListView.builder(
                      padding: EdgeInsets.all(10),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserDetails(
                                        email: snapshot.data!.data![index].email
                                            .toString(),
                                        fName: snapshot
                                            .data!.data![index].firstName
                                            .toString(),
                                        lName: snapshot
                                            .data!.data![index].lastName
                                            .toString(),
                                        image: snapshot
                                            .data!.data![index].avatar
                                            .toString())));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot
                                        .data!.data![index].avatar
                                        .toString()),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Name: ${snapshot.data!.data![index].firstName} ${snapshot.data!.data![index].lastName}",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
            //   Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text('Name: ${snapshot.data!.data}'),
            //     Text('Age: ${snapshot.data!.page}'),
            //     Text('Email: ${snapshot.data!.total}'),
            //   ],
            // );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
