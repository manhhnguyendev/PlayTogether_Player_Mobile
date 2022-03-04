import 'package:flutter/material.dart';
import 'package:playtogether_player/pages/change_password_page.dart';
import 'package:playtogether_player/pages/complete_profile_page.dart';
import 'package:playtogether_player/pages/end_hiring_page.dart';
import 'package:playtogether_player/pages/forgot_password_page.dart';
import 'package:playtogether_player/pages/get_hiring_request_page.dart';
import 'package:playtogether_player/pages/hiring_stage_page.dart';
import 'package:playtogether_player/pages/home_page.dart';
import 'package:playtogether_player/pages/login_page.dart';
import 'package:playtogether_player/pages/register_page.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (context) => LoginPage(),
  RegisterPage.routeName: (context) => RegisterPage(),
  CompleteProfilePage.routeName: (context) => CompleteProfilePage(),
  GetHiringRequestPage.routeName: (context) => GetHiringRequestPage(),
  ForgotPasswordPage.routeName: (context) => ForgotPasswordPage(),
  ChangePasswordPage.routeName: (context) => ChangePasswordPage(),
  HiringPage.routeName: (context) => HiringPage(),
  EndHiringPage.routeName: (context) => EndHiringPage(),
  HomePage.routeName: (context) => HomePage(),
};
