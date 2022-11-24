import 'package:desa_wisata/models/cart2.dart';
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

class DaftarPenginapanUser extends StatefulWidget {
  const DaftarPenginapanUser({Key? key}) : super(key: key);

  @override
  State<DaftarPenginapanUser> createState() => _DaftarPenginapanUserState();
}

class _DaftarPenginapanUserState extends State<DaftarPenginapanUser> {
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
          'Daftar Penginapan',
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: FutureBuilder(
          future: getWisata(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print('snapshot:' + snapshot.data.length.toString());
              return ListView.builder(
                itemBuilder: (context, index) {
                  // final List place = fetch();
                  return InkWell(
                    onTap: () {
                      var get = fetch();
                      get.then((value) {
                        final snackBar = SnackBar(
                          content: Text(
                              snapshot.data[index]['name'] + ' added to cart'),
                        );
                        setState(() {
                          Cart c1 = Cart(
                            id: snapshot.data[index]['id'],
                            idtempat: snapshot.data[index]['id'],
                            nama: snapshot.data[index]['nama'],
                            kategori: 'penginapan',
                            qty: 1,
                            foto: snapshot.data[index]['foto'],
                          );
                          cartList.add(c1);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
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
                                      snapshot.data[index]['foto'],
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
                                    snapshot.data[index]['nama'],
                                    style: title3.copyWith(
                                      color: Color(0xFF101213),
                                    ),
                                  ),
                                  AutoSizeText(
                                    snapshot.data[index]['deskripsi'],
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.normal,
                                    ),
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
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 100,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: bodyText1.copyWith(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Rp. " + getTotal().toString(),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    // Add your onPressed code here!
                    Navigator.pushNamed(context, '/checkout');
                  },
                  label: Text('Cart'),
                  backgroundColor: Colors.blue,
                  icon: const Icon(Icons.shopping_cart),
                  // child: const Icon(Icons.shopping_cart),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final String baseUrl = 'http://go-wisata.id/';

  final String apiUrl =
      'http://go-wisata.id/api/hotel';

  final String api2url = 'http://go-wisata.id/api/villa';

  Future<List<Map<String, dynamic>>?> fetch() async {
    http.Response response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode != 200) return null;
    return List<Map<String, dynamic>>.from(json.decode(response.body)['data']);
  }

  Future getWisata() async {
    var response = await http.get(Uri.parse(apiUrl));
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future<List<Map<String, dynamic>>?> fetch2() async {
    http.Response response = await http.get(Uri.parse(api2url));
    if (response.statusCode != 200) return null;
    return List<Map<String, dynamic>>.from(json.decode(response.body)['data']);
  }

  Future getWisata2() async {
    var response = await http.get(Uri.parse(api2url));
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

}
