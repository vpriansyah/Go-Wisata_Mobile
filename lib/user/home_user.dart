import 'package:desa_wisata/theme.dart';
import 'package:flutter/material.dart';
import 'package:desa_wisata/user/daftar_kuliner_user.dart';
import 'package:desa_wisata/user/daftar_lainnya_user%20.dart';
import 'package:desa_wisata/user/daftar_penginapan_user%20.dart';
import 'package:desa_wisata/user/wisata_user.dart';
import 'package:flutter/scheduler.dart';
import 'dart:ui';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class home_user extends StatefulWidget {
  const home_user({Key? key}) : super(key: key);

  @override
  _home_userState createState() => _home_userState();
}

class _home_userState extends State<home_user> with TickerProviderStateMixin {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                height: 500,
                child: Stack(
                  alignment: AlignmentDirectional(0, -1),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.05, -1),
                      child: Image.asset(
                        'assets/image/header1.JPG',
                        width: double.infinity,
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Color(0x8D090F13),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 35, 16, 10),
                              child: Text(
                                'Ayo Liburan, \nBersama Kami !',
                                style: title1.copyWith(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(16, 15, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: textController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: bodyText2.copyWith(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        hintText: 'Cari paket wisata',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(16),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(16),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(16),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(16),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Color(0xFF1D2429),
                                          size: 16,
                                        ),
                                      ),
                                      style: bodyText1.copyWith(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF1D2429),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                              child: Container(
                                width: double.infinity,
                                height: 700,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 16),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Divider(
                                          height: 8,
                                          thickness: 4,
                                          indent: 140,
                                          endIndent: 140,
                                          color: Color(0xFFE0E3E7),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 16, 16, 0),
                                          child: Text(
                                            'Pilihan menu Go-Wisata',
                                            style: title2.copyWith(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF1D2429),
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 4, 16, 0),
                                          child: Text(
                                            'Beragam menu pilihan yang tersedia',
                                            style: bodyText2.copyWith(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF57636C),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 225,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: ListView(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 8, 0, 8),
                                                  child: Container(
                                                    width: 270,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 8,
                                                          color:
                                                          Color(0x230F1113),
                                                          offset: Offset(0, 4),
                                                        )
                                                      ],
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12),
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => WisataUser(),
                                                          ),
                                                        );
                                                      },
                                                    child: // Generated code for this Column Widget...
                                                    Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.only(
                                                            bottomLeft: Radius.circular(0),
                                                            bottomRight: Radius.circular(0),
                                                            topLeft: Radius.circular(12),
                                                            topRight: Radius.circular(12),
                                                          ),
                                                          child: Image.asset(
                                                            'assets/image/wahana1.JPG',
                                                            width: double.infinity,
                                                            height: 110,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                                                          child: Row(
                                                            mainAxisSize: MainAxisSize.max,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Paket Wahana',
                                                                    style: bodyText1.copyWith(
                                                                      fontFamily: 'Outfit',
                                                                      color: Color(0xFF1D2429),
                                                                      fontSize: 18,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                                                                    child: Text(
                                                                      'Temukan paket wahana menarik disini',
                                                                      style: bodyText2.copyWith(
                                                                        fontFamily: 'Outfit',
                                                                        color: Color(0xFF57636C),
                                                                        fontSize: 12,
                                                                        fontWeight: FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    )
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 8, 16, 8),
                                                  child: Container(
                                                    width: 270,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 8,
                                                          color:
                                                          Color(0x230F1113),
                                                          offset: Offset(0, 4),
                                                        )
                                                      ],
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12),
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => WisataUser(),
                                                          ),
                                                        );
                                                      },
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.only(
                                                            bottomLeft:
                                                            Radius.circular(
                                                                0),
                                                            bottomRight:
                                                            Radius.circular(
                                                                0),
                                                            topLeft:
                                                            Radius.circular(
                                                                12),
                                                            topRight:
                                                            Radius.circular(
                                                                12),
                                                          ),
                                                          child: Image.asset(
                                                            'assets/image/event1.JPG',
                                                            width:
                                                            double.infinity,
                                                            height: 110,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              16,
                                                              12,
                                                              16,
                                                              12),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                        MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Event',
                                                                            style:bodyText1.copyWith(
                                                                              fontFamily: 'Outfit',
                                                                              color: Color(0xFF1D2429),
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                3,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                            Text(
                                                                              'Temukan event menarik disini',
                                                                              style: bodyText2.copyWith(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF57636C),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                            ),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ],
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 8, 16, 8),
                                                  child: Container(
                                                    width: 270,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 8,
                                                          color:
                                                          Color(0x230F1113),
                                                          offset: Offset(0, 4),
                                                        )
                                                      ],
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12),
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => DaftarKulinerUser(),
                                                          ),
                                                        );
                                                      },
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.only(
                                                            bottomLeft:
                                                            Radius.circular(
                                                                0),
                                                            bottomRight:
                                                            Radius.circular(
                                                                0),
                                                            topLeft:
                                                            Radius.circular(
                                                                12),
                                                            topRight:
                                                            Radius.circular(
                                                                12),
                                                          ),
                                                          child: Image.asset(
                                                            'assets/image/makanan1.JPG',
                                                            width:
                                                            double.infinity,
                                                            height: 110,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              16,
                                                              12,
                                                              16,
                                                              12),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Text(
                                                                        'Kuliner',
                                                                        style: bodyText1.copyWith(
                                                                          fontFamily: 'Outfit',
                                                                          color: Color(0xFF1D2429),
                                                                          fontSize: 18,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            3,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                        Text(
                                                                          'Temukan paket kuliner menarik disini',
                                                                          style: bodyText2.copyWith(
                                                                            fontFamily: 'Outfit',
                                                                            color: Color(0xFF57636C),
                                                                            fontSize: 12,
                                                                            fontWeight: FontWeight.normal,
                                                                          ),
                                                                        ),
                                                                      ),

                                                                    ],
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 8, 16, 8),
                                                  child: Container(
                                                    width: 270,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 8,
                                                          color:
                                                          Color(0x230F1113),
                                                          offset: Offset(0, 4),
                                                        )
                                                      ],
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12),
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => DaftarPenginapanUser(),
                                                          ),
                                                        );
                                                      },
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.only(
                                                            bottomLeft:
                                                            Radius.circular(
                                                                0),
                                                            bottomRight:
                                                            Radius.circular(
                                                                0),
                                                            topLeft:
                                                            Radius.circular(
                                                                12),
                                                            topRight:
                                                            Radius.circular(
                                                                12),
                                                          ),
                                                          child: Image.asset(
                                                            'assets/image/penginapan1.JPG',
                                                            width:
                                                            double.infinity,
                                                            height: 110,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              16,
                                                              12,
                                                              16,
                                                              12),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Text(
                                                                        'Penginapan',
                                                                        style: bodyText1.copyWith(
                                                                          fontFamily: 'Outfit',
                                                                          color: Color(0xFF1D2429),
                                                                          fontSize: 18,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            3,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                        Text(
                                                                          'Temukan penginapan ternyaman',
                                                                          style: bodyText2.copyWith(
                                                                            fontFamily: 'Outfit',
                                                                            color: Color(0xFF57636C),
                                                                            fontSize: 12,
                                                                            fontWeight: FontWeight.normal,
                                                                          ),
                                                                        ),
                                                                      ),

                                                                    ],
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 8, 16, 8),
                                                  child: Container(
                                                    width: 270,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 8,
                                                          color:
                                                          Color(0x230F1113),
                                                          offset: Offset(0, 4),
                                                        )
                                                      ],
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12),
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => WisataUser(),
                                                          ),
                                                        );
                                                      },
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.only(
                                                            bottomLeft:
                                                            Radius.circular(
                                                                0),
                                                            bottomRight:
                                                            Radius.circular(
                                                                0),
                                                            topLeft:
                                                            Radius.circular(
                                                                12),
                                                            topRight:
                                                            Radius.circular(
                                                                12),
                                                          ),
                                                          child: Image.asset(
                                                            'assets/image/lainnya1.JPG',
                                                            width:
                                                            double.infinity,
                                                            height: 110,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              16,
                                                              12,
                                                              16,
                                                              12),
                                                          child: Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Text(
                                                                        'Lainnya',
                                                                        style: bodyText1.copyWith(
                                                                          fontFamily: 'Outfit',
                                                                          color: Color(0xFF1D2429),
                                                                          fontSize: 18,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            3,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                        Text(
                                                                          'Lain - lain',
                                                                          style: bodyText2.copyWith(
                                                                            fontFamily: 'Outfit',
                                                                            color: Color(0xFF57636C),
                                                                            fontSize: 12,
                                                                            fontWeight: FontWeight.normal,
                                                                          ),
                                                                        ),
                                                                      ),

                                                                    ],
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 16, 16, 0),
                                          child: Text(
                                            'Paket Wisata Desa',
                                            style: title2.copyWith(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF1D2429),
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 15, 0, 2),
                                          child: ListView(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 8, 16, 8),
                                                child: Container(
                                                  width: 270,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 8,
                                                        color:
                                                        Color(0x230F1113),
                                                        offset: Offset(0, 4),
                                                      )
                                                    ],
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [
                                                      Hero(
                                                        tag: 'italyImage',
                                                        transitionOnUserGestures:
                                                        true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.only(
                                                            bottomLeft:
                                                            Radius.circular(
                                                                0),
                                                            bottomRight:
                                                            Radius.circular(
                                                                0),
                                                            topLeft:
                                                            Radius.circular(
                                                                12),
                                                            topRight:
                                                            Radius.circular(
                                                                12),
                                                          ),
                                                          child: Image.network(
                                                            'https://static.republika.co.id/uploads/member/images/news/16vux0xd71.jpg',
                                                            width:
                                                            double.infinity,
                                                            height: 200,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16,
                                                            12, 16, 12),
                                                        child: Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  'Desa Wisata Kare',
                                                                  style: bodyText1.copyWith(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    color: Color(
                                                                        0xFF1D2429),
                                                                    fontSize:
                                                                    18,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      0,
                                                                      8,
                                                                      0,
                                                                      0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    children: [
                                                                      Text(
                                                                        'Paket Wisata Desa Kare',
                                                                        style: bodyText2.copyWith(
                                                                          fontFamily: 'Outfit',
                                                                          color: Color(0xFF57636C),
                                                                          fontSize: 14,
                                                                          fontWeight: FontWeight.normal,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: 70,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Color(
                                                                    0xFF1D2429),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    12),
                                                              ),
                                                              alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                              child:
                                                              TextButton(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                child: Text('Pilih',
                                                                    style: bodyText2.copyWith(
                                                                  fontFamily:
                                                                  'Poppins',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                  9,
                                                                ),),
                                                                style:
                                                                TextButton.styleFrom(
                                                                  backgroundColor: Color(
                                                                      0x10121358),
                                                                  side:
                                                                  BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                      .circular(
                                                                      8),)
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 8, 16, 8),
                                                child: Container(
                                                  width: 270,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 8,
                                                        color:
                                                        Color(0x230F1113),
                                                        offset: Offset(0, 4),
                                                      )
                                                    ],
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                        BorderRadius.only(
                                                          bottomLeft:
                                                          Radius.circular(
                                                              0),
                                                          bottomRight:
                                                          Radius.circular(
                                                              0),
                                                          topLeft:
                                                          Radius.circular(
                                                              12),
                                                          topRight:
                                                          Radius.circular(
                                                              12),
                                                        ),
                                                        child: Image.network(
                                                          'https://sarangan.magetan.go.id/media/img/berita/berita_6968633f9c0fdce341.41579476.jpg',
                                                          width:
                                                          double.infinity,
                                                          height: 200,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16,
                                                            12, 16, 12),
                                                        child: Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  'Wisata Sarangan',
                                                                  style: bodyText1.copyWith(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    color: Color(
                                                                        0xFF1D2429),
                                                                    fontSize:
                                                                    18,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      0,
                                                                      8,
                                                                      0,
                                                                      0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    children: [
                                                                      Text(
                                                                        'Paket Wisata Sarangan',
                                                                        style: bodyText2.copyWith(
                                                                          fontFamily: 'Outfit',
                                                                          color: Color(0xFF57636C),
                                                                          fontSize: 14,
                                                                          fontWeight: FontWeight.normal,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: 70,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Color(
                                                                    0xFF1D2429),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    12),
                                                              ),
                                                              alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                              child:
                                                              TextButton(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                child: Text('Pilih'),
                                                                style:
                                                                TextButton.styleFrom(
                                                                  backgroundColor: Color(
                                                                      0x10121358),
                                                                  textStyle: bodyText2.copyWith(
                                                                    fontFamily:
                                                                    'Poppins',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                    9,
                                                                  ),
                                                                  side:
                                                                  BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  shape: RoundedRectangleBorder
                                                                    (borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      8),)
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 8, 16, 8),
                                                child: Container(
                                                  width: 270,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 8,
                                                        color:
                                                        Color(0x230F1113),
                                                        offset: Offset(0, 4),
                                                      )
                                                    ],
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                        BorderRadius.only(
                                                          bottomLeft:
                                                          Radius.circular(
                                                              0),
                                                          bottomRight:
                                                          Radius.circular(
                                                              0),
                                                          topLeft:
                                                          Radius.circular(
                                                              12),
                                                          topRight:
                                                          Radius.circular(
                                                              12),
                                                        ),
                                                        child: Image.network(
                                                          'https://images.solopos.com/2022/02/Watu-gambir.jpg',
                                                          width:
                                                          double.infinity,
                                                          height: 200,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16,
                                                            12, 16, 12),
                                                        child: Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  'Wisata Watu Gambir',
                                                                  style: bodyText1.copyWith(
                                                                    fontFamily:
                                                                    'Outfit',
                                                                    color: Color(
                                                                        0xFF1D2429),
                                                                    fontSize:
                                                                    18,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      0,
                                                                      8,
                                                                      0,
                                                                      0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    children: [
                                                                      Text(
                                                                        'Paket Wisata Watu Gambir',
                                                                        style: bodyText2.copyWith(
                                                                          fontFamily: 'Outfit',
                                                                          color: Color(0xFF57636C),
                                                                          fontSize: 14,
                                                                          fontWeight: FontWeight.normal,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: 70,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Color(
                                                                    0xFF1D2429),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    12),
                                                              ),
                                                              alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                              child:
                                                              TextButton(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                child: Text('Pilih'),
                                                                style:
                                                                TextButton.styleFrom(
                                                                  backgroundColor: Color(
                                                                      0x10121358),
                                                                  textStyle: bodyText2.copyWith(
                                                                    fontFamily:
                                                                    'Poppins',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                    9,
                                                                  ),
                                                                  side:
                                                                  BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      8),)
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
                                              Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  color: primaryBackground,
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  color: primaryBackground,
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
                            ),
                          ],
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
    );
  }
}