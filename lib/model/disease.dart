import 'package:cloud_firestore/cloud_firestore.dart';

class Disease {
  final String idPenyakit;
  final String uid;
  final String dokter;
  final String namaPenyakit;
  final String deskripsiPenyakit;
  final String gejala;
  final String perawatan;
  final String obat;
  final tanggal;

  const Disease(
      {required this.uid,
      required this.idPenyakit,
      required this.dokter,
      required this.namaPenyakit,
      required this.deskripsiPenyakit,
      required this.gejala,
      required this.perawatan,
      required this.tanggal,
      required this.obat});

  Map<String, dynamic> toJson() => {
        'dokter': dokter,
        'uid': uid,
        'namaPenyakit': namaPenyakit,
        'deskripsiPenyakit': deskripsiPenyakit,
        'gejala': gejala,
        'perawatan': perawatan,
        'obat': obat,
        'idPenyakit': idPenyakit,
        'tanggal': tanggal,
      };

  static Disease fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Disease(
        idPenyakit: snapshot['idPenyakit'],
        tanggal: snapshot['tanggal'],
        dokter: snapshot['dokter'],
        uid: snapshot['uid'],
        namaPenyakit: snapshot['namaPenyakit'],
        deskripsiPenyakit: snapshot['deskripsiPenyakit'],
        gejala: snapshot['gejala'],
        perawatan: snapshot['perawatan'],
        obat: snapshot['obat']);
  }
}
