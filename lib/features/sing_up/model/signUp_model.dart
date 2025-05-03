class SignupModel {
  final String email;
  final String senha;

  SignupModel({required this.email, required this.senha});

  // PARTE DO BACK END?? OS DADOS PODEM SER OBTIDOS PARA O BACK AQUI
  Map<String, dynamic> toMap() {
    return {'email': email, 'senha': senha};
  }

  factory SignupModel.fromMap(Map<String, dynamic> map) {
    return SignupModel(email: map['email'], senha: map['senha']);
  }
}