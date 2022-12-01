// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

List<EventModel> eventModelFromJson(String str) => List<EventModel>.from(json.decode(str).map((x) => EventModel.fromJson(x)));

String eventModelToJson(List<EventModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventModel {
  EventModel({
    this.id,
    this.kodeEvent,
    required this.nama,
    this.deskripsi,
    required this.lokasi,
    this.waktuMulai,
    this.waktuSelesai,
    this.tglBuka,
    this.tglTutup,
    required this.harga,
    required this.foto,
    this.linkVideo,
    this.kapasitasAwal,
    this.kapasitasAkhir,
    this.status,
    this.kategorieventId,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  int? id;
  String? kodeEvent;
  String nama;
  String? deskripsi;
  String lokasi;
  String? waktuMulai;
  String? waktuSelesai;
  String? tglBuka;
  String? tglTutup;
  int harga;
  String foto;
  String? linkVideo;
  int? kapasitasAwal;
  int? kapasitasAkhir;
  int? status;
  int? kategorieventId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    id: json["id"] == null ? null : json["id"],
    kodeEvent: json["kode_event"] == null ? null : json["kode_event"],
    nama: json["nama"] == null ? null : json["nama"],
    deskripsi: json["deskripsi"] == null ? null : json["deskripsi"],
    lokasi: json["lokasi"] == null ? null : json["lokasi"],
    waktuMulai: json["waktu_mulai"] == null ? null : json["waktu_mulai"],
    waktuSelesai: json["waktu_selesai"] == null ? null : json["waktu_selesai"],
    tglBuka: json["tgl_buka"] == null ? null : json["tgl_buka"],
    tglTutup: json["tgl_tutup"] == null ? null : json["tgl_tutup"],
    harga: json["harga"] == null ? null : json["harga"],
    foto: json["foto"] == null ? null : json["foto"],
    linkVideo: json["link_video"] == null ? null : json["link_video"],
    kapasitasAwal: json["kapasitas_awal"] == null ? null : json["kapasitas_awal"],
    kapasitasAkhir: json["kapasitas_akhir"] == null ? null : json["kapasitas_akhir"],
    status: json["status"] == null ? null : json["status"],
    kategorieventId: json["kategorievent_id"] == null ? null : json["kategorievent_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    userId: json["user_id"] == null ? null : json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "kode_event": kodeEvent == null ? null : kodeEvent,
    "nama": nama == null ? null : nama,
    "deskripsi": deskripsi == null ? null : deskripsi,
    "lokasi": lokasi == null ? null : lokasi,
    "waktu_mulai": waktuMulai == null ? null : waktuMulai,
    "waktu_selesai": waktuSelesai == null ? null : waktuSelesai,
    "tgl_buka": tglBuka == null ? null : tglBuka,
    "tgl_tutup": tglTutup == null ? null : tglTutup,
    "harga": harga == null ? null : harga,
    "foto": foto == null ? null : foto,
    "link_video": linkVideo == null ? null : linkVideo,
    "kapasitas_awal": kapasitasAwal == null ? null : kapasitasAwal,
    "kapasitas_akhir": kapasitasAkhir == null ? null : kapasitasAkhir,
    "status": status == null ? null : status,
    "kategorievent_id": kategorieventId == null ? null : kategorieventId,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "user_id": userId == null ? null : userId,
  };
}
