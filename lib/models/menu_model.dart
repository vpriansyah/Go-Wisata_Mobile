// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

List<MenuModel> menuModelFromJson(String str) => List<MenuModel>.from(json.decode(str).map((x) => MenuModel.fromJson(x)));

String menuModelToJson(List<MenuModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuModel {
  MenuModel({
   required this.id,
   required this.tempatId,
   required this.nama,
   required this.image,
   required this.harga,
    this.deskripsi,
    this.status,
    this.kodeKuliner,
    this.kategori,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int tempatId;
  String nama;
  String image;
  int harga;
  String? deskripsi;
  int? status;
  String? kodeKuliner;
  String? kategori;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
    id: json["id"] == null ? null : json["id"],
    tempatId: json["tempat_id"] == null ? null : json["tempat_id"],
    nama: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    harga: json["harga"] == null ? null : json["harga"],
    deskripsi: json["deskripsi"] == null ? null : json["deskripsi"],
    status: json["status"] == null ? null : json["status"],
    kodeKuliner: json["kode_kuliner"] == null ? null : json["kode_kuliner"],
    kategori: json["kategori"] == null ? null : json["kategori"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "tempat_id": tempatId == null ? null : tempatId,
    "name": nama == null ? null : nama,
    "image": image == null ? null : image,
    "harga": harga == null ? null : harga,
    "deskripsi": deskripsi == null ? null : deskripsi,
    "status": status == null ? null : status,
    "kode_kuliner": kodeKuliner == null ? null : kodeKuliner,
    "kategori": kategori == null ? null : kategori,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
