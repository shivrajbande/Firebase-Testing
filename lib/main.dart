
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vidyarthi/screens/OnFailure.dart';
import 'package:vidyarthi/screens/QrGenerator.dart';
import 'package:vidyarthi/screens/home.dart';
import 'package:vidyarthi/screens/StudentLogin.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyHome());
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final storage = new FlutterSecureStorage();
 
 String id = "";
 var value = null;
 Future<void> checkId()async{

   value = await storage.read(key: "id");
  print(value);

 }

  
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      // initialRoute: (value != null)?"/" : "/home",
      routes: {

        if(value == null) 
         "/" : (context) => login1(),
         "/home" : (context) => home(),
         "/failure":(context) => failure(),
         "/generator":((context) => generator()),

      
      },
        
       
     
    );
  }
}
