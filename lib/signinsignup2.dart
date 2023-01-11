import 'package:desa_wisata/auth.config.dart';
import 'package:desa_wisata/data.dart';
import 'package:desa_wisata/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:smart_auth/smart_auth.dart';
import 'dart:math';

class SignInSignUp2 extends StatefulWidget {
  const SignInSignUp2({Key? key}) : super(key: key);

  @override
  _SignInSignUp2State createState() => _SignInSignUp2State();
}


var isLoading = false;

class _SignInSignUp2State extends State<SignInSignUp2> {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  // final _formregKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formregKey = GlobalKey<FormState>();
  final _passwordVisible = false;
  EmailAuth emailAuth = new EmailAuth(sessionName: "Sample session");
  bool verified = false;
  final smartAuth = SmartAuth();
  Random random = new Random();

  var otp = 0;

  @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );

    /// Configuring the remote server
    emailAuth.config(remoteServerConfiguration);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF14181B),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFF14181B),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                'https://img.freepik.com/free-vector/hand-drawn-abstract-shapes-background_23-2149084635.jpg?w=1380&t=st=1666771548~exp=1666772148~hmac=8a823eb8788a400b53df8f0aa8b26e29e909abe0754bc9538eed3af7ed061487',
              ).image,
            ),
          ),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0x000F1113),
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset(
                              'assets/image/logo.png',
                              width: 20,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'Go-Wisata',
                            style:
                            bodyText1.copyWith(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            isScrollable: true,
                            labelColor: Colors.black,
                            labelStyle: subtitle1,
                            indicatorColor: Color(0xFF727272),
                            tabs: [
                              Tab(
                                text: 'Sign In',
                              ),
                              Tab(
                                text: 'Sign Up',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      44, 0, 44, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 20, 0, 0),
                                          child: TextFormField(
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                            validator: (value) => validateEmail(value),
                                            controller:emailAddressController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Email Address',
                                              labelStyle: bodyText1.copyWith(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.normal,
                                              ),
                                              hintStyle: bodyText1.copyWith(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBCBCBC),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBCBCBC),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(20, 24, 20, 24),
                                            ),
                                            style: bodyText2.copyWith(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF0F1113),
                                              height: 0.8,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: TextFormField(
                                            controller: passwordController,
                                            obscureText:!_passwordVisible,
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              labelStyle: bodyText1.copyWith(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.normal,
                                              ),
                                              hintStyle: bodyText1.copyWith(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBCBCBC),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBCBCBC),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(20, 24, 20, 24),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                      () => !_passwordVisible,
                                                ),
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                                child: Icon(
                                                  _passwordVisible
                                                      ? Icons
                                                      .visibility_outlined
                                                      : Icons
                                                      .visibility_off_outlined,
                                                  color: Color(0xFF95A1AC),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            style: bodyText2.copyWith(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF0F1113),
                                              height: 0.8,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 30, 0, 10),
                                          child: SizedBox(
                                            height:50, //height of button
                                            width:double.infinity,
                                            child: TextButton(
                                              onPressed: () {
                                                if (isLoading) {
                                                } else {
                                                  login();
                                                  setState(() {
                                                    isLoading = true;
                                                  });
                                                }
                                              },
                                              child: isLoading
                                                  ? Center(
                                                child:
                                                CircularProgressIndicator(color: Colors.white,),
                                              )
                                                  :
                                              Text('Sign In', style:
                                                bodyText2.copyWith(
                                                  fontFamily:
                                                  'Lexend Deca',
                                                  color: Colors.white,
                                                ),
                                              ),
                                              style: TextButton.styleFrom(
                                                backgroundColor: Color(0xFF358FEF),
                                                textStyle:
                                                bodyText2.copyWith(
                                                  fontFamily:
                                                  'Lexend Deca',
                                                  color: Colors.white,
                                                ),
                                                side: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                shape: RoundedRectangleBorder(borderRadius:
                                                BorderRadius.circular(8)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      44, 0, 44, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 20, 0, 0),
                                          child: TextFormField(
                                            controller: usernameController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Username',
                                              labelStyle:
                                              bodyText2.copyWith(
                                                fontFamily: 'Poppins',
                                                color:
                                                Color(0xFF95A1AC),
                                                fontSize: 14,
                                              ),
                                              hintStyle: bodyText1.copyWith(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBCBCBC),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBCBCBC),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(20, 24, 20, 24),
                                            ),
                                            style: bodyText1.copyWith(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFFBCBCBC),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              height: 0.8,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: TextFormField(
                                            controller: phoneNumberController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Nomor HP',
                                              labelStyle:
                                              bodyText2.copyWith(
                                                fontFamily: 'Poppins',
                                                color:
                                                Color(0xFF95A1AC),
                                                fontSize: 14,
                                              ),
                                              hintStyle: bodyText1.copyWith(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBCBCBC),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBCBCBC),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(20, 24, 20, 24),
                                            ),
                                            style: bodyText1.copyWith(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF14181B),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              height: 0.8,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: TextFormField(
                                            controller:
                                            emailSignUpController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Email',
                                              labelStyle:
                                              bodyText2.copyWith(
                                                fontFamily: 'Poppins',
                                                color:
                                                Color(0xFF95A1AC),
                                                fontSize: 14,
                                              ),
                                              hintStyle: bodyText1.copyWith(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBCBCBC),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBCBCBC),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(20, 24, 20, 24),
                                            ),
                                            style: bodyText1.copyWith(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF14181B),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              height: 0.8,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: TextFormField(
                                            controller:
                                            passwordSignUpController,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              labelStyle:
                                              bodyText2.copyWith(
                                                fontFamily: 'Poppins',
                                                color:
                                                Color(0xFF95A1AC),
                                                fontSize: 14,
                                              ),
                                              hintStyle: bodyText1.copyWith(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBCBCBC),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBCBCBC),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(20, 24, 20, 24),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                      () => !_passwordVisible,
                                                ),
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                                child: Icon(
                                                  _passwordVisible
                                                      ? Icons
                                                      .visibility_outlined
                                                      : Icons
                                                      .visibility_off_outlined,
                                                  color: Color(0xFF95A1AC),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            style: bodyText1.copyWith(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF14181B),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              height: 0.8,
                                            ),
                                          ),
                                        ),Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: TextFormField(
                                            controller:
                                            otpController,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              labelText: 'Submit OTP',
                                              labelStyle:
                                              bodyText2.copyWith(
                                                fontFamily: 'Poppins',
                                                color:
                                                Color(0xFF95A1AC),
                                                fontSize: 14,
                                              ),
                                              hintStyle: bodyText1.copyWith(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBCBCBC),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBCBCBC),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(20, 24, 20, 24),
                                              suffixIcon: TextButton(
                                                child: Text("Send OTP"),
                                                onPressed: randomOtp,
                                              )
                                            ),
                                            style: bodyText1.copyWith(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF14181B),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              height: 0.8,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 30, 0, 0),
                                          child: SizedBox(
                                            height: 50,
                                            width: double.infinity,
                                            child: TextButton(
                                              onPressed: () {
                                                if (emailValidation(emailSignUpController.text)) {
                                                  verifyOtp();
                                                  if (verified){
                                                    register();
                                                  } else {
                                                    const snackBar = SnackBar(
                                                      content: Text('OTP Salah!'),
                                                      backgroundColor: Colors.red,
                                                    );
                                                  }
                                                  setState(() {
                                                    isLoading =
                                                    true;
                                                  });
                                                }
                                                else{
                                                  const snackBar = SnackBar(
                                                    content: Text('format email salah!'),
                                                    backgroundColor: Colors.red,
                                                  );
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                }
                                              },
                                              child:
                                                isLoading
                                                  ? Center(
                                                  child:
                                                  CircularProgressIndicator(color: Colors.white,),
                                                  ) :
                                                  Text('Create Account',
                                                      style:
                                                    bodyText2.copyWith(
                                                    fontFamily:
                                                    'Lexend Deca',
                                                    color: Colors.white,
                                                  ),),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor: Color(0xFF358FEF),
                                                    side: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    shape: RoundedRectangleBorder(borderRadius:
                                                    BorderRadius.circular(8)),
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 20, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 0),
                                                  child: Text(
                                                    'Jadilah bagian dari kami',
                                                    textAlign: TextAlign.center,
                                                    style: bodyText2.copyWith(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                      Color(0xC8FFFFFF),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  redirect(String res) {
    // print('res' + res.toString());
    if (isLoading && res == "2") {
      Navigator.pushNamedAndRemoveUntil(
          context, '/home-admin', (route) => false);
      setState(() {
        isLoading = false;
      });
    } else if (isLoading && res == "5") {
      Navigator.pushNamedAndRemoveUntil(
          context, '/home-user', (route) => false);
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      const snackBar = SnackBar(
        content: Text('Username/password salah'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response = await http.post(
      Uri.parse("http://go-wisata.id/api/login"),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': emailAddressController.text,
        'password': passwordController.text,
      }),
    );
    var data = json.decode(response.body);
    if (response.statusCode != 200) {
      // return null;
      print(((data as Map)['data']));
      redirect(response.statusCode.toString());
    } else {
      Data datas = Data(
        id: ((data as Map)['data']['id']).toString(),
        name: (data)['data']['name'],
        email: (data)['data']['email'],
        telp: (data)['data']['telp'],
        role_id: ((data)['data']['role_id']).toString(),
      );
      dataList.add(datas);
      //session

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLoggedIn", true);
      prefs.setString("loginRole", (data)['data']['role_id'].toString());
      prefs.setString("loginId", (data)['data']['id'].toString());
      prefs.setString("loginName", (data)['data']['name']);
      prefs.setString("loginEmail", (data)['data']['email']);
      prefs.setString("loginTelp", (data)['data']['telp']);
    }
    redirect(((data)['data']['role_id']).toString());

    return data;
    // return json.decode(response.body);
  }

  void randomOtp() async {
    setState(() {
      otp = random.nextInt(10000);
    });
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response res = await http.post(
      Uri.parse("http://go-wisata.id/api/sendEmail"),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': emailSignUpController.toString(),
        'name' : usernameController.toString(),
        'code': otp.toString()
      }),
    );
    if (res.statusCode == 201) {
      print("otp sent");
    } else {
      print("otp not sent");
    }
  }

  void verifyOtp() {
    var code = int.parse(otpController.text);
    if (otp == code) {
      setState(() {
        verified = true;
      });
      print("otp benar");
    } else {
      print("otp salah");
    }
  }

  void sendOtp() async {
    emailAuth.sessionName= "Sample Session";
    var res = await emailAuth.sendOtp(recipientMail: emailSignUpController.text, otpLength: 6);
    if (res) {
      print("OTP Sent");
    } else {
      print("We could not sent OTP");
    }
  }

  // void verifyOtp() {
  //   var res = emailAuth.validateOtp(recipientMail: emailSignUpController.text, userOtp: otpController.text);
  //   if (res) {
  //     print("OTP Verified");
  //     setState(() {
  //       verified = true;
  //     });
  //   } else {
  //     print("OTP not verified");
  //     setState(() {
  //       verified = false;
  //     });
  //   }
  // }

  Future register() async {
    http.Response response = await http.post(
      Uri.parse("http://go-wisata.id/api/register"),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'name': usernameController.text,
        'email': emailSignUpController.text,
        'password': passwordSignUpController.text,
        'telp': phoneNumberController.text,
      }),
    );
    var data = json.decode(response.body);
    // print(usernameController.text +
    //     emailSignUpController.text +
    //     passwordController.text +
    //     phoneNumberController.text);
    // print(response.body.toString());
    if (response.statusCode != 200) {
      const snackBar = SnackBar(
        content: Text('Gagal registrasi'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading = false;
      });
    } else {
      //session
      Data datas = Data(
        id: ((data as Map)['data']['id']).toString(),
        name: (data)['data']['name'],
        email: (data)['data']['email'],
        telp: (data)['data']['telp'],
        role_id: ((data)['data']['role_id']).toString(),
      );
      dataList.add(datas);
      //session

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLoggedIn", true);
      prefs.setString("loginRole", ((data)['data']['role_id']).toString());
      prefs.setString("loginId", ((data)['data']['id']).toString());
      prefs.setString("loginName", (data)['data']['name']);
      prefs.setString("loginEmail", (data)['data']['email']);
      prefs.setString("loginTelp", (data)['data']['telp']);

      const snackBar = SnackBar(
        content: Text('Registrasi Berhasil'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading = false;
      });
      Navigator.pushNamed(context, '/home-user');
    }
    return data;
  }

  String validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return "";
  }

  emailValidation(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }
}
