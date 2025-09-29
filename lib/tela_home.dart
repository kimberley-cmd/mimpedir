import 'package:flutter/material.dart';
import 'package:mimpedir/tela_cad_restaurante.dart';
import 'package:mimpedir/usuario.dart';

class TelaHome extends StatelessWidget {
  TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tela Home')),
        body: Padding(padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Lista de Restaurantes"),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
                }, child: Text("Cadastrar Restaurantes")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Column(
                      children: [
                        Text("Meu Restaurante"),
                        Text("Comida Mexicana")
                      ],
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(onPressed: () {}, child: Text("Excluir")),
                    SizedBox(width: 10),
                    ElevatedButton(onPressed: () {}, child: Text("Editar")),
                  ],
                ),
              ],
            )
        )
    );
  }
}