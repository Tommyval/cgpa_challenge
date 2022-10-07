import 'dart:async';

import 'package:cgpa_challenge/Services/login_service.dart';
import 'package:cgpa_challenge/Utils/Utils.dart';
import 'package:cgpa_challenge/pages/landingpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Userlogin extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const Userlogin({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<Userlogin> createState() => _UserloginState();
}

class _UserloginState extends State<Userlogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  void initState() {
    nameController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    super.dispose();
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: nameController.text.trim(),
        password: passController.text.trim());
  }

  bool validateEmailAndPassword() {
    return nameController.value.text.isNotEmpty &&
        passController.value.text.isNotEmpty &&
        Utils.validateEmail(nameController.value.text);
  }

  @override
  Widget build(BuildContext context) {
    Login login = Provider.of<Login>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Utils.maintheme,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.balance,
                  size: 100,
                ),
                const SizedBox(
                  height: 75,
                ),
                const Text(
                  'Hello Again!',
                  style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Best place to track your success',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: nameController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        obscureText: true,
                        controller: passController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    ),
                  ),
                ),
                Consumer<Login>(
                  builder: (context, value, child) {
                    String errorMsg = value.getErrorMessage();
                    if (errorMsg.isEmpty) {
                      return const SizedBox(
                        height: 40,
                      );
                    }
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(children: [
                        const Icon(
                          Icons.warning,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                          errorMsg,
                          style: const TextStyle(color: Colors.red),
                        ))
                      ]),
                    );
                  },
                ),
                SizedBox(
                    height: 50,
                    width: 280,
                    child: FlutterBankButton(
                        //enabled: validateEmailAndPassword(),
                        label: 'Sign in',
                        onTap: () async {
                          var userName = nameController.value.text;
                          var pwd = passController.value.text;

                          bool isLoggedIn = await login
                              .signInWithEmailAndPassword(userName, pwd);
                          if (isLoggedIn) {
                            nameController.clear();
                            passController.clear();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LandingPage()));
                          }
                        })

                    //  ElevatedButton(
                    //     onPressed: signIn,
                    //     style: ButtonStyle(
                    //       backgroundColor: MaterialStateProperty.all<Color>(
                    //           Utils.textColor),
                    //       shape: MaterialStateProperty.all<
                    //           RoundedRectangleBorder>(
                    //         RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(18.0),
                    //         ),
                    //       ),
                    //     ),
                    //     child: const Text(
                    //       'Sign In',
                    //       style: TextStyle(
                    //           fontSize: 18,
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.bold),
                    //     )),

                    ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a Member?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: widget.showRegisterPage,
                        child: const Text(
                          'Regester Now',
                          style: TextStyle(
                              color: Utils.textColor,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FlutterBankButton extends StatelessWidget {
  const FlutterBankButton({this.enabled = true, this.label, this.onTap});
  final Function? onTap;
  final String? label;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Material(
            color:
                enabled! ? Utils.textColor : Utils.textColor.withOpacity(0.5),
            child: InkWell(
              onTap: enabled!
                  ? () {
                      onTap!();
                    }
                  : null,
              highlightColor: Colors.white.withOpacity(0.2),
              splashColor: Colors.white.withOpacity(0.1),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: Text(label!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
