import 'package:flutter/material.dart';
import 'package:playtogether_player/helpers/routes.dart';
import 'package:playtogether_player/pages/home_page.dart';

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
