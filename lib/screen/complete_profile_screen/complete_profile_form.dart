import 'package:flutter/material.dart';
import 'package:playtogether_player/const.dart';
import 'package:playtogether_player/shared_component/login_error_form.dart';
import 'package:playtogether_player/shared_component/main_button.dart';
import 'package:playtogether_player/shared_component/main_goback_button.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final initialDate = DateTime.now();
  String firstName = "";
  String lastName = "";
  late DateTime rawBirthday;
  ValueNotifier<String> notiBirth = ValueNotifier<String>("Ngày sinh của bạn");
  bool gender = true;
  final tec = TextEditingController();
  List<DropdownMenuItem<String>> listDrop = [];
  List<String> drop = [
    'An Giang',
    'Bà Rịa - Vũng Tàu',
    'Bắc Giang',
    'Bắc Kạn',
    'Bạc Liêu',
    'Bắc Ninh',
    'Bến Tre',
    'Bình Định',
    'Bình Dương',
    'Bình Phước',
    'Bình Thuận',
    'Cà Mau',
    'Cần Thơ',
    'Cao Bằng',
    'Đà Nẵng',
    'Đắk Lắk',
    'Đắk Nông',
    'Điện Biên',
    'Đồng Nai',
    'Đồng Tháp',
    'Gia Lai',
    'Hà Giang',
    'Hà Nam',
    'Hà Nội',
    'Hà Tĩnh',
    'Hải Dương',
    'Hải Phòng',
    'Hậu Giang',
    'Hòa Bình',
    'Hưng Yên',
    'Khánh Hòa',
    'Kiên Giang',
    'Kon Tum',
    'Lai Châu',
    'Lâm Đồng',
    'Lạng Sơn',
    'Lào Cai',
    'Long An',
    'Nam Định',
    'Nghệ An',
    'Ninh Bình',
    'Ninh Thuận',
    'Phú Thọ',
    'Phú Yên',
    'Quảng Bình',
    'Quảng Nam',
    'Quảng Ngãi',
    'Quảng Ninh',
    'Quảng Trị',
    'Sóc Trăng',
    'Sơn La',
    'Tây Ninh',
    'Thái Bình',
    'Thái Nguyên',
    'Thanh Hóa',
    'Thừa Thiên Huế',
    'Tiền Giang',
    'TP Hồ Chí Minh',
    'Trà Vinh',
    'Tuyên Quang',
    'Vĩnh Long',
    'Vĩnh Phúc',
    'Yên Bái',
  ];
  String? province;
  final List listErrorFirstName = [''];
  final List listErrorLastName = [''];
  final List listErrorBirthday = ['', birthdayNullError];
  final List listErrorProvince = [''];

  void loadData() {
    listDrop = [];
    listDrop = drop
        .map((val) => DropdownMenuItem<String>(
              child: Text(val),
              value: val,
            ))
        .toList();
  }

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

  void convertBirthday() {
    if (rawBirthday == null) {
      notiBirth.value = "Ngày sinh của bạn";
    } else {
      notiBirth.value =
          '${rawBirthday.day}/${rawBirthday.month}/${rawBirthday.year}';
    }
  }

  @override
  void initState() {
    notiBirth = ValueNotifier<String>("Ngày sinh của bạn");
    notiBirth.addListener(() {
      tec.text = notiBirth.value;
      if (tec.text != "Ngày sinh của bạn" &&
          tec.text.isNotEmpty &&
          listErrorBirthday.contains(birthdayNullError)) {
        listErrorBirthday.remove(birthdayNullError);
      } else if ((tec.text == "Ngày sinh của bạn" || tec.text.isEmpty) &&
          !listErrorBirthday.contains(birthdayNullError)) {
        listErrorBirthday.add(birthdayNullError);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(flex: 1, child: buildFirstNameField()),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(flex: 1, child: buildLastNameField()),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: FormError(listError: listErrorFirstName)),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        flex: 1,
                        child: FormError(listError: listErrorLastName)),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: buildProvinceField(),
                          flex: 7,
                        ),
                        const Expanded(
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Color.fromARGB(220, 100, 100, 100),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildBirthdayField(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              "Giới tính:",
                              style: TextStyle(
                                  color: Color.fromARGB(220, 100, 100, 100),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              child: buildGenderSelection()),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          MainButton(
              text: "HOÀN TẤT",
              onpress: () {
                if (_formKey.currentState == null) {
                  print("_formKey.currentState is null!");
                } else if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  if (listErrorFirstName.length ==
                          1 && //vi` luc khai bao 4 cai list , co 1 phan tu "" san trong list nen length = 1;
                      listErrorLastName.length == 1 &&
                      listErrorProvince.length == 1 &&
                      listErrorBirthday.length == 1) {
                    print("ALL VALID");
                  }
                }
              }),
          GoBackButton(text: "QUAY LẠI ", onpress: () {}),
        ],
      ),
    );
  }

  TextFormField buildFirstNameField() {
    return TextFormField(
      maxLength: 30,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => firstName = newValue!,
      onChanged: (value) {
        firstName = value;
        if (value.isNotEmpty &&
            listErrorFirstName.contains(firstNameNullError)) {
          removeError(listErrorFirstName, error: firstNameNullError);
        }
        return;
      },
      validator: (value) {
        if ((value!.isEmpty) &&
            !listErrorFirstName.contains(firstNameNullError)) {
          addError(listErrorFirstName, error: firstNameNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        counterText: "",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        labelText: "Họ",
        hintText: "Nhập vào họ",
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

  TextFormField buildLastNameField() {
    return TextFormField(
      maxLength: 30,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => lastName = newValue!,
      onChanged: (value) {
        lastName = value;
        if (value.isNotEmpty && listErrorLastName.contains(lastNameNullError)) {
          removeError(listErrorLastName, error: lastNameNullError);
        }
        return;
      },
      validator: (value) {
        if ((value!.isEmpty) &&
            !listErrorLastName.contains(lastNameNullError)) {
          addError(listErrorLastName, error: lastNameNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        counterText: "",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        labelText: "Tên",
        hintText: "Nhập vào tên",
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

  Container buildGenderSelection() {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Radio(
                    activeColor: Color(0xff320444),
                    value: true,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = true;
                        print("Nam");
                      });
                    }),
                const Text("Nam")
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Radio(
                    activeColor: Color(0xff320444),
                    value: false,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = false;
                        print("Nữ");
                      });
                    }),
                const Text("Nữ"),
              ],
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildBirthdayField() {
    return TextFormField(
      controller: tec,
      onSaved: (newValue) {
        notiBirth.value = newValue!;
      },
      decoration: const InputDecoration(
        counterText: "",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        labelText: "Sinh nhật của bạn",
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
        suffixIcon: Icon(
          Icons.calendar_today,
        ),
      ),
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(DateTime.now().year - 100),
          lastDate: DateTime(DateTime.now().year + 1),
        ).then((date) {
          rawBirthday = date!;
          convertBirthday();
          print(notiBirth.value);
        });
      },
    );
  }

  Container buildProvinceField() {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          value: province,
          items: listDrop,
          hint: const Text('Thành phố sinh'),
          iconSize: 0.0,
          elevation: 16,
          onChanged: (value) {
            province = value as String;
            setState(() {
              province = value;
              print(province);
            });
          },
        ),
      ),
    );
  }
}
