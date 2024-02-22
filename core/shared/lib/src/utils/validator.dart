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
}
