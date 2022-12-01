class Cart {
  int id;
  int idtempat;
  String nama;
  int qty;
  String kategori;
  String foto;
  String lokasi;

  Cart({
    required this.id,
    required this.idtempat,
    required this.nama,
    required this.qty,
    required this.kategori,
    required this.foto,
    required this.lokasi,
  });
}

class CartEvent{
  int id;
  String nama;
  int qty;
  int harga;
  String foto;
  String kategori;
  String lokasi;

  CartEvent({
    required this.id,
    required this.nama,
    required this.qty,
    required this.harga,
    required this.foto,
    required this.lokasi,
    required this.kategori,
  });

}

var cartList = [
  // Cart(
  //     id: 1,
  //     nama: 'wahana kapal',
  //     qty: 1,
  //     harga: 0,
  //     kategori: 'wahana',
  //     image: 'zTCijV8Ma0ztU5pyyS3vnANFy6SsTVhV4LjMKjpu.jpg'),
];

