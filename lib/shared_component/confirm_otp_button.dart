import 'package:flutter/material.dart';

class ConfirmOTPButton extends StatefulWidget {
  const ConfirmOTPButton({Key? key}) : super(key: key);

  @override
  _ConfirmOTPButtonState createState() => _ConfirmOTPButtonState();
}

class _ConfirmOTPButtonState extends State<ConfirmOTPButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      width: size.width,
      height: size.height / 14,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          //side: BorderSide(color: Colors.black, width: 1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: FlatButton(
            color: const Color.fromRGBO(165, 165, 165, 1),
            //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            onPressed: () {},
            child: const Text("Xác thực",
                style: TextStyle(color: Colors.white, fontSize: 13.5)),
          ),
        ),
      ),
    );
  }
}
