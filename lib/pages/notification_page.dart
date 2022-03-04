import 'package:flutter/material.dart';
import 'package:playtogether_player/models/player_model.dart';
import 'package:playtogether_player/widgets/bottom_bar.dart';

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'Thông báo',
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
        // bottomNavigationBar: BottomBar(
        //   playerModel: widget.playerModel,
        //   bottomBarIndex: 2,
        // ),
      ),
    );
  }
}
