class UserEntity {
  int? id;
  String? nomeCompleto;
  String? email;
  String? senha;

  UserEntity();


  UserEntity.withData({
    required this.id,
    this.nomeCompleto,
    required this.email,
    required this.senha,
  });

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity.withData(
      id: map['id'],
      nomeCompleto: map['nomeCompleto'],
      email: map['email'],
      senha: map['senha'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomeCompleto': nomeCompleto,
      'email': email,
      'senha': senha,
    };
  }

  @override
  String toString() {
    return 'UserEntity{id: $id, nomeCompleto: $nomeCompleto, email: $email, senha: $senha}';
  }
}
