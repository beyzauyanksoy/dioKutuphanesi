import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/users_model.dart';

class UsersProvider extends ChangeNotifier {
  Future<List<Usermodel>> getUserList() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/users');
      List<Usermodel> userList = [];
      if (response.statusCode == 200) {
        userList =
            (response.data as List).map((e) => Usermodel.fromMap(e)).toList();
      }
      return userList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
