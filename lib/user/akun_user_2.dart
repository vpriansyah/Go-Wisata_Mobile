import 'package:desa_wisata/data.dart';
import 'package:desa_wisata/helper/helpersharedprefs.dart';
import 'package:desa_wisata/signinsignup.dart';
import 'package:desa_wisata/signinsignup2.dart';
import 'package:desa_wisata/theme.dart';
import 'package:desa_wisata/user/dashboard/home_user.dart';
import 'package:desa_wisata/user/dashboard/main_page_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AkunUser2 extends StatefulWidget {
  const AkunUser2({Key? key}) : super(key: key);

  @override
  _AkunUser2State createState() => _AkunUser2State();
}

class _AkunUser2State extends State<AkunUser2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ceklogin();
  }

  var status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      backgroundColor: primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: title1.copyWith(color: Colors.black),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body:
          // FutureBuilder(
          //     future: CekLogin(),
          //     builder: (context,
          //         AsyncSnapshot snapshot) {
          //       if (status = true) {
          //         return TidakLogin();
          //         // This trailing comma makes auto-formatting nicer for build methods.
          //       } else {
          //         return dataWidget();
          //       }
          //
          //       // return Text('Data Error');
          //     }),

          Builder(builder: (context) {
        if (status) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          color: primaryBackground,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              width: 120,
                              height: 120,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/image/profil-admin.jpg',
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Text(
                                      dataList.last.name,
                                      style: GoogleFonts.montserrat(
                                        color: Color(0xFF090F13),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    dataList.last.email,
                                    style: bodyText2.copyWith(
                                      fontFamily: 'Outfit',
                                      color: Colors.blue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (Theme.of(context).brightness == Brightness.light)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status User',
                                style: bodyText1,
                              ),
                              Text(
                                'AKTIF',
                                style: bodyText1.copyWith(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF1DD65A),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
                        child: Text(
                          'Account Settings',
                          style: bodyText1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(0x3416202A),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Text(
                                'Change Password',
                                style: bodyText2.copyWith(
                                  fontFamily: 'Outfit',
                                  color: secondaryText1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.9, 0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: secondaryText1,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(0x3416202A),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Text(
                                'Edit Profile',
                                style: bodyText2.copyWith(
                                  fontFamily: 'Outfit',
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.9, 0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: secondaryText1,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              logOut();
                              print('Logged Out');
                            },
                            child: Text(
                              'Log Out',
                              style: bodyText2.copyWith(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xFFF82323),
                              elevation: 1,
                              side: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: primaryBackground,
                        offset: Offset(0, 0),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/image/profil-admin.jpg',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    "Hello Guest",
                                    style: GoogleFonts.montserrat(
                                      color: Color(0xFF090F13),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 40,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signinsignup');
                            // print('Logged Out');
                          },
                          child: Text(
                            'Log In',
                            style: bodyText2.copyWith(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            elevation: 1,
                            side: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  String email = "";

  HelperSharedPrefs prefs = HelperSharedPrefs();

  ceklogin() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String isLoggedIn = prefs.getBool('isLoggedIn').toString();
    bool isLogin = await prefs.getIsLogin();
    if (isLogin) {
      setState(() {
        status = true;
      });
    } else {
      setState(() {
        status = false;
      });
    }
  }

  logOut() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    //   prefs.remove("isLoggedIn");
    //   prefs.remove("loginRole");
    //   prefs.remove("loginId");
    //   prefs.remove("loginName");
    //   prefs.remove("loginEmail");
    //   prefs.remove("loginTelp");
    prefs.logout();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const MainPageUser(),
      ),
      (route) => false,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text(
        "Berhasil logout",
        style: TextStyle(fontSize: 16),
      )),
    );
  }

  @override
  dispose() {
    super.dispose();
  }
}


// class dataWidget extends StatefulWidget {
//   const dataWidget({Key? key}) : super(key: key);
//
//
//   @override
//   State<dataWidget> createState() => _dataWidgetState();
// }
//
// class _dataWidgetState extends State<dataWidget> {
//   int total = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     blurRadius: 1,
//                     color: primaryBackground,
//                     offset: Offset(0, 0),
//                   )
//                 ],
//               ),
//               child: Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Container(
//                       width: 80,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child:Container(
//                         width: 120,
//                         height: 120,
//                         clipBehavior: Clip.antiAlias,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                         ),
//                         child: Image.asset(
//                           'assets/image/profil-admin.jpg',
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                               padding:
//                               EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
//                               child:
//                               Text(
//                                 dataList.last.name,
//                                 style: GoogleFonts.montserrat(
//                                   color: Color(0xFF090F13),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               )
//                           ),
//                           Padding(
//                             padding:
//                             EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
//                             child: Text(
//                               dataList.last.email,
//                               style: bodyText2.copyWith(
//                                 fontFamily: 'Outfit',
//                                 color: Colors.blue,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           )
//
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Padding(
//           padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               if (Theme.of(context).brightness == Brightness.light)
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                   ),
//                   child: Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Status User',
//                           style: bodyText1,
//                         ),
//                         Text(
//                           'AKTIF',
//                           style:
//                           bodyText1.copyWith(
//                             fontFamily: 'Poppins',
//                             color: Color(0xFF1DD65A),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//         Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
//                   child: Text(
//                     'Account Settings',
//                     style: bodyText1,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
//               child: Container(
//                 width: double.infinity,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   color: primaryBackground,
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 5,
//                       color: Color(0x3416202A),
//                       offset: Offset(0, 2),
//                     )
//                   ],
//                   borderRadius: BorderRadius.circular(12),
//                   shape: BoxShape.rectangle,
//                 ),
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                         child: Text(
//                           'Change Password',
//                           style:
//                           bodyText2.copyWith(
//                             fontFamily: 'Outfit',
//                             color: secondaryText1,
//                             fontSize: 14,
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Align(
//                           alignment: AlignmentDirectional(0.9, 0),
//                           child: Icon(
//                             Icons.arrow_forward_ios,
//                             color: secondaryText1,
//                             size: 18,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
//               child: Container(
//                 width: double.infinity,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   color: primaryBackground,
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 5,
//                       color: Color(0x3416202A),
//                       offset: Offset(0, 2),
//                     )
//                   ],
//                   borderRadius: BorderRadius.circular(12),
//                   shape: BoxShape.rectangle,
//                 ),
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                         child: Text(
//                           'Edit Profile',
//                           style: bodyText2.copyWith(
//                             fontFamily: 'Outfit',
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Align(
//                           alignment: AlignmentDirectional(0.9, 0),
//                           child: Icon(
//                             Icons.arrow_forward_ios,
//                             color: secondaryText1,
//                             size: 18,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 80,
//                     height: 40,
//                     child: TextButton(
//                       onPressed: () {
//                         logOut();
//                         print('Logged Out');
//                       },
//                       child: Text('Log Out',
//                         style: bodyText2.copyWith(
//                           fontFamily: 'Lexend Deca',
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight: FontWeight.normal,
//                         ),),
//                       style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFFF82323),
//                         elevation: 1,
//                         side: BorderSide(
//                           color: Colors.transparent,
//                           width: 1,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//   logOut() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       prefs.remove("isLoggedIn");
//       prefs.remove("loginRole");
//       prefs.remove("loginId");
//       prefs.remove("loginName");
//       prefs.remove("loginEmail");
//       prefs.remove("loginTelp");
//     });
//
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//         builder: (BuildContext context) => const SignInSignUp2(),
//       ),
//           (route) => false,
//     );
//   }
// }

// class TidakLogin extends StatefulWidget {
//   const TidakLogin({Key? key}) : super(key: key);
//
//   @override
//   State<TidakLogin> createState() => _TidakLoginState();
// }
//
// class _TidakLoginState extends State<TidakLogin> {
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Container(
//               width: MediaQuery
//                   .of(context)
//                   .size
//                   .width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     blurRadius: 1,
//                     color: primaryBackground,
//                     offset: Offset(0, 0),
//                   )
//                 ],
//               ),
//               child: Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Container(
//                       width: 80,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Container(
//                         width: 120,
//                         height: 120,
//                         clipBehavior: Clip.antiAlias,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                         ),
//                         child: Image.asset(
//                           'assets/image/profil-admin.jpg',
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                               padding:
//                               EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
//                               child:
//                               Text(
//                                 "Hello Guest",
//                                 style: GoogleFonts.montserrat(
//                                   color: Color(0xFF090F13),
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               )
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//
//         Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 80,
//                     height: 40,
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/signinsignup');
//                         print('Logged Out');
//                       },
//                       child: Text('Log In',
//                         style: bodyText2.copyWith(
//                           fontFamily: 'Lexend Deca',
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight: FontWeight.normal,
//                         ),),
//                       style: TextButton.styleFrom(
//                         backgroundColor: Colors.green,
//                         elevation: 1,
//                         side: BorderSide(
//                           color: Colors.transparent,
//                           width: 1,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
// }

