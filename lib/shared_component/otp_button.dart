import 'package:flutter/material.dart';

class OTPButton extends StatefulWidget {
  const OTPButton({Key? key}) : super(key: key);

  @override
  _OTPButtonState createState() => _OTPButtonState();
}

class _OTPButtonState extends State<OTPButton> {
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
            child: const Text("Lấy mã OTP",
                style: TextStyle(color: Colors.white, fontSize: 13.5)),
          ),
        ),
      ),
    );
  }
}
