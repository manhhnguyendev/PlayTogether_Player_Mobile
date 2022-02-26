import 'package:flutter/material.dart';
import 'package:playtogether_player/model/player_model.dart';
//import 'package:playtogether_player/screen/user_profile_details_srceen/user_profile_details_page.dart';

class UserAccountPage extends StatefulWidget {
  static String routeName = 'UserAccount';
  final PlayerModel playerModel;

  const UserAccountPage({Key? key, required this.playerModel})
      : super(key: key);
  @override
  _UserAccountPageState createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  String profileLink = "assets/images/defaultprofile.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Row(
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(profileLink),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Player Name',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(
                          //     context, UserProfilePage.routeName);
                        },
                        child: Row(
                          children: [
                            Text(
                              'Chỉnh sửa tài khoản',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Số dư trong ví:',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '500.000' + ' vnđ',
                          style:
                              TextStyle(fontSize: 22, color: Color(0xff320444)),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(border: Border.all()),
                    height: 70,
                    width: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 30,
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Text(
                            'Nạp tiền',
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff320444)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(15, 25, 15, 5),
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Row(
          //       children: [
          //         Text(
          //           'Lịch sử nạp tiền',
          //           style: TextStyle(fontSize: 20),
          //         ),
          //         Spacer(),
          //         Icon(
          //           Icons.arrow_forward_ios,
          //           color: Colors.grey,
          //           size: 15,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          //   child: Divider(
          //     thickness: 1,
          //     color: Colors.grey,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Row(
          //       children: [
          //         Text(
          //           'Danh sách theo dõi',
          //           style: TextStyle(fontSize: 20),
          //         ),
          //         Spacer(),
          //         Icon(
          //           Icons.arrow_forward_ios,
          //           color: Colors.grey,
          //           size: 15,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          //   child: Divider(
          //     thickness: 1,
          //     color: Colors.grey,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Row(
          //       children: [
          //         Text(
          //           'Thay đổi mật khẩu',
          //           style: TextStyle(fontSize: 20),
          //         ),
          //         Spacer(),
          //         Icon(
          //           Icons.arrow_forward_ios,
          //           color: Colors.grey,
          //           size: 15,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          //   child: Divider(
          //     thickness: 1,
          //     color: Colors.grey,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Row(
          //       children: [
          //         Text(
          //           'Chính sách',
          //           style: TextStyle(fontSize: 20),
          //         ),
          //         Spacer(),
          //         Icon(
          //           Icons.arrow_forward_ios,
          //           color: Colors.grey,
          //           size: 15,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          //   child: Divider(
          //     thickness: 1,
          //     color: Colors.grey,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Row(
          //       children: [
          //         Text(
          //           'Trung tâm hỗ trợ',
          //           style: TextStyle(fontSize: 20),
          //         ),
          //         Spacer(),
          //         Icon(
          //           Icons.arrow_forward_ios,
          //           color: Colors.grey,
          //           size: 15,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          //   child: Divider(
          //     thickness: 1,
          //     color: Colors.grey,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Row(
          //       children: [
          //         Text(
          //           'Đăng xuất',
          //           style: TextStyle(fontSize: 20),
          //         ),
          //         Spacer(),
          //         Icon(
          //           Icons.logout,
          //           color: Colors.grey,
          //           size: 15,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          //   child: Divider(
          //     thickness: 1,
          //     color: Colors.grey,
          //   ),
          // ),
        ],
      ),
    );
  }
}
