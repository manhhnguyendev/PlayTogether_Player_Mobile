import 'package:flutter/material.dart';
import 'package:playtogether_player/screen/login_screen/forgot_and_new_account_area.dart';
import 'dart:core';

import 'package:playtogether_player/screen/login_screen/login_form.dart';
import 'package:playtogether_player/screen/login_screen/login_google_page.dart';

class LoginPage extends StatelessWidget {
  static String routeName = "login";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            width: size.width,
            height: size.height * 0.45,
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("assets/images/playtogetherlogo.png"),
                    fit: BoxFit.cover)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: LoginForm(),
          ),
          SizedBox(
            height: size.height / 40,
          ),
          const ForgotPassAndCreateNewAccArea(),
          SizedBox(
            height: size.height / 40,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      border: Border.all(color: Colors.black45)),
                  child: SizedBox(
                    height: 0.01,
                    width: size.width * 0.3,
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Text("Hoặc",
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                    textAlign: TextAlign.center),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      border: Border.all(color: Colors.black45)),
                  child: SizedBox(
                    height: 0.01,
                    width: size.width * 0.3,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height / 50,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: LoginGooglePage(),
          ),
        ]),
      ),
    );
  }
}
