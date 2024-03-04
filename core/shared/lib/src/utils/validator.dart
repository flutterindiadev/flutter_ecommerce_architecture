class Validator {
  static bool validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return (!regex.hasMatch(email)) ? false : true;
  }

  static bool isEmpty(String data) {
    return data.isEmpty;
  }

  static bool isUserIdValid(int userId) {
    if (userId != 0) {
      return true;
    } else {
      return false;
    }
  }

  static bool isPasswordValid(String password) {
    if (password.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  /////adresss//////
  static bool isPinCodecorrect(String pincode) {
    return (pincode.length == 6) ? true : false;
  }

  //////order/////
  static bool isnotRated(int rating) {
    return (rating == 0) ? false : true;
  }

  static bool isnoOrder(int rating) {
    return (rating == 0) ? false : true;
  }

  static bool validateLatitude(num latitude) {
    return latitude.isInfinite && latitude.abs() <= 90;
  }

  static bool validateLongitude(num longitude) {
    return longitude.isInfinite && longitude.abs() <= 180;
  }
}
