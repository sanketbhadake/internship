class Validation {
  static RegExp regExp = RegExp(r'^[a-z]');

  static String? userValidation(String userName) {
    if (userName.length < 6 || userName.length > 15) {
      return "Username length must be between 6 and 15 characters.";
    }
    if (!regExp.hasMatch(userName)) {
      return "Username must starts with an lowercase.";
    }
    if (userName.contains(" ")) {
      return "Username must not contain spaces.";
    }
    if (!RegExp(r'[0-9]').hasMatch(userName)) {
      return "username must contain with a digit & underscore.";
    }
    if (!RegExp(r'[_]').hasMatch(userName)) {
      return "username must contain with a underscore.";
    }
    if (RegExp(r'[@#\$%&!]').hasMatch(userName)) {
      return "Username must not contain special character (@ # \$ % & !)";
    }

    return null;
  }

  static String? passwordValidation(String userName, String password) {
    if (password.length < 8 || password.length > 20) {
      return "Password length must be between 8 and 20 characters.";
    }
    if (password == userName) {
      return "Password must not same as username";
    }
    if (password.contains(" ")) {
      return "Password must not contain spaces.";
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return "Password must contain with a Uppercase letter.";
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return "Password must contain with a Lowercase letter.";
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {

      return "Password must contain with a digit.";
    }
    if (!RegExp(r'[@#\$%&!]').hasMatch(password)) {
      return "Password must contain at least one special character (@ # \$ % & !)";
    }
    if (password.contains(userName)) {
      return "Password must not contain the username";
    }
    if (repeatText(password)) {
      return "No character may repeat more than two times consecutively";
    }
    return null;
  }

  static bool repeatText(String pass) {
    for (int i = 0; i < pass.length - 2; i++) {
      if (pass[i] == pass[i + 1] && pass[i] == pass[i + 2]) {
        return true;
      }
    }
    return false;
  }
}
