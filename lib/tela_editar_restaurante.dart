import 'package:flutter/material.dart';
import 'package:mimpedir/tela_home.dart';
import 'package:mimpedir/tipo.dart';

import 'banco/restaurante_DAO.dart';
import 'banco/tipo_DAO.dart';

class TelaEditarRestaurante extends StatefulWidget {
  static Restaurante restaurante = Restaurante();

  @override
  State<StatefulWidget> createState() {
    return TelaEditarRestaurante();
  }
}

class TelaEditarRestauranteState extends State<TelaEditarRestaurante>{

  final TextEditingController cdController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  String? culinariaSelecionada;
  List<Tipo>tiposCulinaria = [];
  int? tipoCulinaria;

  void initState(){
    super.initState();
    carregarTipos();
    cdController.text = TelaEditarRestaurante().restaurante.codigo.toString()!;
    nomeController.text = TelaEditarRestaurante().restaurante.nome!;
    latitudeController.text = TelaEditarRestaurante().restaurante.latitude.toString()!;
    longitudeController.text = TelaEditarRestaurante().restaurante.longitude.toString()!;
  }

  Future<void> carregarTipos() async{
    final lista = await TipoDAO.listarTipos();
    setState(() {
      tiposCulinaria = lista;
    });
  }
}

