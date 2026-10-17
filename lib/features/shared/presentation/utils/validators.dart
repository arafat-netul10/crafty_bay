class Validators {
  String? validateInput(String? input, String message) {
    if (input == null || input.isEmpty) {
      return message;
    }
    return null;
  }

  String? validateName(String? input) {
    if(input == null || input.isEmpty){
      return "Please enter your name";
    }
    return null;
  }

  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return "Please enter your email";
    }

    if (input.contains("@") == false) {
      return "Please enter a valid email";
    }
    if (input == '') {
      return "Please enter valid email";
    }
    return null;
  }

  String? validateCity(String? input) {
    if(input == null || input.isEmpty){
      return "Please enter your city";
    }
    return null;
  }

  String? validateMobile(String? input) {
    if(input == null || input.isEmpty){
      return "Please enter your mobile number";
    }
    return null;
  }

  String? validatePassword(String? input) {
    if (input == null || input.isEmpty) {
      return "Please enter your password";
    }

    if (input.length < 8) {
      return "Password must be at least 8 characters";
    }

    return null;
  }

  String? validateConfirmPassword(String? input) {
    if (input == null || input.isEmpty) {
      return "Please enter your password";
    }

    return null;
  }
}
