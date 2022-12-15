import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vidyarthi/screens/OnFailure.dart';
import 'package:vidyarthi/screens/QrGenerator.dart';
import 'package:vidyarthi/screens/home.dart';
import 'package:vidyarthi/screens/StudentLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyarthi/screens/resetPassword.dart';
import 'package:vidyarthi/screens/sharedPreferences.dart';

void main() async {

  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Constants.states = await SharedPreferences.getInstance();
  runApp(const MyHome());
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // final storage = new FlutterSecureStorage();

  String id = "";
  bool? value;
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: (Constants.states.getBool('_isLogined') ?? false)?"/home" : "/",
      routes: {
       
        // "/": (context) => login1(),
        // "/home": (context) => home(),
        // "/failure": (context) => failure(),
        // "/generator": ((context) => generator()),
        "/" : (context) => reset(),

      },
    );
  }
}
