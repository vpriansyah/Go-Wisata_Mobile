import 'package:desa_wisata/user/menu%20pilihan/event/daftar_event_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaketDesa extends StatefulWidget {
   PaketDesa({Key? key}) : super(key: key);

  @override
  State<PaketDesa> createState() => _PaketDesaState();
}

class _PaketDesaState extends State<PaketDesa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Paket Desa"),
        actions: [],
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0,2),
                    )]
                ),
                child: ListTile(
                  title: Text("Wisata"),
                  subtitle: Text("Temukan paket wahana menarik disini"),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0,2),
                    )]
                ),
                child: ListTile(
                  title: Text("Event"),
                  subtitle: Text("Temukan event menarik disini"),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0,2),
                    )]
                ),
                child: ListTile(
                  title: Text("Kuliner"),
                  subtitle: Text("Temukan paket kuliner menarik disini"),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0,2),
                    )]
                ),
                child: ListTile(
                  title: Text("Penginapan"),
                  subtitle: Text("Temukan penginapan ternyaman"),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}
