import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dokter_dirumah/widgets/cards.dart';
import 'package:dokter_dirumah/model/user.dart' as model;
import 'package:dokter_dirumah/model/disease.dart';
import 'package:dokter_dirumah/providers/user_provider.dart';
import 'package:dokter_dirumah/widgets/static.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;
  late Stream<QuerySnapshot<Map<String, dynamic>>> _diseasesStream;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _diseasesStream = FirebaseFirestore.instance.collection('diseases').snapshots();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          style: const TextStyle(color: backgroundColor),
          decoration: const InputDecoration(
            hintText: 'Search Penyakit',
            hintStyle: TextStyle(color: backgroundColor),
            fillColor: backgroundColor
            
          ),
          onChanged: (value) {
            setState(() {
              _diseasesStream = FirebaseFirestore.instance
                  .collection('diseases')
                  .where('namaPenyakit', isGreaterThanOrEqualTo: value)
                  .snapshots();
            });
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _diseasesStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Disease disease = Disease.fromSnap(snapshot.data!.docs[index]);
              return DiseaseCard(
                disease: disease,
                user: user,
              );
            },
          );
        },
      ),
    );
  }
}
