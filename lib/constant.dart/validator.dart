class Validator {
  Validator._();

  static String? validateName(String? value) {
    // Remove leading and trailing white spaces

    if (value!.length <= 2) {
      return 'Please enter at least 3 characters';
    }

    return null; // Return null if the full name is valid
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required.';
    }

    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z\d-]+(\.[a-zA-Z\d-]+)*\.[a-zA-Z\d-]+$');
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    RegExp regex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{3,6}$');
    if (password == null || password.isEmpty) {
      return 'Password is required.';
    }
    if (!regex.hasMatch(password)) {
      return 'Enter valid password of length 6 and contains uppercase, digit and special character';
    }

    // You can add more specific password validation rules here

    return null;
  }

  static String? confirmPassword(String? password1, String? password2) {
    if (password1 == null || password2 == null) {
      return 'Password is required.';
    }
    if (password1 != password2) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? validateCode(String? code) {
    if (code == null) {
      return 'Parent code is required.';
    }
    if (code.length < 6 || code.length > 8) {
      return 'Parent code should be of length 6 - 8';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    // Regular expression pattern for phone numbers (assumes 10 digits)
    final RegExp regex = RegExp(r'^[0-9]{11}$');

    if (!regex.hasMatch(value!)) {
      return 'Please enter a valid 11-digit phone number';
    }

    return null; // Return null if the phone number is valid
  }

  static String? validateFundAmount(double? fund) {
    if (fund == null || fund < 500 || fund > 49900) {
      return 'Fund amount should be between 500 and 49900';
    }
    // You can add more specific password validation rules here

    return null;
  }

  static String? validateEmptyOrMaxiMin(String? value, int min, int max) {
    // Remove leading and trailing white spaces
    if (value!.isEmpty) {
      return 'Please enter at least $min characters';
    }
    if (value.length < min) {
      return 'Please enter at least $min characters';
    }
    if (value.length > max) {
      return 'Please enter at most $max characters';
    }

    return null; // Return null if the full name is valid
  }

  static String? validateMaxiMin(String? value, int min, int max) {
    // Remove leading and trailing white spaces
    if (value!.length < min) {
      return 'Please enter at least $min character(s)';
    }
    if (value.length > max) {
      return 'Please enter at most $max characters';
    }

    return null; // Return null if the full name is valid
  }
}
