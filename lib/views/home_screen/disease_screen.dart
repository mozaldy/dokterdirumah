import 'package:intl/intl.dart';
import 'package:dokter_dirumah/model/disease.dart';
import 'package:dokter_dirumah/controllers/disease.dart';
import 'package:dokter_dirumah/widgets/static.dart';
import 'package:dokter_dirumah/model/user.dart' as model;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DiseaseScreen extends StatefulWidget {
  const DiseaseScreen({super.key, required this.user, required this.disease});

  final model.User user;
  final Disease disease;

  @override
  State<DiseaseScreen> createState() => _DiseaseScreenState();
}

class _DiseaseScreenState extends State<DiseaseScreen> {
  void deleteDisease(String idPenyakit) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    _firestore.collection('diseases').doc(idPenyakit).delete();
  }

  @override
  Widget build(BuildContext context) {
    model.User user = widget.user;
    Disease disease = widget.disease;
    DateTime dateTime = disease.tanggal.toDate();

    String date = DateFormat('yyyy-MM-dd').format(dateTime);
    String hourMinute = DateFormat('HH:mm').format(dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text(disease.namaPenyakit),
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Deskripsi:'),
              Text(disease.deskripsiPenyakit),
              const Text('Gejala:'),
              Text(disease.gejala),
              const Text('Obat:'),
              Text(disease.obat),
              const Text('Perawatan:'),
              Text(disease.perawatan),
              Text('Dibuat oleh: ${disease.dokter} at $date pukul $hourMinute'),

              if (disease.dokter == user.username)
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      DiseaseController controller = DiseaseController();
                      controller.deleteDisease(disease.idPenyakit);
                      showSnackBar(context, 'Data berhasil dihapus');
                    },
                    child: const Text('Delete'))
            ]),
      ),
    );
  }
}
