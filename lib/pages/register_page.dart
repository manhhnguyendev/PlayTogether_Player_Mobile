import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playtogether_player/constants/const.dart';
import 'package:playtogether_player/pages/complete_profile_page.dart';
import 'package:playtogether_player/widgets/confirm_otp_button.dart';
import 'package:playtogether_player/widgets/login_error_form.dart';
import 'package:playtogether_player/widgets/main_button.dart';
import 'package:playtogether_player/widgets/otp_button.dart';

class RegisterPage extends StatefulWidget {
  static String routeName = "register";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String confirmPass = "";
  String otpCode = "";
  final List listErrorEmail = [''];
  final List listErrorPass = [''];
  final List listErrorConfirm = [''];
  final List listErrorOTP = [''];
  bool passObsecure = true;
  bool confirmObsecure = true;

  void addError(List inputListError, {String? error}) {
    if (!inputListError.contains(error)) {
      setState(() {
        inputListError.add(error);
      });
    }
  }

  void removeError(List inputListError, {String? error}) {
    if (inputListError.contains(error)) {
      setState(() {
        inputListError.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: size.width,
              height: size.height * 0.45,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("assets/images/playtogetherlogo.png"),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(flex: 2, child: buildEmailField()),
                              const Expanded(flex: 1, child: OTPButton()),
                            ],
                          ),
                          FormError(listError: listErrorEmail),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(flex: 2, child: buildOTPField()),
                              const Expanded(
                                  flex: 1, child: ConfirmOTPButton()),
                            ],
                          ),
                          FormError(listError: listErrorOTP),
                          const SizedBox(
                            height: 10,
                          ),
                          buildPasswordField(),
                          FormError(listError: listErrorPass),
                          const SizedBox(
                            height: 10,
                          ),
                          buildConfirmField(),
                          FormError(listError: listErrorConfirm),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    MainButton(
                      text: "TIẾP TỤC",
                      onpress: () {
                        if (_formKey.currentState == null) {
                          print("_formKey.currentState is null!");
                        } else if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if (listErrorEmail.length ==
                                  1 && //vi` luc khai bao 4 cai list , co 1 phan tu "" san trong list nen length = 1;
                              listErrorPass.length == 1 &&
                              listErrorConfirm.length == 1 &&
                              listErrorOTP.length == 1) {
                            Navigator.pushNamed(
                                context, CompleteProfilePage.routeName);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  'Bạn đã có tài khoản? Quay lại đăng nhập',
                  style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        email = value;
        if (value.isNotEmpty && listErrorEmail.contains(emailNullError)) {
          removeError(listErrorEmail, error: emailNullError);
        } else if (emailValidatorRegExp.hasMatch(value) &&
            listErrorEmail.contains(invalidEmailError)) {
          removeError(listErrorEmail, error: invalidEmailError);
        }
        return;
      },
      validator: (value) {
        if ((value!.isEmpty) && !listErrorEmail.contains(emailNullError)) {
          addError(listErrorEmail, error: emailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !listErrorEmail.contains(invalidEmailError)) {
          addError(listErrorEmail, error: invalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        labelText: "Email",
        hintText: "Nhập vào email",
        enabledBorder: OutlineInputBorder(
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 10,
        ),
        focusedErrorBorder: OutlineInputBorder(
            gapPadding: 10, borderSide: BorderSide(color: Colors.black)),
        errorBorder: (OutlineInputBorder(
            gapPadding: 10, borderSide: BorderSide(color: Colors.black))),
        errorStyle: TextStyle(height: 0, color: Colors.black),
      ),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        password = value;
        if (value.isNotEmpty && listErrorPass.contains(passNullError)) {
          removeError(listErrorPass, error: passNullError);
        } else if (passwordValidatorRegExp.hasMatch(value) &&
            listErrorPass.contains(invalidPassError)) {
          removeError(listErrorPass, error: invalidPassError);
        }
        return;
      },
      validator: (value) {
        if ((value!.isEmpty) && !listErrorPass.contains(passNullError)) {
          addError(listErrorPass, error: passNullError);
          return "";
        } else if (!passwordValidatorRegExp.hasMatch(value) &&
            !listErrorPass.contains(invalidPassError)) {
          addError(listErrorPass, error: invalidPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          labelText: "Mật khẩu",
          hintText: "Nhập vào mật khẩu",
          enabledBorder: const OutlineInputBorder(
            gapPadding: 10,
          ),
          focusedBorder: const OutlineInputBorder(
            gapPadding: 10,
          ),
          focusedErrorBorder: const OutlineInputBorder(
              gapPadding: 10, borderSide: BorderSide(color: Colors.black)),
          errorBorder: (const OutlineInputBorder(
              gapPadding: 10, borderSide: BorderSide(color: Colors.black))),
          errorStyle: const TextStyle(height: 0, color: Colors.black),
          suffixIcon: IconButton(
              onPressed: () => setState(() {
                    passObsecure = !passObsecure;
                  }),
              icon: const Icon(
                Icons.remove_red_eye,
                size: 25,
                color: Colors.black,
              ))),
      obscureText: passObsecure,
    );
  }

  TextFormField buildConfirmField() {
    return TextFormField(
      onSaved: (newValue) => confirmPass = newValue!,
      onChanged: (value) {
        confirmPass = value;
        if (value.isNotEmpty && listErrorConfirm.contains(confirmNullError)) {
          removeError(listErrorConfirm, error: confirmNullError);
        } else if (password == value) {
          removeError(listErrorConfirm, error: matchPassError);
          print(password + "-remove");
        }
        return;
      },
      validator: (value) {
        if ((value!.isEmpty) && !listErrorConfirm.contains(confirmNullError)) {
          addError(listErrorConfirm, error: confirmNullError);
          return "";
        } else if (password != value &&
            !listErrorConfirm.contains(matchPassError)) {
          addError(listErrorConfirm, error: matchPassError);
          print(password + "-add");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          labelText: "Nhập lại mật khẩu",
          hintText: "Nhập lại mật khẩu",
          enabledBorder: const OutlineInputBorder(
            gapPadding: 10,
          ),
          focusedBorder: const OutlineInputBorder(
            gapPadding: 10,
          ),
          focusedErrorBorder: const OutlineInputBorder(
              gapPadding: 10, borderSide: BorderSide(color: Colors.black)),
          errorBorder: (const OutlineInputBorder(
              gapPadding: 10, borderSide: BorderSide(color: Colors.black))),
          errorStyle: const TextStyle(height: 0, color: Colors.black),
          suffixIcon: IconButton(
              onPressed: () => setState(() {
                    confirmObsecure = !confirmObsecure;
                  }),
              icon: const Icon(
                Icons.remove_red_eye,
                size: 25,
                color: Colors.black,
              ))),
      obscureText: confirmObsecure,
    );
  }

  TextFormField buildOTPField() {
    return TextFormField(
      maxLength: 6,
      onSaved: (newValue) => otpCode = newValue!,
      onChanged: (value) {
        otpCode = value;
        if ((value.length == 6) && listErrorOTP.contains(otpNullError)) {
          removeError(listErrorOTP, error: otpNullError);
        }
        return;
      },
      validator: (value) {
        if ((value!.isEmpty || value.length < 6) &&
            !listErrorOTP.contains(otpNullError)) {
          addError(listErrorOTP, error: otpNullError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        counterText: "",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        labelText: "Mã OTP",
        hintText: "Nhập vào mã OTP",
        enabledBorder: OutlineInputBorder(
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 10,
        ),
        focusedErrorBorder: OutlineInputBorder(
            gapPadding: 10, borderSide: BorderSide(color: Colors.black)),
        errorBorder: (OutlineInputBorder(
            gapPadding: 10, borderSide: BorderSide(color: Colors.black))),
        errorStyle: TextStyle(height: 0, color: Colors.black),
      ),
    );
  }
}
