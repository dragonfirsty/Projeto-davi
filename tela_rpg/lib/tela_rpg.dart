import 'package:flutter/material.dart';
import 'dart:math';

class Personagem {
  final String nome;
  final String classe;
  final int nivel;
  final String forca;
  final String destreza;
  final String constituicao;

  Personagem({
    required this.nome,
    required this.classe,
    required this.nivel,
    required this.forca,
    required this.destreza,
    required this.constituicao,
  });
}

class TelaRpg extends StatelessWidget {

  final Personagem personagem;

  const TelaRpg({Key? key, required this.personagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Ficha de Personagem'),
        backgroundColor: Colors.deepPurple[800],
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _construirCabecalho(),
                _construirAtributos(),
                _construirBotao(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _construirCabecalho() {
    return Column(
      children: [
        Text(
          personagem.nome,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          '${personagem.classe} - Nível ${personagem.nivel}', // Interpolação de string
          style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _construirAtributos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _criarCaixaAtributo('FOR', personagem.forca),
        _criarCaixaAtributo('DES', personagem.destreza),
        _criarCaixaAtributo('CON', personagem.constituicao),
      ],
    );
  }

  Widget _criarCaixaAtributo(String nome, String valor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(nome, style: const TextStyle(color: Colors.white70, fontSize: 16)),
          Text(valor, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _construirBotao(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: () {
        int d20 = Random().nextInt(20) + 1; 
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${personagem.nome} rolou iniciativa: $d20',
              style: const TextStyle(fontSize: 16),
            ),
            backgroundColor: Colors.deepPurple,
            duration: const Duration(seconds: 3), // Some depois de 3 segundos
          ),
        );
      },
      child: const Text('Rolar Iniciativa', style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}