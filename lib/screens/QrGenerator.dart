import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';


class generator extends StatefulWidget {
 

  String ?passedNumber;
  String ?passedUrl;
  String ?passedName;
generator(
    {Key ?key,this.passedNumber,this.passedUrl,this.passedName}) : super(key: key);
  

  @override
  State<generator> createState() => _generatorState();
}

class _generatorState extends State<generator> {

  File? image;

  

  String ?QrData;
  String ?url;
 
  String ?temp;

  @override
  Widget build(BuildContext context) {

  // print(widget.passedUrl);
  // print(widget.passedName);
    // url  = widget.passedUrl!;
    // QrData = widget.passedNumber!;
    // temp = widget.passedName!;

    print(widget.passedNumber! + '.'+DateTime.now().toString());
    setState(() {

        QrData = widget.passedNumber!;
        url = widget.passedUrl!;
        // url = "asdfasdf";
        temp = widget.passedName!;
    });

    // url = "asdfasd";
    // QrData = "19BD1A0508";
    // temp = "Shivraj";
   


   return Scaffold(
    appBar: AppBar(title: Text("My QR Code"),),

  backgroundColor: Color.fromARGB(255, 223, 248, 196),
  body: SafeArea(
    child: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 20, 12, 0),
        child: Container(
          width: 370,
          height: 700,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 223, 248, 196),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Color.fromARGB(255, 223, 248, 196),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 130,
                      height: 120,
                      clipBehavior: Clip.antiAlias,
                      
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      
                      //  child: url != null?
                      // ClipRect(
                        
                      //   borderRadius: BorderRadius.circular(100),
                      //   child: Image.network(url)
                        
                      //   ) : 
                      // Image.asset("assets/images/fac3.png"),

                      child : ClipRRect(
                                         borderRadius: BorderRadius.circular(140),
                                         
                                         child: url != null?
                                     (Image.network(url!,fit: BoxFit.cover,width: 130,height: 130,)):
                                           Image.asset("assets/images/fever1.jpg",width: 130,height: 130,),
                                        ),

                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Text(
                        QrData!,
                        // style: FlutterFlowTheme.of(context)
                        //     .bodyText1
                        //     .override(
                        //       fontFamily: 'Poppins',
                        //       color: FlutterFlowTheme.of(context).black600,
                        //       fontSize: 25,
                        //     ),
                        style: GoogleFonts.poppins(fontSize: 25,color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Text(
                       temp!,
                        // style:
                        //     FlutterFlowTheme.of(context).bodyText1.override(
                        //           fontFamily: 'Poppins',
                        //           fontSize: 19,
                        //         ),
                        style: GoogleFonts.poppins(fontSize: 19,color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Column(

                  // mainAxisAlignment : MainAxisAlignment.spaceevenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Container(
                        width: 270,
                        height: 300,
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Color(0xFFF6F8FC),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(height: 220,width: 220,color: Colors.white,child:QrImage(data: QrData!),),
                                
                                ],
                              ),
                            ),

                            
                            // Padding(
                            //   padding: EdgeInsetsDirectional.fromSTEB(
                            //       0, 20, 0, 20),
                            //   child: Text(
                            //     'Let\'s Go',
                            //     textAlign: TextAlign.center,
                               
                            //     style: GoogleFonts.poppins(fontSize: 25,color: Colors.black,fontStyle: FontStyle.italic),
                            //   ),
                            // ),

  //                           Container(
  //                             width: 200,
  //                             height: 40,
  //                             color: Color.fromARGB(255, 223, 248, 196),
  //                             margin: EdgeInsets.only(top: 30.0),
  //                             // child: ElevatedButton(onPressed: (){
  //                             //  Navigator.pop(context);
  //                             // }, child: Text("Go Back"),style: ElevatedButton.styleFrom(primary: Colors.black,onSurface: Colors.lightBlue),),
  //                             child: OutlinedButton(onPressed: (){}, child: Text("Go back",style: TextStyle(color: Colors.black,fontSize: 20.0),),style: ButtonStyle(
                                
                                
  //   shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),
  
  // ),
  //                           )
                           
                          ],
                        ),
                      ),

                    ),
                  ],
                ),

                // Padding(
                //   padding: const EdgeInsets.only(top: 20),
                //   child: Text("Let's Go",style: TextStyle(fontSize: 25.0,fontStyle: FontStyle.italic),),
                // ),
              ],
            ),
          ),
        ),
      ),
    ),
  ),
);

  }
}