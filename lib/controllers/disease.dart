import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../model/user.dart' as model;
import '../model/disease.dart';

class DiseaseController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addDisease(
      {required String namaPenyakit,
      required String deskripsi,
      required String gejala,
      required String perawatan,
      required String obat,
      required model.User user}) async {
    String newId = const Uuid().v1();
    Disease disease = Disease(
        uid: user.uid,
        idPenyakit: newId,
        dokter: user.username,
        namaPenyakit: namaPenyakit,
        deskripsiPenyakit: deskripsi,
        gejala: gejala,
        perawatan: perawatan,
        tanggal: DateTime.now(),
        obat: obat);
    String res = "Error";
    if (user.dokter &&
        namaPenyakit.isNotEmpty &&
        deskripsi.isNotEmpty &&
        gejala.isNotEmpty &&
        perawatan.isNotEmpty &&
        obat.isNotEmpty) {
      _firestore
          .collection('diseases')
          .doc(disease.idPenyakit)
          .set(disease.toJson());
      res = 'Success';
    } else {
      res = 'Error, Input ada yang kosong!';
    }
    return res;
  }

  void deleteDisease(idPenyakit) {
    _firestore.collection('diseases').doc(idPenyakit).delete();
  }
}
