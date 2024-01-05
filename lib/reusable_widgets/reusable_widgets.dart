import 'package:firebaseloginpage/home_screen.dart';
import 'package:flutter/material.dart';

Image logoWidget(String imagename) {
    return Image.asset(
      imagename,
      fit: BoxFit.fitWidth,
      width: 240,
      height: 240,
    );
  }

  TextField reusableTextfeild(String text, IconData icon, bool isPasswordtype,
  TextEditingController controller, ) {
    return TextField(
      controller: controller,
      obscureText: isPasswordtype,
      enableSuggestions: !isPasswordtype,
      autocorrect: !isPasswordtype,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon, color: Colors.white70,
          ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0))
      ),
     keyboardType: isPasswordtype
     ? TextInputType.visiblePassword
     : TextInputType.emailAddress, 
    );
  }

  Container signInSignUpButton(
    BuildContext context,bool isLogin, Function onTap) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
        child: ElevatedButton(
          onPressed: () {
            onTap();
          },
         child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeScreen()));
          },
           child: Text(
            isLogin ? "LOG IN" : "SIGN UP",
            style: TextStyle(
              color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
           ),
         ),
         style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
         ),
      );
    }