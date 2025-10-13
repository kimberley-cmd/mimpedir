import 'package:flutter/material.dart';
import 'package:mimpedir/tipo.dart';

import 'banco/restaurante_DAO.dart';
import 'banco/tipo_DAO.dart';

class TelaCadRestaurante extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TelaCadRestauranteState();
  }
}

class TelaCadRestauranteState extends State<TelaCadRestaurante>{

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  String? culinariaSelecionada;
  List<Tipo> tiposCulinaria =[];
  int? tipoCulinaria;

  void initState(){
    super.initState();
    carregarTipos();
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
      appBar: AppBar(title: const Text("Cadastro de restaurante")),
      body: Padding(padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Informações do restaurante: "),
            SizedBox(height: 40),
            Text("Tipo de comida: "),

            DropdownButtonFormField<String>(
                value: culinariaSelecionada,
                items: tiposCulinaria.map((tipo){
                  return DropdownMenuItem<String>(
                    value: tipo.descricao,
                    child: Text("${tipo.descricao}")
                  );
                }).toList(),
                onChanged: (String? value){
                  setState(() {
                    culinariaSelecionada = value;
                    Tipo tipoSelecionado = tiposCulinaria.firstWhere(
                        (tipo) => tipo.descricao == value,
                    );
                    tipoCulinaria = tipoSelecionado.codigo;
                  });
                  }
                  ),

            TextFormField(
              decoration: const InputDecoration(hintText: 'Nome do restaurante'),
              validator: (String? value) {},
              controller: nomeController,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Latitude'),
              validator: (String? value) {},
              controller: latitudeController,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Longitude'),
              validator: (String? value) {},
              controller: longitudeController,
            ),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: ()async{
                  final sucesso = await RestauranteDAO.cadastrasRestaurante(
                      nomeController.text, latitudeController.text, longitudeController.text, tipoCulinaria);
                  String msg = 'Erro não cadastrado. Verifique seus dados.';
                  Color corFundo = Colors.red;

                  if(sucesso > 0){
                    msg = '"${nomeController.text}" cadastrado com sucesso! ID: $sucesso';
                    corFundo = Colors.green;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(msg),
                      backgroundColor: corFundo,
                      duration: Duration(seconds: 5),
                    )
                  );

                },
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.save),
                Text("Cadastrar")
              ],
            ))
          ],
      ),
      ),
    );
  }
}