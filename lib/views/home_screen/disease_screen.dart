import 'package:intl/intl.dart';
import 'package:dokter_dirumah/model/disease.dart';
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
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('diseases').doc(idPenyakit).delete();
  }

  @override
  Widget build(BuildContext context) {
    model.User user = widget.user;
    Disease disease = widget.disease;
    DateTime dateTime = disease.tanggal.toDate();

    String date = DateFormat('yyyy-MM-dd').format(dateTime);
    String hourMinute = DateFormat('HH:mm').format(dateTime);

    double layar = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(disease.namaPenyakit),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: layar * 0.9),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DiseaseKey(text: 'Deskripsi:'),
                  DiseaseValue(text: disease.deskripsiPenyakit),
                  const DiseaseKey(text: 'Gejala:'),
                  DiseaseValue(text: disease.gejala),
                  const DiseaseKey(text: 'Obat:'),
                  DiseaseValue(text: disease.obat),
                  const DiseaseKey(text: 'Perawatan:'),
                  DiseaseValue(text: disease.perawatan),
                  Text(
                      'Dibuat oleh: ${disease.dokter} at $date pukul $hourMinute'),
                  if (disease.dokter == user.username)
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          deleteDisease(disease.idPenyakit);
                          showSnackBar(context, 'Data berhasil dihapus');
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.red)))),
                        child: const Text('Delete')),
                ]),
          ),
        ),
      ),
    );
  }
}

class DiseaseKey extends StatelessWidget {
  const DiseaseKey({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class DiseaseValue extends StatelessWidget {
  const DiseaseValue({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(

  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
    side: const BorderSide(color: primaryColor),
  ),
  color: backgroundColor,
  child: Padding(
    padding: const EdgeInsets.all(10),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        letterSpacing: 1,
        wordSpacing: 2,
        color: primaryColor,
      ),
      textAlign: TextAlign.center,
    ),
  ),
);

  }
}
