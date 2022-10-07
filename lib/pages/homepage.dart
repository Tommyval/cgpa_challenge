// import 'package:cgpa_challenge/Services/theme_service.dart';
// import 'package:cgpa_challenge/Utils/Utils.dart';
// import 'package:cgpa_challenge/Services/provider.dart';
// import 'package:cgpa_challenge/pages/addpage.dart';
// import 'package:cgpa_challenge/pages/coursecard.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:provider/provider.dart';

// import '../models/entries.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   var indexClicked = 0;
//   final pages = [
//     const MainPage(),
//     const Center(
//         child: Text('CGPA CONSTRUCTION IN PROGRESS',
//             style: TextStyle(color: Colors.red))),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     var values = context.read<ThemeSettings>();
//     return Scaffold(
//       backgroundColor: NeumorphicTheme.baseColor(context),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Consumer<Entries>(
//           builder: (context, value, child) {
//             return Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       FirebaseAuth.instance.signOut();
//                     },
//                     icon: const Icon(Icons.arrow_back)),
//                 RichText(
//                     text: TextSpan(
//                         style: const TextStyle(color: Colors.blue),
//                         children: [
//                       const TextSpan(
//                           text: 'CURRENT GPA :',
//                           style:
//                               TextStyle(color: Utils.textColor, fontSize: 20)),
//                       TextSpan(
//                           text: ' ${value.calGpa().toStringAsFixed(2)}',
//                           style: const TextStyle(
//                               color: Colors.blue,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold))
//                     ])),
//                 Consumer<ThemeSettings>(
//                   builder: (context, value, child) {
//                     return IconButton(
//                         onPressed: () {
//                           value.toggletheme();
//                         },
//                         icon: const Icon(Icons.lightbulb));
//                   },
//                 ),
//                 IconButton(
//                     padding: const EdgeInsets.only(right: 0),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const AddPage()));
//                     },
//                     icon: const Icon(
//                       Icons.add,
//                       color: Utils.textColor,
//                     ))
//               ],
//             );
//           },
//         ),
//       ),
//       body: pages[indexClicked],
//       bottomNavigationBar: BottomNavigationBar(
//         elevation: 60,
//         selectedItemColor: Defaults.drawerItemSelectedColor,
//         unselectedItemColor: Defaults.drawerItemColor,
//         currentIndex: indexClicked,
//         onTap: (value) {
//           setState(() {
//             indexClicked = value;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//               icon: Icon(Defaults.bottomNavItemIcon[0]),
//               label: Defaults.BottomNavItemText[0]),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Defaults.bottomNavItemIcon[1],
//               ),
//               label: Defaults.BottomNavItemText[1]),
//         ],
//       ),
//     );
//   }
// }


