import 'package:flutter/material.dart';
import 'package:dokter_dirumah/views/home_screen/disease_screen.dart';
import 'static.dart';
import 'package:dokter_dirumah/model/user.dart' as model;
import 'package:dokter_dirumah/model/disease.dart';

class HelloCard extends StatelessWidget {
  final model.User user;
  const HelloCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.99,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
          color: Colors.red,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat datang,',
              textScaleFactor: 2,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              user.dokter
                  ? 'Dokter ${user.username.toUpperCase()}'
                  : user.username.toUpperCase(),
              textScaleFactor: 1.5,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            )
          ],
        ),
      ),
    );
  }
}

class DiseaseCard extends StatefulWidget {
  final Disease disease;
  final model.User user;
  const DiseaseCard({super.key, required this.disease, required this.user});

  @override
  State<DiseaseCard> createState() => _DiseaseCardState();
}

class _DiseaseCardState extends State<DiseaseCard> {
  @override
  Widget build(BuildContext context) {
    model.User user = widget.user;
    Disease disease = widget.disease;
    return FractionallySizedBox(
      widthFactor: 0.99,
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
          border: Border.all(color: primaryColor, width: 5),
          color: backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  disease.namaPenyakit,
                  textScaleFactor: (disease.namaPenyakit.length < 13) ? 3 : 2,
                  style: const TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiseaseScreen(
                                  user: user,
                                  disease: disease,
                                )));
                  },
                  child: const Icon(
                    Icons.arrow_right,
                    color: primaryColor,
                    size: 50,
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "By: Dokter ${disease.dokter}",
                  textScaleFactor: 1,
                  style: const TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
