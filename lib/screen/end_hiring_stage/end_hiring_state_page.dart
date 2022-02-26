import 'package:flutter/material.dart';
import 'package:playtogether_player/shared_component/decline_button.dart';
import 'package:playtogether_player/shared_component/second_main_button.dart';

class EndHiringStage extends StatefulWidget {
  static String routeName = 'EngHiring';
  //const EndHiringStage({ Key? key }) : super(key: key);

  @override
  _EndHiringStageState createState() => _EndHiringStageState();
}

class _EndHiringStageState extends State<EndHiringStage> {
  String profileLink = "assets/images/defaultprofile.png";
  String profileLink2 = "assets/images/defaultprofile.png";
  bool isDonate = true;
  String charityName = 'Chữ thập đỏ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              )),
        ),
      ]),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'Kết thúc',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(profileLink),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Player name",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/logo2-notext.png"),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(profileLink),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Player name2",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.15,
                ),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 25, 10),
            child: Row(
              children: [
                Text(
                  'Thời lượng thuê ',
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Text(
                  '2',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  ' giờ',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 25, 10),
            child: Row(
              children: [
                Text(
                  'Tổng chi phí ',
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Text(
                  '1.000.000',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  ' đ',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.15,
              ),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Visibility(
                  visible: isDonate,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Từ thiện toàn bộ số tiền nhận vào tổ chức:',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        charityName,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // SecondMainButton(
          //     text: 'Kết thúc', onpress: () {}, height: 50, width: 250),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: SecondMainButton(
              text: 'Kết thúc', onpress: () {}, height: 50, width: 0),
        ),
      ),
    );
  }
}
