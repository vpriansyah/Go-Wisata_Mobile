import 'package:desa_wisata/models/cart.dart';
import 'package:desa_wisata/models/menu_model.dart';
import 'package:desa_wisata/theme.dart';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'checkout.dart';

class Daftar_KulinerUser extends StatefulWidget {
  const Daftar_KulinerUser({Key? key, required this.idMenu, required this.indexMenu}) : super(key: key);

  final String idMenu;
  final int indexMenu;

  @override
  State<Daftar_KulinerUser> createState() => _Daftar_KulinerUserState();
}

class _Daftar_KulinerUserState extends State<Daftar_KulinerUser> {
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
          'Daftar Kuliner',
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: FutureBuilder<List<MenuModel>>(
          future: getMenu(widget.idMenu),
          builder: (context, AsyncSnapshot<List<MenuModel>> snapshot) {
            if (snapshot.hasData) {
              // print('snapshot:' + snapshot.data.length.toString());
              print(snapshot.data!.first.nama);
              try{
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
                        CartKuliner c1 = CartKuliner(
                            id: snapshot.data![index].id ?? 0,
                            idtempat: snapshot.data![index].tempatId,
                            nama: snapshot.data![index].nama,
                            kategori: 'kuliner',
                            alamat: snapshot.data![index].deskripsi ?? "null",
                            qty: 1,
                            // harga: int.parse(snapshot.data![index].harga ),
                            harga: snapshot.data![index].harga ?? 0,
                            image: snapshot.data![index].image);
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
                                      snapshot.data![index].image,
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
                                  // AutoSizeText(
                                  //   snapshot.data[index]['alamat'],
                                  //   style: GoogleFonts.montserrat(
                                  //     fontWeight: FontWeight.normal,
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 3),
                                    child: Text(
                                      'Rp ${snapshot.data![index].harga}'
                                      ,
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
                  // final List place = fetch();
                  // return InkWell(
                  //   onTap: () {
                  //     var get = fetch();
                  //     get.then((value) {});
                  //     final snackBar = SnackBar(
                  //       content: Text(
                  //           snapshot.data[index]['name'] + ' added to cart'),
                  //     );
                  //     setState(() {
                  //       CartKuliner c1 = CartKuliner(
                  //           id: snapshot.data[index]['id'],
                  //           idtempat: snapshot.data[index]['id'],
                  //           nama: snapshot.data[index]['name'],
                  //           kategori: 'kuliner',
                  //           alamat: snapshot.data[index]['alamat'],
                  //           qty: 1,
                  //           harga: int.parse(snapshot.data[index]['htm']),
                  //           image: snapshot.data[index]['image']);
                  //       cartList.add(c1);
                  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //     });
                  //   },
                  //   child: Card(
                  //     child: Row(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: <Widget>[
                  //         Expanded(
                  //           flex: 1,
                  //           child: ClipRRect(
                  //             borderRadius: BorderRadius.circular(24),
                  //             child: SizedBox.fromSize(
                  //               size: Size.fromRadius(38), // Image radius
                  //               child: Image.network(
                  //                 baseUrl +
                  //                     'images/' +
                  //                     snapshot.data[index]['image'],
                  //                 fit: BoxFit.cover,
                  //                 loadingBuilder: (BuildContext context,
                  //                     Widget child,
                  //                     ImageChunkEvent? loadingProgress) {
                  //                   if (loadingProgress == null) return child;
                  //                   return Center(
                  //                     child: CircularProgressIndicator(
                  //                       value: loadingProgress
                  //                           .expectedTotalBytes !=
                  //                           null
                  //                           ? loadingProgress
                  //                           .cumulativeBytesLoaded /
                  //                           loadingProgress
                  //                               .expectedTotalBytes!
                  //                           : null,
                  //                     ),
                  //                   );
                  //                 },
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         Expanded(
                  //           flex: 3,
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               mainAxisSize: MainAxisSize.min,
                  //               children: <Widget>[
                  //                 Text(
                  //                   snapshot.data[index]['name'],
                  //                   style: title3.copyWith(
                  //                     color: Color(0xFF101213),
                  //                   ),
                  //                 ),
                  //                 AutoSizeText(
                  //                   snapshot.data[index]['alamat'],
                  //                   style: GoogleFonts.montserrat(
                  //                     fontWeight: FontWeight.normal,
                  //                   ),
                  //                 ),
                  //                 // Padding(
                  //                 //   padding: EdgeInsetsDirectional.fromSTEB(
                  //                 //       0, 0, 0, 3),
                  //                 //   child: Text(
                  //                 //     'Rp ' +
                  //                 //     snapshot.data[index]['harga'],
                  //                 //     style: GoogleFonts.montserrat(
                  //                 //       color: Colors.red,
                  //                 //       fontSize: 16,
                  //                 //     ),
                  //                 //   ),
                  //                 // ),
                  //                 Padding(
                  //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //                       0, 0, 0, 3),
                  //                   // child: Text(
                  //                   //   'per porsi',
                  //                   //   // snapshot.data[index]['deskripsi_harga'],
                  //                   //   style: GoogleFonts.montserrat(
                  //                   //     color: Colors.red,
                  //                   //     fontSize: 16,
                  //                   //   ),
                  //                   // ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     elevation: 3,
                  //     margin: EdgeInsets.all(10),
                  //   ),
                  // );
                },
                itemCount: snapshot.data!.length,
              );
              } catch(e){
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

  final String apiUrl = 'http://go-wisata.id/api/kuliner/';

  Future<List<Map<String, dynamic>>?> fetch() async {
    http.Response response = await http
        .get(Uri.parse("https://backend-dompetku.herokuapp.com/api/history"));
    if (response.statusCode != 200) return null;
    return List<Map<String, dynamic>>.from(json.decode(response.body)['data']);
  }

  Future<List<MenuModel>> getMenu(String idTempat) async {
    try{
      String fullUrl = apiUrl+idTempat.toString();
      var response = await http.get(Uri.parse(fullUrl));
      if (response.statusCode != 200) return [];
      List<MenuModel> result = menuModelFromJson(response.body);
      // return json.decode(response.body);
      return result;
    } catch (e) {
      return [];
    }

  }
}
