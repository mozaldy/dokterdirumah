import './user.dart';

class Disease {
  final User user;
  final String namaPenyakit;
  final String deskripsiPenyakit;
  final String gejala;
  final String perawatan;
  final String obat;

  const Disease(
      {required this.user,
      required this.namaPenyakit,
      required this.deskripsiPenyakit,
      required this.gejala,
      required this.perawatan,
      required this.obat});

  Map<String, dynamic> toJson() => {
    'dokter': user.username,
    'email': user.email,
    'nama_penyakit': namaPenyakit,
    'deskripsiPenyakit' : deskripsiPenyakit,
    'gejala' : gejala,
    'perawatan' : perawatan,
    'obat' : obat
  };
}
