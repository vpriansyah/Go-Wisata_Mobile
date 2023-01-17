import 'package:smooth_page_indicator/smooth_page_indicator.dart'
as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desa_wisata/theme.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:desa_wisata/data.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void navigateUser()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool status = prefs.getBool('isLoggedIn') ?? false;
    String loginRole = prefs.getString('loginRole') ?? '';
    String loginId = prefs.getString('loginId') ?? '';
    String loginName = prefs.getString('loginName') ?? '';
    String loginEmail = prefs.getString('loginEmail') ?? '';
    String loginTelp = prefs.getString('loginTelp') ?? '';

    Data datas = Data(
      id: loginId,
      name: loginName,
      email: loginEmail,
      telp: loginTelp,
      role_id: loginRole,
    );
    dataList.add(datas);

    redirect(loginRole, status);
  }

  void redirect(String loginRole, bool status){
    // print("from splash $status");
    if (status) {
      if (loginRole == "2") {
        Navigator.pushNamedAndRemoveUntil(context, '/home-user', (route) => false);
      }
      else{
        Navigator.pushNamedAndRemoveUntil(context, '/home-user', (route) => false);
      }
    } else {
      Navigator.pushNamedAndRemoveUntil(context, "/cover", (route) => false);
    }
  }

  @override
  initState(){
    Timer(Duration(seconds: 5),
            () => navigateUser());
    //() => Navigator.pushNamedAndRemoveUntil(context, "/signinsignup", (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Stack(
                children: [
                  // Image.asset(
                  //   'assets/images/Rectangle_1.png',
                  //   width: double.infinity,
                  //   height: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(40, 0, 50, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/image/logo.png',
                                    width: 30,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 15),
                                    child: Text(
                                      'Go-Wisata',
                                      style: title1.copyWith(
                                        fontFamily: 'Roboto Slab',
                                        color: Color(0xFF11485E),
                                        fontSize: 40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(40, 0, 50, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
