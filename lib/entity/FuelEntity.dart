class FuelEntity {
  int? id;
  double? valorLitro;
  double? valorTotalGasto;
  String? placa;

  FuelEntity();

  FuelEntity.withData({
    required this.id,
    required this.valorLitro,
    required this.valorTotalGasto,
    required this.placa,
  });

  factory FuelEntity.fromMap(Map<String, dynamic> map) {
    return FuelEntity.withData(
      id: map['id'],
      valorLitro: map['valorLitro'],
      valorTotalGasto: map['valorTotalGasto'],
      placa: map['placa'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'valorLitro': valorLitro,
      'valorTotalGasto': valorTotalGasto,
      'placa': placa,
    };
  }

  @override
  String toString() {
    return 'FuelEntity{id: $id, valorLitro: $valorLitro, valorTotalGasto: $valorTotalGasto, placa: $placa}';
  }
}
