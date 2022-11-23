import 'package:desa_wisata/data.dart';
import 'package:desa_wisata/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class OtpVerif extends StatefulWidget {
  const OtpVerif({Key? key}) : super(key: key);

  @override
  _OtpVerifState createState() => _OtpVerifState();
}

var isLoading = false;

class _OtpVerifState extends State<OtpVerif> {
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
                            style: bodyText1.copyWith(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    color: Color.fromRGBO(0, 255, 0, 130),
                    height: 100,
                    child: Center(
                      child: Text(
                          "Kami akan mengirimkan OTP ke email anda. Silahkan pencet 'Send OTP'.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                    ),
                  )
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

  void sendOtp() async {
    emailAuth.sessionName = "Test Session";
    var res = await emailAuth.sendOtp(
        recipientMail: emailSignUpController.text, otpLength: 6);
    if (res) {
      print("OTP Sent");
    } else {
      print("We could not sent OTP");
    }
  }

  void verifyOtp() {
    var res = emailAuth.validateOtp(
        recipientMail: emailSignUpController.text, userOtp: otpController.text);
    if (res) {
      print("OTP Verified");
    } else {
      print("OTP not verified");
    }
  }

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
