import 'package:flutter/material.dart';
import 'tela_dados_rpg.dart';

void main() {
  runApp(MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Construtor de RPG',
      home: TelaDadosRpg(),
    );
  }
}