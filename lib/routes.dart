import 'package:flutter/material.dart';
import 'package:playtogether_player/screen/change_password_screen/change_password_page.dart';
import 'package:playtogether_player/screen/complete_profile_screen/complete_profile_page.dart';
import 'package:playtogether_player/screen/end_hiring_stage/end_hiring_state_page.dart';
import 'package:playtogether_player/screen/forgot_password_screen/forgot_password_page.dart';
import 'package:playtogether_player/screen/get_hiring_request_screen/get_hiring_request_screen.dart';
import 'package:playtogether_player/screen/hiring_stage_screen/hiring_stage_page.dart';
import 'package:playtogether_player/screen/home_screen/home_page.dart';
import 'package:playtogether_player/screen/login_screen/login_page.dart';
import 'package:playtogether_player/screen/register_screen/register_page.dart';
import 'package:playtogether_player/helper/helper.dart' as helper;

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (context) => LoginPage(),
  RegisterPage.routeName: (context) => RegisterPage(),
  CompleteProfilePage.routeName: (context) => CompleteProfilePage(),

  // //LoginGoogle.routeName: (context) => LoginGoogle(),
  // // HomePage.routeName: (context) => HomePage(
  // //       hirerModel: null,
  // //     ),

  GetHiringRequestPage.routeName: (context) => GetHiringRequestPage(),
  ForgotPasswordPage.routeName: (context) => ForgotPasswordPage(),
  ChangePasswordPage.routeName: (context) => ChangePasswordPage(),
  // UserCategoriesPage.routeName: (context) => UserCategoriesPage(),
  // PlayerProfilePage.routeName: (context) => PlayerProfilePage(),
  // SendHiringRequestPage.routeName: (context) => SendHiringRequestPage(),
  // HiringNegotiatingPage.routeName: (context) => HiringNegotiatingPage(),
  HiringPage.routeName: (context) => HiringPage(),
  EndHiringStage.routeName: (context) => EndHiringStage(),
  // RatingAndCommentPage.routeName: (context) => RatingAndCommentPage(),
  // UserAccountPage.routeName: (context) => UserAccountPage(),
  // UserProfilePage.routeName: (context) => UserProfilePage(),
};
