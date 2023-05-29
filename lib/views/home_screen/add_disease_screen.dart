import 'package:dokter_dirumah/controlllers/disease.dart';
import 'package:dokter_dirumah/model/user.dart' as model;
import 'package:flutter/material.dart';
import 'package:dokter_dirumah/widgets/static.dart';
import 'package:dokter_dirumah/widgets/textinput.dart';
import 'package:dokter_dirumah/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AddDisease extends StatefulWidget {
  const AddDisease({super.key});

  @override
  State<AddDisease> createState() => _AddDiseaseState();
}

class _AddDiseaseState extends State<AddDisease> {
  final TextEditingController _namaPenyakitController = TextEditingController();
  final TextEditingController _deskripsiPenyakitController =
      TextEditingController();
  final TextEditingController _gejalaPenyakitController =
      TextEditingController();
  final TextEditingController _perawatanPenyakitController =
      TextEditingController();
  final TextEditingController _obatPenyakitController = TextEditingController();

  void tambahkanPenyakit(model.User user) async {
    DiseaseController controller = DiseaseController();
    String res = await controller.addDisease(
        namaPenyakit: _namaPenyakitController.text,
        deskripsi: _deskripsiPenyakitController.text,
        gejala: _gejalaPenyakitController.text,
        perawatan: _perawatanPenyakitController.text,
        obat: _obatPenyakitController.text,
        user: user);
    penyakitHandler(res);
    clearForm();
  }

  void clearForm() {
    _namaPenyakitController.clear();
    _deskripsiPenyakitController.clear();
    _gejalaPenyakitController.clear();
    _perawatanPenyakitController.clear();
    _obatPenyakitController.clear();
  }

  @override
  void dispose() {
    _perawatanPenyakitController.dispose();
    _deskripsiPenyakitController.dispose();
    _gejalaPenyakitController.dispose();
    _namaPenyakitController.dispose();
    _obatPenyakitController.dispose();
    super.dispose();
  }

  void penyakitHandler(res) {
    showSnackBar(context, res);
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    if (user.dokter) {
      return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AuthLogo(title: 'Tambahkan Penyakit'),
              TextInput(
                textEditingController: _namaPenyakitController,
                hintText: 'Nama Penyakit',
                textInputType: TextInputType.name,
              ),
              TextInput(
                textEditingController: _deskripsiPenyakitController,
                hintText: 'Deskripsi',
                textInputType: TextInputType.text,
              ),
              TextInput(
                textEditingController: _gejalaPenyakitController,
                hintText: 'Gejala',
                textInputType: TextInputType.multiline,
              ),
              TextInput(
                textEditingController: _perawatanPenyakitController,
                hintText: 'Perawatan',
                textInputType: TextInputType.multiline,
              ),
              TextInput(
                textEditingController: _obatPenyakitController,
                hintText: 'Obat',
                textInputType: TextInputType.multiline,
              ),
              CustomButtom(
                  buttonColor: primaryColor,
                  textColor: backgroundColor,
                  text: 'Tambahkan Penyakit',
                  onPress: () {
                    tambahkanPenyakit(user);
                  }),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Text('${user.username}, anda bukan dokter!'),
        ),
      );
    }
  }
}
