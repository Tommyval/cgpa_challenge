import 'package:cgpa_challenge/Services/provider.dart';
import 'package:cgpa_challenge/Services/theme_service.dart';
import 'package:cgpa_challenge/Utils/Utils.dart';
import 'package:cgpa_challenge/pages/addpage.dart';
import 'package:cgpa_challenge/widgets/bottombar.dart';
import 'package:cgpa_challenge/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var values = context.read<ThemeSettings>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Consumer<Entries>(
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    icon: const Icon(Icons.arrow_back)),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(color: Colors.blue),
                        children: [
                      const TextSpan(
                          text: 'CURRENT GPA :',
                          style:
                              TextStyle(color: Utils.altColor, fontSize: 14)),
                      TextSpan(
                          text: ' ${value.calGpa().toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Utils.altColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))
                    ])),
                Consumer<ThemeSettings>(
                  builder: (context, value, child) {
                    return IconButton(
                        onPressed: () {
                          value.toggletheme();
                        },
                        icon: const Icon(Icons.lightbulb));
                  },
                ),
                IconButton(
                    onPressed: value.items.isEmpty
                        ? null
                        : () {
                            value.clearCart();
                          },
                    icon: const Icon(
                      Icons.restart_alt,
                      color: Colors.grey,
                    )),
                IconButton(
                    padding: const EdgeInsets.only(right: 0),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddPage()));
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Utils.altColor,
                    ))
              ],
            );
          },
        ),
      ),
      body: Column(
        children: const [Expanded(child: MainPage()), BottomBar()],
      ),
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<BottomBarItem> barItems = barItemsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(barItems.length, (index) {
            var barItem = barItems[index];

            return GestureDetector(
              onTap: () {
                setState(() {
                  for (var item in barItems) {
                    item.isSelected = barItem == item;
                  }
                });
              },
              child: Column(
                children: [
                  Icon(barItem.icon,
                      color:
                          barItem.isSelected! ? Utils.textColor : Colors.grey),
                  Text(
                    barItem.label!,
                    style: TextStyle(
                        color: barItem.isSelected!
                            ? Utils.textColor
                            : Colors.grey),
                  )
                ],
              ),
            );
          })),
    );
  }
}
