import 'package:cgpa_challenge/Utils/Utils.dart';
import 'package:cgpa_challenge/Services/provider.dart';
import 'package:cgpa_challenge/pages/addpage.dart';
import 'package:cgpa_challenge/pages/coursecard.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../models/entries.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var indexClicked = 0;
  final pages = [
    const MainPage(),
    const Center(
      child: Text('CGPA'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Utils.maintheme,
        title: Consumer<Entries>(
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 5,
                ),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(color: Colors.blue),
                        children: [
                      const TextSpan(
                          text: 'CURRENT GPA :',
                          style:
                              TextStyle(color: Utils.textColor, fontSize: 20)),
                      TextSpan(
                          text: ' ${value.calGpa().toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))
                    ])),
                IconButton(
                    onPressed: value.items.isEmpty
                        ? null
                        : () {
                            value.clearCart();
                          },
                    icon: const Icon(
                      Icons.restart_alt_sharp,
                      color: Utils.textColor,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddPage()));
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Utils.textColor,
                    ))
              ],
            );
          },
        ),
      ),
      body: pages[indexClicked],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 60,
        selectedItemColor: Defaults.drawerItemSelectedColor,
        unselectedItemColor: Defaults.drawerItemColor,
        currentIndex: indexClicked,
        onTap: (value) {
          setState(() {
            indexClicked = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Defaults.bottomNavItemIcon[0]),
              label: Defaults.BottomNavItemText[0]),
          BottomNavigationBarItem(
              icon: Icon(
                Defaults.bottomNavItemIcon[1],
              ),
              label: Defaults.BottomNavItemText[1]),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gpaProvider = context.read<Entries>();
    var items = gpaProvider.itemlist;
    return ListView.builder(
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
