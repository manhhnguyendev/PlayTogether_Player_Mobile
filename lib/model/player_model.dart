class PlayerModel {
  late String email;
  late String password;
  late String confirmPassword;
  late String firsName;
  late String lastName;
  late String city;
  late String dateOfBirth;
  late bool gender;
  late bool confirmEmail;
  late dynamic token;

  PlayerModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.firsName,
    required this.lastName,
    required this.city,
    required this.dateOfBirth,
    required this.gender,
    required this.confirmEmail,
    required this.token,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        email: json['email'] as String,
        password: json['password'] as String,
        confirmPassword: json['confirmPassword'] as String,
        firsName: json['firsName'] as String,
        lastName: json['lastName'] as String,
        city: json['city'] as String,
        dateOfBirth: json['dateOfBirth'] as String,
        gender: json['gender'] as bool,
        confirmEmail: json['confirmEmail'] as bool,
        token: json['token'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "firsName": firsName,
        "lastName": lastName,
        "city": city,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "confirmEmail": confirmEmail,
      };
}
