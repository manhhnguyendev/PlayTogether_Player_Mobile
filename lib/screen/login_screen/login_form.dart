import 'package:flutter/material.dart';
import 'package:playtogether_player/model/hirer_model.dart';
import 'package:playtogether_player/model/login_model.dart';
import 'package:playtogether_player/helper/helper.dart' as helper;
import 'package:playtogether_player/const.dart';
import 'package:playtogether_player/model/player_model.dart';
import 'package:playtogether_player/screen/home_screen/home_page.dart';
import 'package:playtogether_player/services/player_service.dart';
import 'package:playtogether_player/shared_component/login_error_form.dart';
import 'package:playtogether_player/shared_component/main_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  final List listError = [''];
  bool obsecure = true;

  late PlayerModel _playerModel;
  Widget getScreen() {
    return HomePage(playerModel: _playerModel);
  }

  void addError({String? error}) {
    if (!listError.contains(error)) {
      setState(() {
        listError.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (listError.contains(error)) {
      setState(() {
        listError.remove(error);
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
                const SizedBox(
                  height: 15,
                ),
                buildPasswordField(),
                FormError(listError: listError),
                //SizedBox(height: 10,),
              ],
            ),
          ),
          MainButton(
            text: "ĐĂNG NHẬP",
            onpress: () {
              // if (_formKey.currentState == null) {
              //   print("_formKey.currentState is null!");
              // } else if (_formKey.currentState!.validate()) {
              //   _formKey.currentState!.save();
              //   if (listError.length == 1) {}
              // }

              //LOGIN
              // setState(() {
              //   Future<LoginModel> loginModelFuture =
              //       HirerService().login(email, password);

              //   loginModelFuture.then((value) {
              //     if (value != null) {
              //       print("khong null");
              //       print(value.toString());
              //     } else
              //       print("null roi");
              //   setState(() {
              //     if (value != null) {
              //       Future<HirerModel> userModelFuture =
              //           HirerService().getHirerProfile(value.token);
              //       userModelFuture.then((hirer) {
              //         setState(() {
              //           if (hirer != null) {
              //             _hirerModel = hirer;
              //             helper.pushInto(context, getScreen(), true);
              //           }
              //         });
              //       });
              //     } else {
              //       print("Tên đăng nhập hoặc mật khẩu không chính xác");
              //     }
              //   });
              //   });
              // });

              // setState(() {
              //   Future<PlayerModel> userModelFuture = PlayerService()
              //       .getPlayerProfile(
              //           "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6ImJlYzdiOTRkLTFhOTItNDBjMy05ZmJiLWRhNjM5MzA1MWI5ZSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiYmVjN2I5NGQtMWE5Mi00MGMzLTlmYmItZGE2MzkzMDUxYjllIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6InRlc3R1c2VyQGV4YW1wbGUuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoidGVzdHVzZXJAZXhhbXBsZS5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJoaXJlciIsImV4cCI6MTY0NDkyMjMwNX0.fkcg1t38GvXmTByw-4ThE74zVoPp-fg2-iablKlUlG8");
              //   userModelFuture.then((player) {
              //     setState(() {
              //       if (player != null) {
              //         _playerModel = player as PlayerModel;
              //         helper.pushInto(context, getScreen(), true);
              //       }
              //     });
              //   });
              // });
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        password = value;
        if (value.isNotEmpty && listError.contains(passNullError)) {
          removeError(error: passNullError);
        }
        return;
      },
      validator: (value) {
        if ((value!.isEmpty) && !listError.contains(passNullError)) {
          addError(error: passNullError);
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
          errorBorder: const OutlineInputBorder(
              gapPadding: 10, borderSide: BorderSide(color: Colors.black)),
          focusedErrorBorder: const OutlineInputBorder(
              gapPadding: 10, borderSide: BorderSide(color: Colors.black)),
          errorStyle: const TextStyle(height: 0, color: Colors.black),
          suffixIcon: IconButton(
              onPressed: () => setState(() {
                    obsecure = !obsecure;
                  }),
              icon: const Icon(
                Icons.remove_red_eye,
                size: 25,
                color: Colors.black,
              ))),
      obscureText: obsecure,
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        email = value;
        if (value.isNotEmpty && listError.contains(emailNullError)) {
          removeError(error: emailNullError);
        } else if (emailValidatorRegExp.hasMatch(value) &&
            listError.contains(invalidEmailError)) {
          removeError(error: invalidEmailError);
        }
        return;
      },
      validator: (value) {
        if ((value!.isEmpty) && !listError.contains(emailNullError)) {
          addError(error: emailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !listError.contains(invalidEmailError)) {
          addError(error: invalidEmailError);
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
}
