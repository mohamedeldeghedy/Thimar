String? validatePassword(String? value,) {
  if (value!.isEmpty) {
    return 'password must not be empty';
  }
  return null;
}
String? itemValidate(String? value, {required String title}) {
  if (value!.isEmpty) {
    return '$title must not be empty';
  }
  return null;
}
String? validateName(String? value,) {
  if (value!.isEmpty) {
    return 'name must not be empty';
  }
  return null;
}
String? validatePhone(String? value,) {
  if (value!.isEmpty) {
    return 'phone must not be empty';
  }
  return null;
}
// String? validatePassword(String? value,int? length) {
//   if (value!.isEmpty) {
//     return 'password must not be empty';
//   }
//   return null;
// }
