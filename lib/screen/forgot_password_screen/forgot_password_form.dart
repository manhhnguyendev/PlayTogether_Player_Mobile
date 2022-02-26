import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playtogether_player/const.dart';
import 'package:playtogether_player/screen/change_password_screen/change_password_page.dart';
import 'package:playtogether_player/shared_component/login_error_form.dart';
import 'package:playtogether_player/shared_component/main_button.dart';
import 'package:playtogether_player/shared_component/otp_button.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String otpCode = "";
  final List listErrorEmail = [''];
  final List listErrorOTP = [''];

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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                buildEmailField(),
                FormError(listError: listErrorEmail),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(flex: 2, child: buildOTPField()),
                    const Expanded(flex: 1, child: OTPButton()),
                  ],
                ),
                FormError(listError: listErrorOTP),
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
                if (listErrorEmail.length == 1 &&
                    //vi` luc khai bao 4 cai list , co 1 phan tu "" san trong list nen length = 1;
                    listErrorOTP.length == 1) {
                  Navigator.pushNamed(context, ChangePasswordPage.routeName);
                }
              }
            },
          ),
        ],
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
          //removeError(inputListError: listErrorEmail, error: emailNullError);
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

  TextFormField buildOTPField() {
    return TextFormField(
      onSaved: (newValue) => otpCode = newValue!,
      maxLength: 6,
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
