import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class failure extends StatefulWidget {
  const failure({Key? key}) : super(key: key);

  @override
  State<failure> createState() => _failureState();
}

class _failureState extends State<failure> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: Scaffold(
         appBar: AppBar(title: Text("My QR Code"),),
 
  backgroundColor: Color.fromARGB(255, 228, 253, 251),
  body: SafeArea(
    child: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(43, 50, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 70, 0, 0),
              child: Material(
                // color: Colors.transparent,
                // elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: 300,
                  height: 450,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                        child: Image.asset(
                          'assets/images/nodataFound.jpg',
                          
                          width: 100,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: Text(
                          'No permission (:',
                          textAlign: TextAlign.center,
                          style:GoogleFonts.poppins(fontSize: 25,)
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("Go Back"),style: ElevatedButton.styleFrom(primary: Colors.black),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
)

      ),
    );
    
  }
}