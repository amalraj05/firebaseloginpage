import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseloginpage/colors_untils.dart';
import 'package:firebaseloginpage/home_screen.dart';
import 'package:firebaseloginpage/reusable_widgets/reusable_widgets.dart';
import 'package:firebaseloginpage/signup_screen.dart';
import 'package:flutter/material.dart';

class signinscreen extends StatefulWidget {
  const signinscreen({super.key});

  @override
  State<signinscreen> createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("asset/logo.png"),
                  SizedBox(
                    height: 30,
                  ),
                  reusableTextfeild("Enter Username", Icons.person_outline,false, 
                    _emailTextcontroller),
                  SizedBox(
                    height: 30,
                  ),
                  reusableTextfeild("Enter Password", Icons.lock_outline, true,
                      _passwordTextController),
                  SizedBox(
                    height: 20,
                  ),
                  signInSignUpButton(context, true, () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextcontroller.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  }),
                  signUpoption(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row signUpoption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
        ),
        Text("Don't have account?",
         style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => signUpscreen()));
          },
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
