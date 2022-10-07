import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Utils/Utils.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showUserlogin;
  const RegisterPage({Key? key, required this.showUserlogin}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: nameController.text.trim(),
          password: passController.text.trim());
    }
  }

  bool passwordConfirmed() {
    if (passController.text.trim() == confirmPassController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  Icons.android,
                  size: 100,
                ),
                const SizedBox(
                  height: 75,
                ),
                const Text(
                  'Hello There',
                  style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Register below with your details!',
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
                        controller: confirmPassController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'confirm Password'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 280,
                  child: ElevatedButton(
                      onPressed: signUp,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Utils.textColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'I am a Member?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: widget.showUserlogin,
                        child: const Text(
                          'Log in',
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
