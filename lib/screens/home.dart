import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vidyarthi/screens/OnFailure.dart';
import 'package:vidyarthi/screens/QrGenerator.dart';


class home extends StatefulWidget {
   String ?passedNumber;
  String ?passedUrl;

  
   home(
    {Key ?key,this.passedNumber,this.passedUrl}) : super(key: key);
 
  //  home(String name,String data){
   
  // }


  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
   String ?rollNumber;
   String ?url;
 

  CollectionReference users = FirebaseFirestore.instance.collection('permissions');
  Future<void>validateNumber()async{


    if(url == "NoData"){
       Navigator.push(context, 
      MaterialPageRoute(builder: 
      (context) =>failure(),
      )
      );
     return;
    }
    
    QuerySnapshot obj = await users
    .where("RollNumber",isEqualTo: rollNumber)
    .get();

    

  

    //  print(obj.docs.length);
    if(obj.docs.length > 0){
   

      // print(obj.docs.first["StudentName"]);
      // print(rollNumber);

     
      
     String studentName = obj.docs.first["StudentName"];

    //  print(studentName);
    //  print(rollNumber);
    //  print(url);
      
      Navigator.push(
        context,
       MaterialPageRoute(builder: 
       (context) => generator(passedNumber: rollNumber,passedUrl : url!,passedName : studentName),

       )
      );
    }
    else{
      Navigator.push(context, 
      MaterialPageRoute(builder: 
      (context) =>failure(),
      )
      );

    }

  }

 

 


  

  
  @override
  Widget build(BuildContext context) {
  // print(widget.passedUrl);
    rollNumber = widget.passedNumber;
    url = widget.passedUrl;

    return Scaffold(
     
      body: Container(
      
        width: 400,
        height: 700,
        margin: EdgeInsets.symmetric(vertical: 100,horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Want to go out?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
              ],

            ),
            Row(
              children: [
                Text("Get the QR scanned :)",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500))
              ],

            ),
            Container(
              // color: Colors.yellow,
              height: 500,
              child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.stretch,
                
                children: [
                  Container(
                    height: 400,
                    margin: EdgeInsets.only(top: 30),
                    child: Stack(
                      // alignment: Alignment.topCenter,
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset('assets/images/lunc3.jpg',width: 180,height: 180,)),
                        ),
                        Positioned(top: 200,bottom: 0,left: 0,child: Container(
                          
                          child: ClipRRect(
                               
                            child: Image.asset('assets/images/stback4.jpg',width: 270,height: 370,)
                            ),
                        )
                        ),
                        Positioned(top: 30,right:0,child: Container(
                  
                         child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset('assets/images/fever1.jpg',width: 150,height: 300,)
                          ),
                  
                        )
                        ),
                        
                  
                  
                      ],
                    ),
                  )
                ],

              ),
            ),
            Column(
             
              children: [
                SizedBox(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    
                  ),onPressed: validateNumber, child: Text("QR CODE!")),
                ),
              ],

            ),
          ],
        ),
      ),

    );
    
  }
}