import 'package:flutter/material.dart';

class BottomBarItem {
  String? label;
  bool? isSelected;
  IconData? icon;

  BottomBarItem({this.label, this.isSelected, this.icon});
}

final List<BottomBarItem> barItemsList = [
  BottomBarItem(label: 'GPA', isSelected: true, icon: Icons.book),
  BottomBarItem(label: 'CGPA', isSelected: false, icon: Icons.book),
  BottomBarItem(label: 'Review', isSelected: false, icon: Icons.pending),
];
