import 'package:mimpedir/restaurante.dart';
import 'package:mimpedir/tipo.dart';
import 'package:mimpedir/usuario.dart';


class Restaurante {
  int? _codigo;
  String? _nome;
  String? _latitude;
  String? _longitude;
  Usuario? _proprietario;
  Tipo? _culinaria;

  int? get codigo => _codigo;

  String? get nome => _nome;

  String? get latitude => _latitude;

  String? get longitude => _longitude;

  Usuario? get proprietario => _proprietario;

  Tipo? get culinaria => _culinaria;


  set codigo(int? valor) => _codigo = valor;

  set nome(String? valor) => _nome = valor;

  set latitude(String? valor) => _latitude = valor;

  set longitude(String? valor) => _longitude = valor;

  set proprietario(String? valor) => _proprietario = valor;

  set culinaria(String? valor) => _culinaria = valor;


  Restaurante({
    int? codigo,
    String? nome,
    String? latitude,
    String? longitude,
    Usuario? proprietario,
    Tipo? culinaria,
  }) {
    _codigo = codigo;
    _nome = nome;
    _latitude = latitude;
    _longitude = longitude;
    _proprietario = proprietario;
    _culinaria = culinaria;
  }
}
