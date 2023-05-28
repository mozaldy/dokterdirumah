import 'package:dokter_dirumah/model/user.dart' as model;
import 'package:flutter/material.dart';
import 'package:dokter_dirumah/widgets/static.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:dokter_dirumah/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AddDisease extends StatefulWidget {
  const AddDisease({super.key});

  @override
  State<AddDisease> createState() => _AddDiseaseState();
}

class _AddDiseaseState extends State<AddDisease> {
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

  void navigationHandler() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    if (user.dokter){
      return Scaffold(
        body: Center(
          child: Text('Selamat datang dokter ${user.username}, tambahkan penyakit sekarang!'),
        ),
      );
    }
    else{
      return Scaffold(
        body: Center(
          child: Text('${user.username}, anda bukan dokter!'),
        ),
      );
    }
  }
}
