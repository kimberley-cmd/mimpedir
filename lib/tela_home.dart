import 'package:flutter/material.dart';
import 'package:mimpedir/usuario.dart';

class TelaHome extends StatelessWidget{
  TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tela Home')),
        body: Center(
          child: Text('Seja bem vindo ao Mim Pedir!!!')
        ),
    );
  }
}