import 'package:desa_wisata/theme.dart';
import 'package:desa_wisata/user/menu%20pilihan/kuliner/daftar_kuliner_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TempatKulinerUser extends StatefulWidget {
  const TempatKulinerUser({Key? key}) : super(key: key);

  @override
  _TempatKulinerUserState createState() => _TempatKulinerUserState();
}

class _TempatKulinerUserState extends State<TempatKulinerUser> {
  refresh() {
    setState(() {});
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Pilihan Kuliner',
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: primaryBackground,
      body: FutureBuilder(
          future: getTempat(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return
                      //Text(snapshot.toString());
                      dataWidget(
                    // baseUrl: baseUrl,
                    snapshot: snapshot,
                    index: index,
                    refresh: refresh,
                  );
                },
                itemCount: snapshot.data.length,
              ); // This trailing comma makes auto-formatting nicer for build methods.

            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // return Text('Data Error');
          }),
    );
  }

  final String apiUrl = 'http://go-wisata.id/api/kuliner';

  Future<List<Map<String, dynamic>>?> fetch() async {
    http.Response response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode != 200) return null;
    return List<Map<String, dynamic>>.from(json.decode(response.body)['data']);
  }

  Future getTempat() async {
    var response = await http.get(Uri.parse(apiUrl));
    return json.decode(response.body);
  }
}

final String baseUrl = 'http://go-wisata.id/';

class dataWidget extends StatefulWidget {
  const dataWidget({
    Key? key,
    required this.snapshot,
    required this.index,
    required this.refresh,
  }) : super(key: key);

  final AsyncSnapshot snapshot;
  final int index;
  final Function() refresh;

  @override
  State<dataWidget> createState() => _dataWidgetState();
}

class _dataWidgetState extends State<dataWidget> {
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 10),
                child: InkWell(
                  onTap: () async {
                    // print(widget.snapshot.data[widget.index]['id']);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Daftar_KulinerUser(
                          idMenu: widget.snapshot.data[widget.index]['id']
                              .toString(),
                          indexMenu: widget.index,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 270,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Color(0x230F1113),
                          offset: Offset(0, 4),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image.network(
                            baseUrl +
                                'images/' +
                                widget.snapshot.data[widget.index]['image'],
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(16, 16, 16, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 0, 3, 0),
                                      child: Text(
                                        widget.snapshot.data[widget.index]
                                        ['name'] ??
                                            '-',
                                        style: bodyText1.copyWith(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF1D2429),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 3, 0),
                                            child:
                                            Icon(Icons.location_on_outlined),
                                          ),
                                          Flexible(
                                            child: Text(
                                              widget.snapshot.data[widget.index]
                                              ['alamat'] ??
                                                  '-',
                                              style: bodyText2.copyWith(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF57636C),
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
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
                        ),
                      ],
                    ),
                  ),
                  // child: Container(
                  //   width: 270,
                  //   height: 150,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     boxShadow: [
                  //       BoxShadow(
                  //         blurRadius: 8,
                  //         color: Color(0x32000000),
                  //         offset: Offset(0, 4),
                  //       )
                  //     ],
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       ClipRRect(
                  //         borderRadius: BorderRadius.only(
                  //           bottomLeft: Radius.circular(),
                  //           bottomRight: Radius.circular(0),
                  //           topLeft: Radius.circular(8),
                  //           topRight: Radius.circular(0),
                  //         ),
                  //         child: Image.network(
                  //             baseUrl +
                  //                 'images/' +
                  //                 widget.snapshot.data[widget.index]['image'],
                  //             width: MediaQuery.of(context).size.width * 0.25,
                  //             height: MediaQuery.of(context).size.height * 1,
                  //             fit: BoxFit.cover, loadingBuilder:
                  //                 (BuildContext context, Widget child,
                  //                     ImageChunkEvent? loadingProgress) {
                  //           if (loadingProgress == null) return child;
                  //           return Center(
                  //             child: CircularProgressIndicator(
                  //               value: loadingProgress.expectedTotalBytes !=
                  //                       null
                  //                   ? loadingProgress.cumulativeBytesLoaded /
                  //                       loadingProgress.expectedTotalBytes!
                  //                   : null,
                  //             ),
                  //           );
                  //         }),
                  //       ),
                  //       Expanded(
                  //         child: Padding(
                  //           padding:
                  //               EdgeInsetsDirectional.fromSTEB(12, 0, 5, 0),
                  //           child: Column(
                  //             mainAxisSize: MainAxisSize.max,
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Padding(
                  //                 padding: EdgeInsetsDirectional.fromSTEB(
                  //                     0, 10, 0, 10),
                  //                 child: Text(
                  //                   // 'Watu Gambir',
                  //                   widget.snapshot.data[widget.index]
                  //                           ['name'] ??
                  //                       '-',
                  //                   style: title3,
                  //                 ),
                  //               ),
                  //               Expanded(
                  //                 child: Padding(
                  //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //                       0, 0, 0, 10),
                  //                   child: Text(
                  //                     widget.snapshot.data[widget.index]
                  //                             ['alamat'] ??
                  //                         '-',
                  //                     maxLines: 4,
                  //                     style: bodyText1.copyWith(
                  //                       fontWeight: FontWeight.normal,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
