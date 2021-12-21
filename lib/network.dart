import 'dart:convert';

import 'package:dio/dio.dart';

class Session {
  Future<void> fetchData() async {
    try {
      Response response = await Dio().post(
        'http://10.0.2.2:8000/api/bysession/',
        options: Options(
          contentType: "application/json",
        ),
        data: json.encode({"username": "admin", "password": 12345}),
      );

      print('calling api');
      if (response.statusCode == 200) {
        var getUsersData = response.data as Map;
        print(getUsersData);
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
