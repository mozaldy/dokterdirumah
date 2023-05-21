class User {
  final String uid;
  final String email;
  final String username;
  final bool dokter;

  const User({
    required this.uid,
    required this.email,
    required this.username,
    required this.dokter,
  });

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'username': username,
    'dokter': dokter
  };
}
