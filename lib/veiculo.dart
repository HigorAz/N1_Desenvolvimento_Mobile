class Veiculo{

  String? placa;
  String? apelido;

  Veiculo(this.placa, this.apelido);

  Map<String, dynamic> toMap(){
    return{
      'placa': placa,
      'apelido': apelido,
    };
  }
}