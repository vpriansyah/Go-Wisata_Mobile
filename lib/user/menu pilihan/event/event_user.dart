import 'package:desa_wisata/models/cart2.dart';
import 'package:desa_wisata/models/event_model.dart';
import 'package:desa_wisata/theme.dart';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../checkout.dart';

class Daftar_EventUser extends StatefulWidget {
  const Daftar_EventUser({
    Key? key,
    required this.idEvent,
    required this.indexEvent,
  }) : super(key: key);

  final String idEvent;
  final int indexEvent;

  @override
  State<Daftar_EventUser> createState() => _Daftar_EventUserState();
}

class _Daftar_EventUserState extends State<Daftar_EventUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: FutureBuilder<List<EventModel>>(
          future: getEvent(widget.idEvent),
          builder: (context, AsyncSnapshot<List<EventModel>> snapshot) {
            if (snapshot.hasData) {
              // print('snapshot:' + snapshot.data.length.toString());
              print(snapshot.data!.first.nama);
              try {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    // final List place = fetch();
                    return InkWell(
                      onTap: () {
                        var get = fetch();
                        get.then((value) {});
                        final snackBar = SnackBar(
                          content: Text(
                              snapshot.data![index].nama + ' added to cart'),
                        );
                        setState(() {
                          CartEvent c1 = CartEvent(
                              id: snapshot.data![index].id ?? 0,
                              nama: snapshot.data![index].nama,
                              kategori: 'event',
                              lokasi: snapshot.data![index].lokasi ?? "null",
                              qty: 1,
                              // harga: int.parse(snapshot.data![index].harga ),
                              harga: snapshot.data![index].harga ?? 0,
                              foto: snapshot.data![index].foto);
                          cartList.add(c1);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      },
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(38), // Image radius
                                  child: Image.network(
                                    baseUrl +
                                        'images/' +
                                        snapshot.data![index].foto,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      snapshot.data![index].nama,
                                      style: title3.copyWith(
                                        color: Color(0xFF101213),
                                      ),
                                    ),
                                    AutoSizeText(
                                      snapshot.data![index].lokasi,
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 3),
                                      child: Text(
                                        'Rp ${snapshot.data![index].harga}',
                                        style: GoogleFonts.montserrat(
                                          color: Colors.red,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 3),
                                      // child: Text(
                                      //   'per porsi',
                                      //   // snapshot.data[index]['deskripsi_harga'],
                                      //   style: GoogleFonts.montserrat(
                                      //     color: Colors.red,
                                      //     fontSize: 16,
                                      //   ),
                                      // ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        elevation: 3,
                        margin: EdgeInsets.all(10),
                      ),
                    );

                    ///---
                  },
                  itemCount: snapshot.data!.length,
                );
              } catch (e) {
                return Text(e.toString());
              }
              // This trailing comma makes auto-formatting nicer for build methods.

            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // return Text('Data Error');
          }),
      //
    );
  }

  final String baseUrl = 'http://go-wisata.id/';

  final String apiUrl = 'http://go-wisata.id/api/listevent/';

  Future<List<Map<String, dynamic>>?> fetch() async {
    http.Response response = await http
        .get(Uri.parse("https://backend-dompetku.herokuapp.com/api/history"));
    if (response.statusCode != 200) return null;
    return List<Map<String, dynamic>>.from(json.decode(response.body)['data']);
  }

  Future<List<EventModel>> getEvent(String idTempat) async {
    try {
      String fullUrl = apiUrl + idTempat.toString();
      var response = await http.get(Uri.parse(fullUrl));
      if (response.statusCode != 200) return [];
      List<EventModel> result = eventModelFromJson(response.body);
      // return json.decode(response.body);
      return result;
    } catch (e) {
      return [];
    }
  }
}
