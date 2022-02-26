import 'package:flutter/material.dart';
import 'package:playtogether_player/constants/config_json.dart';
import 'package:playtogether_player/model/player_model.dart';
import 'package:playtogether_player/shared_component/main_button.dart';
import 'package:playtogether_player/shared_component/second_main_button.dart';
import 'package:playtogether_player/shared_component/bottom_bar.dart';

class HomePage extends StatefulWidget {
  static String routeName = 'HomePage';
  final PlayerModel playerModel;
  const HomePage({Key? key, required this.playerModel}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checkFirstTime = true;
  bool ready = false;
  int choosenTime = 1;
  int maxHour = 5;
  List<int> listHour = [];
  List<String> listTop3Hirer = ['aaa', 'bbb', 'ccc'];

  void createHourList() {
    for (var i = 1; i <= maxHour; i++) {
      listHour.add(i);
    }
    choosenTime = listHour[0];
  }

  @override
  Widget build(BuildContext context) {
    if (checkFirstTime) {
      createHourList();
      checkFirstTime = false;
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          title: const Text(
            'Trạng thái hiện tại',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("assets/images/logonotext.png"),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.center,
                child: Text(
                  'Có thể thuê',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Row(
                children: [
                  Text(
                    'Sẵn sàng nhận thuê',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 60,
                    width: 80,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch(
                          activeColor: Color(0xff8980FF),
                          value: ready,
                          onChanged: (value) {
                            setState(() {
                              ready = value;
                            });
                          }),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Row(
                children: [
                  Text(
                    'Số giờ tối đa',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Spacer(),
                  Container(
                    width: 80,
                    child: DropdownButton(
                      //underline: SizedBox.shrink(),
                      isExpanded: true,
                      value: choosenTime,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: listHour.map((item) {
                        return DropdownMenuItem(
                            child: new Text(item.toString()), value: item);
                      }).toList(),
                      onChanged: (value) {
                        choosenTime = int.parse(value.toString());
                        setState(() {
                          choosenTime = int.parse(value.toString());
                        });
                      },
                    ),
                  ),
                  Text(
                    ' giờ',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
              child: Row(
                children: [
                  Text(
                    'Chi phí mỗi giờ',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Spacer(),
                  Text('500.000',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  Text('đ',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: SecondMainButton(
                  text: 'Cập nhật', onpress: () {}, height: 50, width: 200),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Tỷ lệ hoàn thành',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.pie_chart,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '100' + '%',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.green),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Theo ngày',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.pie_chart,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '100' + '%',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.green),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Theo tháng',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 1,
                        width: 1,
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(
                                'Đánh giá',
                                style: TextStyle(
                                    fontSize: 16,
                                    decoration: TextDecoration.underline),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.star,
                                size: 50,
                                color: Colors.yellow,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '4.5',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Doanh thu',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '1.000.000' + 'đ',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.green),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Theo ngày',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text(
                                '15.000.000' + 'đ',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.green),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Theo tháng',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Top người thuê',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: List.generate(
                          listTop3Hirer.length,
                          (index) => topHirerText(listTop3Hirer[index], index),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        playerModel: widget.playerModel,
        bottomBarIndex: 2,
      ),
    );
  }

  Container topHirerText(String name, int index) {
    int realIndex = index + 1;
    return Container(
      height: 25,
      alignment: Alignment.centerLeft,
      child: (Text(
        '#$realIndex' + name,
        style: const TextStyle(color: Colors.black, fontSize: 15),
      )),
    );
  }
}
