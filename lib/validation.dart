class Validation {
  var mailformat = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var passformat = RegExp(
      r"^(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$");

  String? emailvalidation(value) {
    if (value.isEmpty) {
      return 'Fields cant be empty';
    } else if (!mailformat.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordvalidation(value) {
    if (value.isEmpty) {
      return 'Fields cant be empty';
    } else if (!passformat.hasMatch(value)) {
      return 'Please enter a valid password';
    }
    return null;
  }
}
