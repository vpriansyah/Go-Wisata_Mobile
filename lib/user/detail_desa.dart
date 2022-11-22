import 'package:flutter/material.dart';
import 'package:desa_wisata/models/desa.dart';

class Detail_desa extends StatelessWidget {
  // DetailPage({Key? key, required Posts posts}) : super(key: key);

  final Posts posts;
  const Detail_desa({Key? key, required this.posts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Desa'),
      ),
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'id: ${posts.id}',
        ),
        Text('name: ${posts.name}'),
        const SizedBox(
          height: 20,
        ),
        const Text('deskripsi: '),
        Text(posts.deskripsi)
      ])),
    );
  }
}
