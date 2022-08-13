import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:path/path.dart' as path;
import 'package:vidyarthi/screens/home.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';

import 'OnFailure.dart';
import 'QrGenerator.dart';


class login1 extends StatefulWidget {
  const login1({Key? key}) : super(key: key);

  @override
  State<login1> createState() => _login1State();
}

class _login1State extends State<login1> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
    firebase_storage.FirebaseStorage storage =  firebase_storage.FirebaseStorage.instance;
    CollectionReference student = FirebaseFirestore.instance.collection('permissions');
      
    final secureStorage = new FlutterSecureStorage();


  


  String name ="";
  String ?key;
  String storedId ="NoData";
  
 

 AssetImage temp = AssetImage('assests/images/lunc3.jpg');

File? imageFile;
String ?imageString;
PlatformFile ?pickedFile;
UploadTask ?uploadTask;
String DownloadUrl = "";
bool changeScreen = false;
bool _isPresent = false;

  bool _loading = true;
  
  var _loadingStart = false;



bool _validate(String s){

RegExp regExp = RegExp(r'^\d{2}bd[15]{1}[a-z]{1}\w{4}$', caseSensitive: false, multiLine: false);

return regExp.hasMatch(s);

  
}

  Future<void>saveDetails()async{
     if(imageFile == null && imageString == null){
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content:Text("No File Has Been Selected")),);
    return;
 }

        bool res = _validate(nameController.text);
        // print(res);
      

      if(res == true){
         LoginNumber();
       if(storedId != ""){
        KeepSignin();
       }

      }
      else{
         ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content:Text("Enter valid roll number!!")),);

      }
      
  }
  Future<void>LoginNumber()async{   
    if(key != "Kmit@123"){

        ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content:Text("Enter Password Correctly!!")),);
    return;

    }
 QuerySnapshot temp =  await student
    .where("RollNumber",isEqualTo: (nameController.text).toUpperCase())
    .get();



    if(temp.docs.isEmpty){
      
       Navigator.push(
        context,
       MaterialPageRoute(builder: 
       (context) => home(passedNumber : (nameController.text).toUpperCase(),passedUrl : "NoData"),

       )
     );

      
    }
  
    
    else{
      
      CollectionReference addDetails = FirebaseFirestore.instance.collection('students');
       var users =   await addDetails
          .add({
            'Name': (nameController.text).toUpperCase(),
            'Password':key,
          });
           if(changeScreen == true){
         Navigator.push(
        context,
       MaterialPageRoute(builder: 
       (context) => home(passedNumber : (nameController.text).toUpperCase(),passedUrl : DownloadUrl),

       )
     );

  }
    }
  }

  Future KeepSignin()async{
    await secureStorage.write(key: "id", value: storedId);
  }

 void _selectImage() async{

  setState(() {
    _loadingStart = true;
  });


   if(nameController.text != ""){
    // print("not null");
    QuerySnapshot temp =  await student
    .where("RollNumber",isEqualTo: nameController.text)
    .get();

    print(temp.docs.length);

    if(temp.docs.length >= 1){
  
      // name = nameController.text+'.'+'${pickedFile!.extension}';
// print(pickedFile!.name);
   
   name = nameController.text;
  final path = 'images/${name}';
  // final file = File(pickedFile!.path!);
  
   final imageUrl =
    await FirebaseStorage.instance.ref().child(path).getDownloadURL();

    print(imageUrl);

    setState(() {
   _isPresent = true;
   imageString = imageUrl;
   changeScreen = true;
   _loading = false;
   DownloadUrl = imageUrl;
   });
     return;
    }
    
   }


   

    
  else{
    final result = await FilePicker.platform.pickFiles();
    if(result == null)return;

    setState(() {
     pickedFile = result.files.first;
     imageFile = File(pickedFile!.path!);
     changeScreen = true;
    // changeScreen == false;
    });

    uploadImage();
  }
   


 }


 Future<void>uploadImage()async{
  

  //name with extension
// name = nameController.text+'.'+'${pickedFile!.extension}';


//name without extension
name = nameController.text;
// print(pickedFile!.name);
  final path = 'images/${name}';
  final file = File(pickedFile!.path!);
  
   

final ref = FirebaseStorage.instance.ref().child(path);
uploadTask =  ref.putFile(file);
final snapshot = await uploadTask!.whenComplete(() => {});

final urlDownload = await snapshot.ref.getDownloadURL();

setState(() {
   
  DownloadUrl = urlDownload;
  changeScreen = true;
  _loading = false;
});
print('Downlaoded Link : $urlDownload');
}






  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
 
  backgroundColor: Color.fromRGBO(163, 191, 245, 1),
  body: SafeArea(
    child: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ClipRect(

        child: ListView(
          children: [
             Container(
            width: 420,
            height: 750,
            decoration: BoxDecoration(
              color:Color.fromRGBO(163, 191, 245, 1),
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 400,
                  height: 700,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, -1.25),
                        child: Container(
                          width: 400,
                          height: 400,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 65, 111, 238),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                                child: Text(
                                  'welcome',
                                  style: GoogleFonts.poppins(fontSize: 30,color: Colors.white),
                                ),
                              ),
                              Text(
                                'back',
                                style: GoogleFonts.poppins(fontSize: 32,color: Colors.white),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                         borderRadius: BorderRadius.circular(100),
                                        //  child: (changeScreen == false) ? Image.asset("assets/images/fever1.jpg",width: 130,height: 130,) : ((_loading == true) ? ( CircularProgressIndicator(backgroundColor: Color.fromARGB(255, 15, 15, 15),)) : ((imageString!=null) ? (Image.network(imageString!,width: 130,height: 130,fit: BoxFit.cover,)) :(Image.file(imageFile!,width: 130,height: 130,fit: BoxFit.cover,)))),
                                    //       child: imageString != null ? (Image.network(imageString!,fit: BoxFit.cover,width: 130,height: 130,)): 
                                           child:  _loadingStart == false?Image.asset("assets/images/fever1.jpg",width: 130,height: 130,fit: BoxFit.cover,) : (_loading == true) ? (CircularProgressIndicator(backgroundColor: Color.fromARGB(255, 15, 15, 15),)) : (imageString!=null ? (Image.network(imageString!,width: 130,height: 130,fit: BoxFit.cover,)) : (Image.file(imageFile!,width: 130,height: 130,fit: BoxFit.cover,))),
                                    //         (imageFile != null) ? 
                                    //         (changeScreen == true ? 
                                    //  (Image.file(imageFile!,fit: BoxFit.cover,width: 130,height: 130,)):

                                    //      CircularProgressIndicator(backgroundColor: Color.fromARGB(255, 15, 15, 15),)):
                                    //        Image.asset("assets/images/fever1.jpg",fit: BoxFit.cover,width: 130,height: 130,),


                                    // child: imageString != null ?  
                                    //   (changeScreen == true) ? ((Image.network(imageString!,fit: BoxFit.cover,width: 130,height: 130,))) : CircularProgressIndicator(backgroundColor: Color.fromARGB(255, 15, 15, 15),) : Image.asset("assets/images/fever1.jpg",fit: BoxFit.cover,width: 130,height: 130,),


                                    // child: (
                                    //   (imageFile != null) ? (
                                    //      (
                                    //       changeScreen == true ? 
                                    //            (Image.file(imageFile!,fit: BoxFit.cover,width: 130,height: 130,)):
                                    //             CircularProgressIndicator(backgroundColor: Color.fromARGB(255, 15, 15, 15),))
                                    //   ): Image.asset("assets/images/fever1.jpg",fit: BoxFit.cover,width: 130,height: 130,)
                                    // )
                                    // ):(
                                    //   (imageString != null)?(
                                    //     (
                                    //       changeScreen == true ? 
                                    //            (Image.network(imageString!,fit: BoxFit.cover,width: 130,height: 130,)):
                                    //             CircularProgressIndicator(backgroundColor: Color.fromARGB(255, 15, 15, 15),))

                                    //   ):(
                                    //     Image.asset("assets/images/fever1.jpg",fit: BoxFit.cover,width: 130,height: 130,)
                                    //   )
                                    // ),
                                    

                                    
                                            
                                            
                                            
                                            
                                            
                                            // (Image.file(imageFile!)):Image.asset("assets/images/fever1.jpg",fit: BoxFit.cover,width: 130,height: 130,),
                                          

                                    //      child: imageSelected!=null ? (changeScreen == true ? 
                                    //  (Image.network(imageSelected!,fit: BoxFit.cover,width: 130,height: 130,)):

                                    //      CircularProgressIndicator(backgroundColor: Color.fromARGB(255, 15, 15, 15),)):
                                    //        Image.asset("assets/images/fever1.jpg",fit: BoxFit.cover,width: 130,height: 130,),
                                        ),

                                        
                                        Positioned(
                                          top: 96,
                                          left: 96,
                                          child: Container(
                                             width: 33,
                                             height: 30,
                                             
                                             decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                               color: Color.fromARGB(255, 136, 153, 247),
                                               boxShadow: [
                                                  BoxShadow(
                                                   color: Colors.grey,
                                                   offset: Offset(1.0, 1.0), //(x,y)
                                                   blurRadius: 6.0,
                                                      ),
                                                     ],
                                               
                                              
                                             ),
                                             
                                            // color: Color.fromARGB(255, 243, 177, 33),

                                            child: nameController.text!=""?
                                            
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.95),
                                                  child: IconButton(onPressed:() {
                                                      _selectImage();
                                                    
                                                  },icon :Icon(Icons.edit),iconSize: 20,),
                                            ):
                                            Text(""),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),



                       Align(
  alignment: AlignmentDirectional(0, 0.9),
  child: Material(
    // color: Colors.transparent,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Container(
      width: 360,
      height: 400,
      decoration: BoxDecoration(
        // color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xFF2367EF),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Text(
                  'Log in',
                  textAlign: TextAlign.center,
                 
                  style: GoogleFonts.poppins(fontSize: 28),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                  child: TextFormField(
                    controller: nameController,

                   
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Enter Roll Number',
                      // hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outlined,
                      ),
                    ),
                    // style: FlutterFlowTheme.of(context).bodyText1.override(
                    //       fontFamily: 'Poppins',
                    //       fontSize: 20,
                    //     ),
                    onEditingComplete: (){
                      // setState(() {
                      //   name = value;
                      // });
                    },
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: TextFormField(
                    controller: passController,
                    // autofocus: true,
                    onChanged: (value){
                          setState(() {
                            key = value;
                          });
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Enter Key',
                      // hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF9FAFC),
                      prefixIcon: Icon(
                        Icons.vpn_key_rounded,
                      ),
                    ),
                    // style: FlutterFlowTheme.of(context).bodyText1.override(
                    //       fontFamily: 'Poppins',
                    //       fontSize: 20,
                    //     ),
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                
                child: ElevatedButton(child: Text("Let's Go"),onPressed: saveDetails,style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),),
                             ),
            ],
          ),
        ],
      ),
    ),
  ),
)



                    ],
                  ),
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    ),
  ),
);

      

  }
}