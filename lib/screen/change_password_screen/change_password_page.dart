import 'package:flutter/material.dart';
import 'package:playtogether_player/screen/change_password_screen/change_password.form.dart';

class ChangePasswordPage extends StatelessWidget {
  static String routeName = 'change_password';
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
              child: ChangePasswordForm(),
            ),
          ],
        ),
      ),
    );
  }
}
