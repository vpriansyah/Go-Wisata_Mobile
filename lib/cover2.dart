import 'package:desa_wisata/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Cover extends StatefulWidget {
  const Cover({Key? key}) : super(key: key);

  @override
  _CoverState createState() => _CoverState();
}

class _CoverState extends State<Cover> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      PageView(
                        controller: pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                'assets/image/cover1.jpg',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fitHeight,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            50, 0, 50, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Go-Wisata',
                                              style:
                                              title1.copyWith(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 0, 50, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Temukan Liburan Anda',
                                                style:
                                                title1.copyWith(
                                                  fontFamily: 'Poppins',
                                                  color: primaryBackground,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: GradientText(
                                                  'Ayo Liburan\nBersama Kami',
                                                  textAlign: TextAlign.start,
                                                  style: title3.copyWith(
                                                    fontFamily: 'Poppins',
                                                    color: primaryBackground,
                                                    fontSize: 37,
                                                  ),
                                                  colors: [
                                                    Color(0xFF39EFEB),
                                                    Color(0xFF39D2C0)
                                                  ],
                                                  gradientDirection:
                                                  GradientDirection.ltr,
                                                  gradientType:
                                                  GradientType.linear,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: TextButton.icon(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  label: Text('Eksplor'),
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_right,
                                                    size: 20,
                                                  ),
                                                  // options: FFButtonOptions(
                                                  //   width: 130,
                                                  //   height: 40,
                                                  //   color: Color(0xCE4B39EF),
                                                  //   textStyle: FlutterFlowTheme
                                                  //       .of(context)
                                                  //       .subtitle2
                                                  //       .override(
                                                  //     fontFamily: 'Poppins',
                                                  //     color: Colors.white,
                                                  //     fontSize: 10,
                                                  //   ),
                                                  //   borderSide: BorderSide(
                                                  //     color: Colors.transparent,
                                                  //     width: 1,
                                                  //   ),
                                                  //   borderRadius:
                                                  //   BorderRadius.circular(
                                                  //       8),
                                                  // ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              50, 0, 50, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                child: Text ('Sign Up'),
                                                // options: FFButtonOptions(
                                                //   width: 130,
                                                //   height: 40,
                                                //   color: FlutterFlowTheme.of(
                                                //       context)
                                                //       .secondaryColor,
                                                //   textStyle: FlutterFlowTheme
                                                //       .of(context)
                                                //       .subtitle2
                                                //       .override(
                                                //     fontFamily: 'Poppins',
                                                //     color: Colors.white,
                                                //     fontSize: 10,
                                                //   ),
                                                //   borderSide: BorderSide(
                                                //     color: Colors.transparent,
                                                //     width: 1,
                                                //   ),
                                                //   borderRadius:
                                                //   BorderRadius.circular(8),
                                                // ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                child: Text ('Sign In'),
                                                // options: FFButtonOptions(
                                                //   width: 130,
                                                //   height: 40,
                                                //   color: FlutterFlowTheme.of(
                                                //       context)
                                                //       .secondaryColor,
                                                //   textStyle: FlutterFlowTheme
                                                //       .of(context)
                                                //       .subtitle2
                                                //       .override(
                                                //     fontFamily: 'Poppins',
                                                //     color: Colors.white,
                                                //     fontSize: 10,
                                                //   ),
                                                //   borderSide: BorderSide(
                                                //     color: Colors.transparent,
                                                //     width: 1,
                                                //   ),
                                                //   borderRadius:
                                                //   BorderRadius.circular(8),
                                                // ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Stack(
                              children: [
                                Image.network(
                                  'https://media.cntraveler.com/photos/5bbe1d326477eb358f14364d/16:9/w_1920,c_limit/Viceroy-Bali__2018_sunrise-at-viceroy-bali.jpg',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              50, 0, 50, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Go-Wisata',
                                                style:
                                                title1.copyWith(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40, 0, 50, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: Text(
                                                    'Temukan Hotel\nFavorit Anda',
                                                    textAlign: TextAlign.start,
                                                    style: title3.copyWith(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                      Color(0xFF2A2A2A),
                                                      fontSize: 37,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: TextButton.icon(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    label: Text('Eksplor'),
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_right,
                                                      size: 20,
                                                    ),
                                                    // options: FFButtonOptions(
                                                    //   width: 130,
                                                    //   height: 40,
                                                    //   color: Color(0xCE4B39EF),
                                                    //   textStyle:
                                                    //   FlutterFlowTheme.of(
                                                    //       context)
                                                    //       .subtitle2
                                                    //       .override(
                                                    //     fontFamily:
                                                    //     'Poppins',
                                                    //     color: Colors
                                                    //         .white,
                                                    //     fontSize: 10,
                                                    //   ),
                                                    //   borderSide: BorderSide(
                                                    //     color:
                                                    //     Colors.transparent,
                                                    //     width: 1,
                                                    //   ),
                                                    //   borderRadius:
                                                    //   BorderRadius.circular(
                                                    //       8),
                                                    // ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                50, 0, 50, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  child: Text('Sign Up'),
                                                  // options: FFButtonOptions(
                                                  //   width: 130,
                                                  //   height: 40,
                                                  //   color: FlutterFlowTheme.of(
                                                  //       context)
                                                  //       .secondaryColor,
                                                  //   textStyle: FlutterFlowTheme
                                                  //       .of(context)
                                                  //       .subtitle2
                                                  //       .override(
                                                  //     fontFamily: 'Poppins',
                                                  //     color: Colors.white,
                                                  //     fontSize: 10,
                                                  //   ),
                                                  //   borderSide: BorderSide(
                                                  //     color: Colors.transparent,
                                                  //     width: 1,
                                                  //   ),
                                                  //   borderRadius:
                                                  //   BorderRadius.circular(
                                                  //       8),
                                                  // ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  child: Text('Sign In'),
                                                  // options: FFButtonOptions(
                                                  //   width: 130,
                                                  //   height: 40,
                                                  //   color: Color(0xFF39D2C0),
                                                  //   textStyle: FlutterFlowTheme
                                                  //       .of(context)
                                                  //       .subtitle2
                                                  //       .override(
                                                  //     fontFamily: 'Poppins',
                                                  //     color: Colors.white,
                                                  //     fontSize: 10,
                                                  //   ),
                                                  //   borderSide: BorderSide(
                                                  //     color: Colors.transparent,
                                                  //     width: 1,
                                                  //   ),
                                                  //   borderRadius:
                                                  //   BorderRadius.circular(
                                                  //       8),
                                                  // ),
                                                ),
                                              ],
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
                          Stack(
                            children: [
                              Image.network(
                                'https://img.wallpaper.sc/android/images/1080x1920/android-1080x1920-wallpaper_00353.jpg',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            50, 0, 50, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Go-Wisata',
                                              style:
                                              title1.copyWith(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 0, 50, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: GradientText(
                                                  'Temukan Spot\nLiburan Menarik',
                                                  textAlign: TextAlign.start,
                                                  style: title3.copyWith(
                                                    fontFamily: 'Poppins',
                                                    color: primaryBackground,
                                                    fontSize: 37,
                                                  ),
                                                  colors: [
                                                    Color(0xFF39EFEB),
                                                    Color(0xFF39D2C0)
                                                  ],
                                                  gradientDirection:
                                                  GradientDirection.ltr,
                                                  gradientType:
                                                  GradientType.linear,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: TextButton.icon(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  label: Text ('Eksplor'),
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_right,
                                                    size: 20,
                                                  ),
                                                  // options: FFButtonOptions(
                                                  //   width: 130,
                                                  //   height: 40,
                                                  //   color: Color(0xCE4B39EF),
                                                  //   textStyle: FlutterFlowTheme
                                                  //       .of(context)
                                                  //       .subtitle2
                                                  //       .override(
                                                  //     fontFamily: 'Poppins',
                                                  //     color: Colors.white,
                                                  //     fontSize: 10,
                                                  //   ),
                                                  //   borderSide: BorderSide(
                                                  //     color: Colors.transparent,
                                                  //     width: 1,
                                                  //   ),
                                                  //   borderRadius:
                                                  //   BorderRadius.circular(
                                                  //       8),
                                                  // ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              50, 0, 50, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                child: Text('Sign Up'),
                                                // options: FFButtonOptions(
                                                //   width: 130,
                                                //   height: 40,
                                                //   color: FlutterFlowTheme.of(
                                                //       context)
                                                //       .secondaryColor,
                                                //   textStyle: FlutterFlowTheme
                                                //       .of(context)
                                                //       .subtitle2
                                                //       .override(
                                                //     fontFamily: 'Poppins',
                                                //     color: Colors.white,
                                                //     fontSize: 10,
                                                //   ),
                                                //   borderSide: BorderSide(
                                                //     color: Colors.transparent,
                                                //     width: 1,
                                                //   ),
                                                //   borderRadius:
                                                //   BorderRadius.circular(8),
                                                // ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                child: Text('Sign In'),
                                                // options: FFButtonOptions(
                                                //   width: 130,
                                                //   height: 40,
                                                //   color: Color(0xFF39D2C0),
                                                //   textStyle: FlutterFlowTheme
                                                //       .of(context)
                                                //       .subtitle2
                                                //       .override(
                                                //     fontFamily: 'Poppins',
                                                //     color: Colors.white,
                                                //     fontSize: 10,
                                                //   ),
                                                //   borderSide: BorderSide(
                                                //     color: Colors.transparent,
                                                //     width: 1,
                                                //   ),
                                                //   borderRadius:
                                                //   BorderRadius.circular(8),
                                                // ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: pageViewController ??=
                                PageController(initialPage: 0),
                            count: 3,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) {
                              pageViewController!.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: smooth_page_indicator.ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 10,
                              dotHeight: 6,
                              dotColor: Color(0xFFB3B0B0),
                              activeDotColor: Color(0xFF27389E),
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
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
    );
  }
}
