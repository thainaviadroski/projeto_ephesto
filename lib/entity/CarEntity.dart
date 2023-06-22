class CarEntity {
  int? id;
  int? idUser;
  String? marca;
  String? modelo;
  int? ano;
  String? placa;

  CarEntity();

  CarEntity.withData({
    required this.id,
    required this.idUser,
    this.marca,
    this.modelo,
    this.ano,
    this.placa,
  });

  factory CarEntity.fromMap(Map<String, dynamic> map) {
    return CarEntity.withData(
      id: map['id'],
      idUser: map['idUser'],
      marca: map['marca'],
      modelo: map['modelo'],
      ano: map['ano'],
      placa: map['placa'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idUser': idUser,
      'marca': marca,
      'modelo': modelo,
      'ano': ano,
      'placa': placa,
    };
  }

  @override
  String toString() {
    return 'CarEntity{id: $id, idUser: $idUser, marca: $marca, modelo: $modelo, ano: $ano, placa: $placa}';
  }
}
