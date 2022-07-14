class Validators {
  static String? validateName({required String? name}) {
    if (name == null || name.isEmpty) {
      return 'Name can\'t be empty';
    }

    return null;
  }

  static String? validateUname({required String? name}) {
    if (name == null || name.isEmpty) {
      return 'UserName can\'t be empty';
    }

    return null;
  }

  static String? validateEmail({required String? email}) {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email == null || email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }

    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null || password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }
}
