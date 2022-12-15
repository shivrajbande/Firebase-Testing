import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class reset extends StatefulWidget {
  const reset({Key? key}) : super(key: key);

  @override
  State<reset> createState() => _resetState();
}

class _resetState extends State<reset> {
  @override
  TextEditingController textController1 = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController  oldPasswordController = TextEditingController();
   bool passwordVisibility = false;
   bool confirmPasswordVisibility = false;
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: PreferredSize(
  preferredSize: Size.fromHeight(100),
  child: AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    flexibleSpace: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: IconButton(
                     color: Colors.transparent,
                  // borderRadius: 30,
                  // borderWidth: 1,
                      iconSize: 50,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 24,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                child: Text(
                  'Back',
                  // style: FlutterFlowTheme.of(context).title1.override(
                  //       fontFamily: 'Poppins',
                  //       fontSize: 16,
                  //     ),
                   style: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 10, 0, 0),
          child: Text(
            'Change Password',
             style: GoogleFonts.poppins(fontSize: 32, color: Colors.white),
          ),
        ),
      ],
    ),
    actions: [],
    elevation: 0,
  ),
),
body: Column(
  children: [
        Padding(
    
      padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 3),
    
      child: Material(
    
        color: Colors.transparent,
    
        elevation: 4,
    
        shape: RoundedRectangleBorder(
    
          borderRadius: BorderRadius.circular(8),
    
        ),
    
        child: Container(
    
          height: 60,
    
          decoration: BoxDecoration(
    
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
    
          ),
    
          child: TextFormField(
    
            controller: textController1,
    
            autofocus: true,
    
            obscureText: false,
    
            decoration: InputDecoration(
    
              hintText: 'Roll Number',
    
              // hintStyle: FlutterFlowTheme.of(context).bodyText2,
    
              enabledBorder: OutlineInputBorder(
    
                borderSide: BorderSide(
    
                  color: Color(0x00000000),
    
                  width: 1,
    
                ),
    
                borderRadius: BorderRadius.circular(12),
    
              ),
    
              focusedBorder: OutlineInputBorder(
    
                borderSide: BorderSide(
    
                  color: Color(0x00000000),
    
                  width: 1,
    
                ),
    
                borderRadius: BorderRadius.circular(12),
    
              ),
    
              contentPadding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
    
            ),
    
            // style: FlutterFlowTheme.of(context).bodyText1,
    
          ),
    
        ),
    
      ),
    
    ),
    Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 3),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x4D101213),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                controller: oldPasswordController,
                obscureText: false,
                decoration: InputDecoration(
                  // labelStyle: FlutterFlowTheme.of(context).bodyText2,
                  hintText: 'Please enter your old password.',
                  // hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                  //       fontFamily: 'Lexend Deca',
                  //       color: FlutterFlowTheme.of(context).secondaryText,
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.normal,
                  //     ),
                  hintStyle:   GoogleFonts.poppins(
                                            fontSize: 14, color: Color.fromARGB(255, 99, 97, 97)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                ),
                // style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 3),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x4D101213),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                controller: passwordController,
                obscureText: !passwordVisibility,
                decoration: InputDecoration(
                  // labelStyle: FlutterFlowTheme.of(context).bodyText2,
                  hintText: 'Please enter your password...',
                  // hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                  //       fontFamily: 'Lexend Deca',
                  //       color: FlutterFlowTheme.of(context).secondaryText,
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.normal,
                  //     ),
                  hintStyle:   GoogleFonts.poppins(
                                            fontSize: 14, color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                  suffixIcon: InkWell(
                    onTap: () => setState(
                      () => passwordVisibility = !passwordVisibility,
                    ),
                    focusNode: FocusNode(skipTraversal: true),
                    child: Icon(
                      passwordVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Color.fromARGB(255, 92, 90, 90),
                      size: 22,
                    ),
                  ),
                ),
                // style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 3),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x4D101213),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                controller: confirmPasswordController,
                // obscureText: !confirmPasswordVisibility,
                decoration: InputDecoration(
                  // labelStyle: TextStyle(fontStyle: ),
                  hintText: 'Please confirm your password...',
                  hintStyle: TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                  suffixIcon: InkWell(
                    onTap: () => setState(
                      () => confirmPasswordVisibility =
                          !confirmPasswordVisibility,
                    ),
                    focusNode: FocusNode(skipTraversal: true),
                    child: Icon(
                      confirmPasswordVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                     color: Color.fromARGB(255, 87, 85, 85),
                      size: 22,
                    ),
                  ),
                ),
                // style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
          ),
          ElevatedButton(onPressed: (){}, child: Text("Update Password"))



  ],
),



    );
    
  }
}