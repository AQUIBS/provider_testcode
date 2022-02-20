import 'package:flutter/cupertino.dart';

class HomePageProvider with ChangeNotifier {
  bool? isEligible;
  String? elgibilityMessage = " ";

  void checkEligibility(int age) {
    if (age >= 18) {
      isEligible = true;
      elgibilityMessage = "You are Eligible";
      notifyListeners();
    } else {
      isEligible = false;
      elgibilityMessage = "Sorry you are not Eligible";
      notifyListeners();
    }
  }
}
