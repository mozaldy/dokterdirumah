import 'package:cloud_firestore/cloud_firestore.dart';

class Disease {
  final String idPenyakit;
  final String uid;
  final String username;
  final String namaPenyakit;
  final String deskripsiPenyakit;
  final String gejala;
  final String perawatan;
  final String obat;
  final DateTime tanggal;

  const Disease(
      {required this.uid,
      required this.idPenyakit,
      required this.username,
      required this.namaPenyakit,
      required this.deskripsiPenyakit,
      required this.gejala,
      required this.perawatan,
      required this.tanggal,
      required this.obat});

  Map<String, dynamic> toJson() => {
        'dokter': username,
        'uid': uid,
        'nama_penyakit': namaPenyakit,
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
        username: snapshot['username'],
        uid: snapshot['uid'],
        namaPenyakit: snapshot['namaPenyakit'],
        deskripsiPenyakit: snapshot['deskripsiPenyakit'],
        gejala: snapshot['gejala'],
        perawatan: snapshot['perawatan'],
        obat: snapshot['obat']);
  }
}
