import 'package:flutter/material.dart';
import 'package:playtogether_player/screen/forgot_password_screen/forgot_password_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  static String routeName = "forgotPassword";
  const ForgotPasswordPage({Key? key}) : super(key: key);

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
              child: ForgotPasswordForm(),
            ),
          ],
        ),
      ),
    );
  }
}
