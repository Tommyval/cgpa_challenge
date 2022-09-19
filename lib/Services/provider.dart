import 'package:cgpa_challenge/models/gpa_model.dart';
import 'package:flutter/material.dart';

class Entries with ChangeNotifier {
  final List<Entry> items = [];

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

  void removeFromCard(Entry entries) {
    items.removeWhere((d) => d.title == entries.title);
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }
}
