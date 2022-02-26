class HirerModel {
  late String email;
  late String password;
  late String confirmPassword;
  late String firstname;
  late String lastname;
  late String city;
  late String dateOfBirth;
  late bool gender;
  late bool confirmEmail;
  late dynamic token;

  HirerModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.firstname,
    required this.lastname,
    required this.city,
    required this.dateOfBirth,
    required this.gender,
    required this.confirmEmail,
    required this.token,
  });

  factory HirerModel.fromJson(Map<String, dynamic> json) => HirerModel(
        email: json['email'] as String,
        password: json['password'] as String,
        confirmPassword: json['confirmPassword'] as String,
        firstname: json['firstname'] as String,
        lastname: json['lastname'] as String,
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
        "firstname": firstname,
        "lastname": lastname,
        "city": city,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "confirmEmail": confirmEmail,
      };
}
