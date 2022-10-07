import 'package:cgpa_challenge/models/gpa_model.dart';
import 'package:flutter/material.dart';

class Entries with ChangeNotifier {
  final List<Entry> items = [];
  int deletecon = 0;
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

  void removeFromCart(Entry entries) {
    deletecon = items.indexWhere((element) => element.credit == entries.credit);
    deletecourse = items[deletecon];
    items.removeAt(deletecon);
    notifyListeners();
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }
}
