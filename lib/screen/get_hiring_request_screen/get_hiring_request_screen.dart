import 'package:flutter/material.dart';
import 'package:playtogether_player/screen/hiring_stage_screen/hiring_stage_page.dart';
import 'package:playtogether_player/shared_component/decline_button.dart';
import 'package:playtogether_player/shared_component/second_main_button.dart';

class GetHiringRequestPage extends StatefulWidget {
  static String routeName = 'GetHiringRequest';
  //const GetHiringRequestPage({ Key? key }) : super(key: key);

  @override
  _GetHiringRequestPageState createState() => _GetHiringRequestPageState();
}

class _GetHiringRequestPageState extends State<GetHiringRequestPage> {
  bool checkFirstTime = true;
  String profileLink = "assets/images/defaultprofile.png";
  String firstMessage = 'Alo alo?';
  bool isDonate = false;
  String? choosenCharity;
  List<DropdownMenuItem<String>> listDrop = [];
  List<String> drop = ['Chữ thập đỏ', 'Chùa', 'Vùng quê xa'];

  void loadData() {
    listDrop = [];
    listDrop = drop
        .map((val) => DropdownMenuItem<String>(
              child: Text(val),
              value: val,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (checkFirstTime) {
      loadData();
      checkFirstTime = false;
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
              onPressed: () {},
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
              'Yêu cầu nhận được',
              style: TextStyle(fontSize: 22),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(profileLink),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Hirer Name',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Thời lượng: ',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Spacer(),
                                Text(
                                  '2' + ' giờ',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Chi phí: ',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Spacer(),
                                Text(
                                  '1.000.000' + 'đ',
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          ],
                        ),
                      ))
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text('Lời nhắn:', style: TextStyle(fontSize: 18))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
            child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all()),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    firstMessage,
                    style: TextStyle(fontSize: 18),
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Nhắn tin ',
                      style: TextStyle(
                          fontSize: 18, decoration: TextDecoration.underline)),
                  Icon(
                    Icons.message_outlined,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              children: [
                Text(
                  'Đồng ý từ thiện toàn bộ số tiền:',
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Container(
                  height: 50,
                  width: 50,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Checkbox(
                      activeColor: Color(0xff8980FF),
                      value: isDonate,
                      onChanged: (value) => setState(
                        () => isDonate = value!,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: buildProvinceField(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(
              children: [
                SecondMainButton(
                    text: 'Chấp nhận',
                    onpress: () {
                      Navigator.pushNamed(context, HiringPage.routeName);
                    },
                    height: 50,
                    width: 300),
                DeclineButton(
                    text: 'Từ chối', onpress: () {}, height: 50, width: 300)
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildProvinceField() {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      height: 50,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            value: choosenCharity,
            items: listDrop,
            hint: const Text('Lựa chọn hội từ thiện: '),
            iconSize: 40.0,
            elevation: 16,
            onChanged: (value) {
              choosenCharity = value as String;
              setState(() {
                choosenCharity = value;
                print(choosenCharity);
              });
            },
          ),
        ),
      ),
    );
  }
}
