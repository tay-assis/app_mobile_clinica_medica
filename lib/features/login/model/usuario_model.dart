class UserLogin {
  final String email;
  final String senha;

  UserLogin({required this.email, required this.senha});

  Map<String, dynamic> toMap() {
    return {'email': email, 'senha': senha};
  }

  factory UserLogin.fromMap(Map<String, dynamic> map) {
    return UserLogin(email: map['email'], senha: map['senha']);
  }
}
