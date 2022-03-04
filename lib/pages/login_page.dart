import 'package:flutter/material.dart';
import 'package:playtogether_player/models/hirer_model.dart';
import 'package:playtogether_player/helpers/helper.dart' as helper;
import 'package:playtogether_player/constants/const.dart';
import 'package:playtogether_player/models/player_model.dart';
import 'package:playtogether_player/pages/forgot_password_page.dart';
import 'package:playtogether_player/pages/home_page.dart';
import 'package:playtogether_player/pages/register_page.dart';
import 'package:playtogether_player/services/player_service.dart';
import 'package:playtogether_player/widgets/login_error_form.dart';
import 'package:playtogether_player/widgets/main_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  late FirebaseAuth _auth;
  late GoogleSignIn _googleSignIn;

  Future<User> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final User user = (await _auth.signInWithCredential(credential)).user;
    print("Id Token: " + googleAuth.idToken);
    return user;
  }

  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  final List listError = [''];
  bool obsecure = true;

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
            ),
          ),
          SizedBox(
            height: size.height / 40,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RegisterPage.routeName),
                child: const Text(
                  'Tạo tài khoản?',
                  style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, ForgotPasswordPage.routeName),
                child: const Text(
                  'Quên mật khẩu?',
                  style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ]),
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
            child: Container(
              height: 70,
              alignment: Alignment.center,
              child: Scaffold(
                body: FutureBuilder(
                    future: _initialization,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        _auth = FirebaseAuth.instance;
                        _googleSignIn = GoogleSignIn();
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 1),
                          width: size.width * 0.95,
                          height: size.height / 15,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              //side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: FlatButton(
                                color: const Color.fromRGBO(219, 68, 50, 1),
                                //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                                onPressed: () {
                                  // dynamic result = await _handleSignIn();
                                  dynamic result = _handleSignIn();
                                  print("qua buoc 1");
                                  print(result);
                                  setState(() {
                                    if (result != null) {
                                      print("ko null ne em oi");
                                      // helper.pushInto(
                                      //   context,
                                      //   HomePage(),
                                      //   true,
                                      // );
                                    } else
                                      print("null roi ne");
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: size.width * 0.1,
                                      height: size.height * 0.1,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/logingg.png"),
                                              fit: BoxFit.cover)),
                                    ),
                                    //Spacer(),
                                    const Text("ĐĂNG NHẬP BẰNG GOOGLE",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return Container();
                    }),
              ),
            ),
          ),
        ]),
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
