import 'package:desa_wisata/data.dart';
import 'package:desa_wisata/theme.dart';
import 'package:desa_wisata/user/tiket.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DaftarPesananUser2 extends StatefulWidget {
  const DaftarPesananUser2({Key? key}) : super(key: key);

  @override
  _DaftarPesananUser2State createState() => _DaftarPesananUser2State();
}

class _DaftarPesananUser2State extends State<DaftarPesananUser2> {
  String token = "kosong";
  bool isLoadid = true;
  String id = '';
  @override
  void initState() {
    setState(() {});
    // TODO: implement initState
    gettoken().then((value) {
      token = value;
    });
    getid().then((value) {
      setState(() {
        id = value;
        isLoadid = false;
      });
    });

    super.initState();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: Colors.transparent,
          // borderColor: Colors.transparent,
          // borderRadius: 30,
          // borderWidth: 1,
          // buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/home-user');
          },
        ),
        title: Text(
          'Daftar Pesanan',
          style: subtitle2,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 8, 0),
                    child: TextFormField(
                      // controller: searchBarController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Search for your order...',
                        labelStyle: bodyText2,
                        hintStyle: bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: secondaryText1,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: secondaryText1,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor:
                        primaryBackground,
                        contentPadding:
                        EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                        prefixIcon: Icon(
                          Icons.search,
                          color: secondaryText1,
                          size: 16,
                        ),
                      ),
                      style: bodyText1,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 12, 0),
                  child: IconButton(
                    color: Colors.transparent,
                    // borderColor: Colors.transparent,
                    // borderRadius: 30,
                    // borderWidth: 1,
                    // buttonSize: 50,
                    icon: Icon(
                      Icons.search_sharp,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.blue,
                      unselectedLabelColor:
                      secondaryText1,
                      labelStyle:
                      subtitle1.copyWith(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                      indicatorColor: Colors.blue,
                      tabs: [
                        Tab(
                          text: 'Pending',
                        ),
                        Tab(
                          text: 'Process',
                        ),
                        Tab(
                          text: 'Complete',
                        ),
                      ],
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

// TODO change backend API
  final String baseUrl = 'http://go-wisata.id/';
  final String apiUrl = 'http://go-wisata.id/api/';

  getid() async {
    final sf = await SharedPreferences.getInstance();
    String token = sf.getString('id').toString();
    return token;
  }

  gettoken() async {
    final sf = await SharedPreferences.getInstance();
    String token = sf.getString('token').toString();
    return token;
  }

  Future getPesanan() async {
    final Data datas = dataList[dataList.length - 1];
    String token = datas.id;
    print(token);
    http.Response response = await http.post(
      Uri.parse("${apiUrl}tiket?id=$token"),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'id': token,
      }),
    );
    if (response.statusCode != 200) {
      return null;
    } else {
      return json.decode(response.body);
    }
  }

  Future getTransaksi() async {
    final Data datas = dataList[dataList.length - 1];
    String token = datas.id;
    http.Response response = await http.get(
      Uri.parse(apiUrl + "daftartransaksi?id=" + token),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      return null;
    } else {
      return json.decode(response.body);
    }
  }
}

class isidaftar extends StatelessWidget {
  final String name;
  final String date;
  final String price;
  const isidaftar(
      {Key? key, required this.name, required this.date, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: background3,
          boxShadow: [
            BoxShadow(
              color: Color(0xff22282F),
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    // 'Tiket Masuk Watu Gambir',
                    style: subtitle1.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Text(
                      date,
                      // 'Feb 15, 2022',
                      style: bodyText2,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Rp " + price,
                    // 'Rp. 15.000',
                    style: bodyText2,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class titlewidget extends StatelessWidget {
  const titlewidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
            child: Text(
              'Purchase History',
              style: bodyText2,
            ),
          ),
        ]);
  }
}
