import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseloginpage/firebase_options.dart';
import 'package:firebaseloginpage/signin_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MaterialApp(home: signinscreen(),debugShowCheckedModeBanner: false,));
}