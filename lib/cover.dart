import 'package:smooth_page_indicator/smooth_page_indicator.dart'
as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desa_wisata/theme.dart';

class CoverWidget extends StatefulWidget {
  const CoverWidget({Key? key}) : super(key: key);

  @override
  _CoverWidgetState createState() => _CoverWidgetState();
}

class _CoverWidgetState extends State<CoverWidget> {
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
                              Image.network(
                                'https://images.pexels.com/photos/3348363/pexels-photo-3348363.jpeg?cs=srgb&dl=pexels-max-ravier-3348363.jpg&fm=jpg',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fitHeight,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 0, 50, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/image/logo.png',
                                            width: 25,
                                            fit: BoxFit.fill,
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              'Go-Wisata',
                                              style:
                                              bodyText1.copyWith(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontSize: 23,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 300, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Welcome To',
                                                    style: bodyText1.copyWith(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 18,
                                                      color: primaryBackground,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Go-Wisata.id',
                                                    style: bodyText1.copyWith(
                                                      fontFamily: 'Poppins',
                                                      color: primaryBackground,
                                                      fontSize: 30,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Kami membantu wisata anda kapanpun\ndimanapun',
                                                    style: bodyText1.copyWith(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 14,
                                                      color: primaryBackground,
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
                                              20, 0, 50, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 0, 165, 0),
                                                    child: Text(
                                                      'Temukan',
                                                      style:
                                                      title2.copyWith(
                                                        fontFamily:
                                                        'Poppins',
                                                        color: primaryBackground,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Paket Wisata Menarik',
                                                    style: bodyText1.copyWith(
                                                      fontFamily: 'Roboto',
                                                      color: primaryBackground,
                                                      fontSize: 28,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        10, 0, 0, 0),
                                                    child: Text(
                                                      '\nBanyak pilihan paket menarik yang bisa\nditemukan di Go-Wisata',
                                                      style:
                                                      bodyText1.copyWith(
                                                        fontFamily:
                                                        'Poppins',
                                                        color: primaryBackground,
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                                          children: [],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40, 0, 50, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [],
                                        ),
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
                                'https://images.pexels.com/photos/1544376/pexels-photo-1544376.jpeg?auto=compress&cs=tinysrgb&w=1600',
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
                                          children: [],
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
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 50, 1),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/image/logo.png',
                                                  width: 25,
                                                  fit: BoxFit.fill,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Text(
                                                    'Go-Wisata',
                                                    style: bodyText1.copyWith(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                      fontSize: 23,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40, 0, 50, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 250, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 0, 130, 0),
                                                      child: Text(
                                                        'Ayo Liburan',
                                                        style:
                                                        title2.copyWith(
                                                          fontFamily:
                                                          'Poppins',
                                                          color: primaryBackground,
                                                          fontSize: 25,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Bersama Kami !',
                                                      style:
                                                      bodyText1.copyWith(
                                                        fontFamily:
                                                        'Roboto',
                                                        color: primaryBackground,
                                                        fontSize: 40,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0, 20,
                                                          190, 0),
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pushNamed(context, '/signinsignup');
                                                          print(
                                                              'Button pressed ...');
                                                        },
                                                        child: Text('Mulai', style: bodyText2.copyWith(
                                                          fontFamily: 'Poppins',
                                                          color: Colors
                                                              .white,
                                                          fontSize:
                                                          14,
                                                        ),
                                                        ),
                                                        style: TextButton.styleFrom(
                                                            backgroundColor: Color(0xFF435EBE),
                                                            side:
                                                            BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1,
                                                            ),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                            )
                                                        ),

                                                        // options:
                                                        // FFButtonOptions(
                                                        //   width: 90,
                                                        //   height: 40,
                                                        //   color:
                                                        //   Color(0xFF435EBE),
                                                        //   textStyle:
                                                        //   bodyText2.copyWith(
                                                        //     fontFamily:
                                                        //     'Poppins',
                                                        //     color: Colors
                                                        //         .white,
                                                        //     fontSize:
                                                        //     14,
                                                        //   ),
                                                        //   borderSide:
                                                        //   BorderSide(
                                                        //     color: Colors
                                                        //         .transparent,
                                                        //     width: 1,
                                                        //   ),
                                                        //   borderRadius:
                                                        //   BorderRadius
                                                        //       .circular(8),
                                                        // ),
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
                                            children: [],
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
