class Tipo {
  int? _codigo;
  String? _descricao;

  //Getters
  int? get codigo => _codigo;
  String? get descricao => _descricao;

  //Setters
  set codigo(int? valor) => _codigo = valor;
  set descricao(String? valor) => _descricao = valor;

  //Construtor
  Tipo({int? codigo, String? descricao}) {
    _codigo = codigo;
    _descricao = descricao;
  }
}