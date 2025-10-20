import 'package:flutter/material.dart';
import 'package:mimpedir/tela_home.dart';
import 'package:mimpedir/tipo.dart';

import 'banco/restaurante_DAO.dart';
import 'banco/tipo_DAO.dart';

class TelaEditarRestaurante extends StatefulWidget {
  static Restaurante restaurante = Restaurante();

  @override
  State<StatefulWidget> createState() {
    return TelaEditarRestauranteState();
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
  int? codigo = TelaEditarRestaurante.restaurante.codigo as int;

  void initState(){
    super.initState();
    carregarTipos();
    cdController.text = TelaEditarRestaurante().restaurante.codigo.toString()!;
    nomeController.text = TelaEditarRestaurante().restaurante.nome!;
    latitudeController.text = TelaEditarRestaurante().restaurante.latitude;
    longitudeController.text = TelaEditarRestaurante().restaurante.longitude;
    tiposCulinaria = TelaEditarRestaurante.restaurante.culinaria?.codigo!;
    culinariaSelecionada = TelaEditarRestaurante.restaurante?.descricao!;
  }

  Future<void> carregarTipos() async{
    final lista = await TipoDAO.listarTipos();
    setState(() {
      tiposCulinaria = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Atualizar Restaurante")),
      body: Padding(padding: const EdgeInsets.all (30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Informações do Restaurante: "),
            SizedBox(height: 40),
            Text('CÓDIGO'),
            TextFormField(
              decoration: InputDecoration(hintText: 'CÓDIGO'),
              validator: (String? value){},
              controller: cdController,
              enabled: false,
            ),
          Text("Tipo de comida: "),
          DropdownButtonFormField<String>(
              value: culinariaSelecionada,
              items: tiposCulinaria.map((tipo){
                return DropdownMenuItem<String>(
                value: tipo.descricao,
                child: Text("${tipo.descricao}")
                );
              }).toList(),
              OnChanged:(String? value){}
    )
          ],
        ),
     ),
  };
}

