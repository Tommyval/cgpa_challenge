import 'package:cgpa_challenge/models/gpa_model.dart';
import 'package:flutter/material.dart';

class Entries with ChangeNotifier {
  final List<Entry> items = [];
  int deletecont = 0;
  Entry deletecourse = Entry(credit: '', unit: 0, grade: '');
  List<Entry> get itemlist {
    return [...items];
  }

  int get itemCount {
    return items.length;
  }

  double calGpa() {
    if (items.isNotEmpty) {
      double itemUnit = items.fold(0, (previousValue, entry) {
        return previousValue + entry.unit!;
      });
      double gpaTotal = items.fold(0, (previousValue, entry) {
        return previousValue + (entry.gpa * entry.unit!);
      });
      double total = gpaTotal / itemUnit;
      return total;
    } else {
      return 0.0;
    }
  }

  void addToCard(Entry entries) {
    items.add(entries);
    notifyListeners();
  }

  void removeFromCart(Entry entry) {
    deletecont = items.indexWhere((element) => element.credit == entry.credit);
    deletecourse = items[deletecont];
    items.removeAt(deletecont);
    notifyListeners();
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }
}
