import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innova_next/model/model.dart';

Future<UserModel> fetchUser() async {
  final response =
      await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
  if (response.statusCode == 200) {
    return UserModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}
