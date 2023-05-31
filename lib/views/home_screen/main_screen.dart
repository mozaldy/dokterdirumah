import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dokter_dirumah/widgets/cards.dart';
import 'package:dokter_dirumah/model/user.dart' as model;
import 'package:dokter_dirumah/model/disease.dart';
import 'package:dokter_dirumah/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('diseases').snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data!.docs.length + 1,
            itemBuilder: ((context, index) {
              if (index == 0) {
                return HelloCard(user: user);
              }
              Disease disease = Disease.fromSnap(snapshot.data!.docs[index - 1]);
              return DiseaseCard(
                // data: snapshot.data!.docs[index - 1].data(),
                disease: disease,
                user: user,
              );
            }));
      },
    ));
  }
}
