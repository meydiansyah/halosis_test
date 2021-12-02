import 'dart:convert';
import 'package:halosis_test/helper/api_config.dart';
import 'package:halosis_test/model/user.dart';
import 'package:http/http.dart' as http;

class ApiController {
  Future<List<UserModel>> getAllUsers() async {
    try {
      var resp = await http.get(Uri.parse("$urlApi/users"));
      if (resp.statusCode == 200) {
        List data = json.decode(resp.body)['data'];

        return data.map((e) => UserModel.fromJson(e)).toList();
      } else {
        return Future.error('Fetch user list error !');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
