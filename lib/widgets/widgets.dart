import 'package:cgpa_challenge/Services/provider.dart';
import 'package:cgpa_challenge/pages/coursecard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var gpaProvider = context.watch<Entries>();
    var items = gpaProvider.itemlist;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        var item = items[index];
        return CourseCard(
          entry: item,
        );
      },
    );
  }
}
