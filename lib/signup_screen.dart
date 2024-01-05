import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseloginpage/colors_untils.dart';
import 'package:firebaseloginpage/home_screen.dart';
import 'package:firebaseloginpage/reusable_widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class signUpscreen extends StatefulWidget {
  const signUpscreen({super.key});

  @override
  State<signUpscreen> createState() => _signUpscreenState();
}

class _signUpscreenState extends State<signUpscreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextcontroller = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringcolor("CB2B93"),
          hexStringcolor("9546C4"),
          hexStringcolor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                reusableTextfeild("Enter Username", Icons.person_outline, false,
                    _userNameTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextfeild("Enter Email Id", Icons.person_outline, false,
                    _emailTextcontroller),
                SizedBox(
                  height: 20,
                ),
                reusableTextfeild(
                  "Enter Password",
                  Icons.lock_outline,
                  false,
                  _passwordTextController,
                ),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextcontroller.text,
                          password: _passwordTextController.text)
                      .then((value) {
                     Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
