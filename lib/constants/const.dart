// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final RegExp passwordValidatorRegExp =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,30}$');

const String emailNullError = "- Vui lòng nhập email !";
const String invalidEmailError = "- Email nhập không đúng định dạng !";
const String passNullError = "- Vui lòng nhập mật khẩu !";
const String invalidPassError =
    "- Mật khẩu 8-30 kí tự, có 1 số, 1 chữ hoa và kí tự đặc biệt";
const String matchPassError = "- Mật khẩu xác nhận không trùng khớp !";
const String confirmNullError = "- Mật khẩu xác nhận lại chưa được nhập !";
const String namelNullError = "- Vui lòng nhập họ tên !";
const String otpNullError = "- Mã OTP chưa đủ 6 kí tự số !";
const String firstNameNullError = "- Vui lòng nhập họ";
const String lastNameNullError = "- Vui lòng nhập tên";
const String birthdayNullError = "- Vui lòng nhập ngày sinh";
const String cityNullError = "- Vui lòng chọn nơi sinh sống";
// const String kPhoneNumberNullError = "Please Enter your phone number";