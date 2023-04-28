import 'package:flutter/foundation.dart';

class CounterLifeProvider extends ChangeNotifier {
  int counterPlayer1 = 20;
  int counterPlayer2 = 20;

  void incrementCounterPlayer1() {
    counterPlayer1++;
    notifyListeners();
  }

  void decrementCounterPlayer1() {
    counterPlayer1--;
    notifyListeners();
  }

  void incrementCounterPlayer2() {
    counterPlayer2++;
    notifyListeners();
  }

  void decrementCounterPlayer2() {
    counterPlayer2--;
    notifyListeners();
  }
}
