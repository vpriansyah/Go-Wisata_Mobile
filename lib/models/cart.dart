class Cart {
  int id;
  int idtempat;
  String nama;
  int qty;
  int harga;
  String kategori;
  String image;

  Cart({
    required this.id,
    required this.idtempat,
    required this.nama,
    required this.qty,
    required this.harga,
    required this.kategori,
    required this.image,
  });

}class CartKuliner {
  int id;
  int idtempat;
  String nama;
  int qty;
  int harga;
  String kategori;
  String image;
  String alamat;

  CartKuliner({
    required this.id,
    required this.idtempat,
    required this.nama,
    required this.qty,
    required this.harga,
    required this.kategori,
    required this.image,
    required this.alamat,
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

var cartListKuliner = [

];

