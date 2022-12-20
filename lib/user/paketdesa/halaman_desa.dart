import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaketDesa extends StatefulWidget {
   PaketDesa({Key? key}) : super(key: key);

  @override
  State<PaketDesa> createState() => _PaketDesaState();
}

List<String> paket= ["Wisata", "Event", "Penginapan", "Kuliner" ];
List<String> penjelasan= ["Temukan paket wahana menarik disini" ,
"Temukan event menarik disini", "Temukan paket kuliner menarik disini", "Temukan penginapan ternyaman"];

class _PaketDesaState extends State<PaketDesa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Paket Desa"),
        actions: [],
      ),
      body: Container(
        child: ListView.builder(itemCount: paket.length, itemBuilder: (context,index){
          return ListTile(
            title: Text(paket[index]),
            subtitle: Text(penjelasan[index]),
          );
        }),
      ),
    );
  }

}
