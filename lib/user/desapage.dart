import 'package:flutter/material.dart';
import 'package:desa_wisata/models/post.dart';

class DesaPage extends StatelessWidget {
  // DetailPage({Key? key, required Posts posts}) : super(key: key);

  final Posts posts;
  const DesaPage({Key? key, required this.posts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desa Page'),
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
