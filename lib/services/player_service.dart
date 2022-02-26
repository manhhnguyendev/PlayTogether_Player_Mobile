import 'package:playtogether_player/model/player_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:playtogether_player/constants/api_url.dart' as apiUrl;
import 'package:playtogether_player/constants/config_json.dart' as configJson;
import 'package:playtogether_player/model/login_model.dart';

class PlayerService {
  Future<List<PlayerModel>> getPlayer(dynamic token) async {
    Response response;
    late List<PlayerModel> result;
    try {
      response = response = await get(
        Uri.parse(apiUrl.playerProfile),
        headers: configJson.headerAuth(token),
      );

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        result =
            body.map((dynamic item) => PlayerModel.fromJson(item)).toList();
      }
    } on Exception {
      rethrow;
    }
    return result;
  }

  Future<PlayerModel> getPlayerProfile(dynamic token) async {
    Response response;
    late PlayerModel result;
    try {
      response = await get(
        Uri.parse('${apiUrl.player}/profile'),
        headers: configJson.headerAuth(token),
      );

      if (response.statusCode == 200) {
        result = PlayerModel.fromJson(json.decode(response.body));
      }
    } on Exception {
      rethrow;
    }
    return result;
  }

  Future<LoginModel> login(String email, String password) async {
    Response response;
    LoginModel result;
    try {
      response = await post(
        Uri.parse('${apiUrl.account}/login?email=$email&password=$password'),
        // headers: configJson.header(),
      );
      // if (response.statusCode == 200) {}
      print(json.decode(response.body));
      result = LoginModel.fromJson(json.decode(response.body));
    } on Exception {
      rethrow;
    }
    return result;
  }
}
