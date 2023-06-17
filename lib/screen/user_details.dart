import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  var fName, lName, image, email;
  UserDetails({
    required this.email,
    required this.fName,
    required this.lName,
    required this.image,
  });
  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(widget.image),
            ),
            Text("First Name: ${widget.fName}"),
            Text("Last Name: ${widget.lName}"),
            Text("Email Address: ${widget.email}"),
          ],
        ),
      ),
    );
  }
}
