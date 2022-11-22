class Posts {
  int id;
  String name;
  String deskripsi;

  Posts({required this.id, required this.name, required this.deskripsi});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
        id: json['id'], name: json['name'], deskripsi: json['deskripsi']);
  }
}
