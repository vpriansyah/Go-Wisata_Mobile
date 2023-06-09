import 'package:desa_wisata/admin/main_page_admin.dart';
import 'package:desa_wisata/theme.dart';
import 'package:desa_wisata/user/dashboard/main_page_user.dart';
import 'package:desa_wisata/user/menu%20pilihan/event/event_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DaftarEventUser extends StatefulWidget {
  const DaftarEventUser({Key? key}) : super(key: key);

  @override
  _DaftarEventUserState createState() => _DaftarEventUserState();
}

class _DaftarEventUserState extends State<DaftarEventUser> {
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
          'Daftar Event',
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: primaryBackground,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
        child: FutureBuilder(
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
      ),
    );
  }

  final String apiUrl = 'http://go-wisata.id/api/listevent';

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
        SizedBox(
          height: 320,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Daftar_EventUser(
                          idEvent: widget.snapshot.data[widget.index]['id']
                              .toString(),
                          indexEvent: widget.index,
                          ),
                        ));
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
                                    widget.snapshot.data[widget.index]['foto'],
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
                                            ['nama'] ??
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
                                            mainAxisSize: MainAxisSize.max,
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
                                                  ['lokasi'] ??
                                                      '-',
                                                  style: bodyText2.copyWith(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
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
                    ),
                  ),
                ]
            ),
          ),
        )
      ],
    );
    // return Column(
    //   mainAxisSize: MainAxisSize.max,
    //   children: [
    //     Padding(
    //       padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
    //       child: ListView(
    //         padding: EdgeInsets.zero,
    //         shrinkWrap: true,
    //         scrollDirection: Axis.vertical,
    //         physics: NeverScrollableScrollPhysics(),
    //         children: [
    //           Padding(
    //             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
    //             child: InkWell(
    //               onTap: () async {
    //                 // print(widget.snapshot.data[widget.index]['id']);
    //                 // await Navigator.push(
    //                 //   context,
    //                 //   MaterialPageRoute(
    //                 //     builder: (context) => Daftar_EventUser(
    //                 //       idEvent: widget.snapshot.data[widget.index]['id']
    //                 //           .toString(),
    //                 //       indexEvent: widget.index,
    //                 //     ),
    //                 //   ),
    //                 // );
    //               },
    //               child: Container(
    //                 width: double.infinity,
    //                 height: 150,
    //                 decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   boxShadow: [
    //                     BoxShadow(
    //                       blurRadius: 3,
    //                       color: Color(0x32000000),
    //                       offset: Offset(0, 1),
    //                     )
    //                   ],
    //                   borderRadius: BorderRadius.circular(8),
    //                 ),
    //                 child: Row(
    //                   mainAxisSize: MainAxisSize.max,
    //                   children: [
    //                     Container(
    //                       width: 100,
    //                       // borderRadius: BorderRadius.only(
    //                       //   bottomLeft: Radius.circular(8),
    //                       //   bottomRight: Radius.circular(0),
    //                       //   topLeft: Radius.circular(8),
    //                       //   topRight: Radius.circular(0),
    //
    //                       child: Image.network(
    //                           baseUrl +
    //                               'images/' +
    //                               widget.snapshot.data[widget.index]['foto'],
    //                           width: MediaQuery.of(context).size.width * 0.25,
    //                           height: MediaQuery.of(context).size.height * 1,
    //                           fit: BoxFit.cover, loadingBuilder:
    //                               (BuildContext context, Widget child,
    //                                   ImageChunkEvent? loadingProgress) {
    //                         if (loadingProgress == null) return child;
    //                         return Center(
    //                           child: CircularProgressIndicator(
    //                             value: loadingProgress.expectedTotalBytes !=
    //                                     null
    //                                 ? loadingProgress.cumulativeBytesLoaded /
    //                                     loadingProgress.expectedTotalBytes!
    //                                 : null,
    //                           ),
    //                         );
    //                       }),
    //                     ),
    //                     Expanded(
    //                       child: Padding(
    //                         padding:
    //                             EdgeInsetsDirectional.fromSTEB(12, 0, 5, 0),
    //                         child: Column(
    //                           mainAxisSize: MainAxisSize.max,
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Padding(
    //                               padding: EdgeInsetsDirectional.fromSTEB(
    //                                   0, 10, 0, 10),
    //                               child: Text(
    //                                 // 'Watu Gambir',
    //                                 widget.snapshot.data[widget.index]
    //                                         ['nama'] ??
    //                                     '-',
    //                                 style: title3,
    //                               ),
    //                             ),
    //                             Expanded(
    //                               child: Padding(
    //                                 padding: EdgeInsetsDirectional.fromSTEB(
    //                                     0, 0, 0, 10),
    //                                 child: Text(
    //                                   // 'Desa wisata dengan beragam akomodasi yang tersedia. Setiap wahana dapat dimainkan oleh segala usia',
    //                                   widget.snapshot.data[widget.index]
    //                                           ['deskripsi'] ??
    //                                       '-',
    //                                   maxLines: 4,
    //                                   style: bodyText1.copyWith(
    //                                     fontWeight: FontWeight.normal,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
