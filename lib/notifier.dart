import 'package:flutter/widgets.dart';

class Notifier extends ChangeNotifier {
  List Notes = ["First"];
  void onsubmit(String a) {
    Notes.add(a);
    notifyListeners();
  }
}
