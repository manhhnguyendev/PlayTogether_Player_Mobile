import 'package:flutter/material.dart';
import 'package:playtogether_player/routes.dart';
import 'package:playtogether_player/screen/get_hiring_request_screen/get_hiring_request_screen.dart';
import 'package:playtogether_player/screen/hiring_stage_screen/hiring_stage_page.dart';
import 'package:playtogether_player/screen/home_screen/home_page.dart';
import 'package:playtogether_player/screen/login_screen/login_page.dart';
// import 'package:playtogether_hirer/screen/player_profile_screen/player_profile_page.dart';
// import 'package:playtogether_hirer/screen/take_user_needs_srceen/take_user_categories_page.dart';
// import 'package:playtogether_hirer/screen/user_account_screen/user_account_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: routes,
    );
  }
}
