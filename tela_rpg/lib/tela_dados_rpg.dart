import 'package:flutter/material.dart';
import 'tela_rpg.dart';


class TelaDadosRpg extends StatefulWidget{
  @override
  _TelaDadosRpgState createState() => _TelaDadosRpgState();
}
class _TelaDadosRpgState extends State<TelaDadosRpg> {

  final _nomeCtrl = TextEditingController();
  final _classeCtrl = TextEditingController();
  final _nivelCtrl = TextEditingController();
  final _forcaCtrl = TextEditingController();
  final _destrezaCtrl = TextEditingController();
  final _constituicaoCtrl = TextEditingController();

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Criar Personagem'),
        backgroundColor: Colors.deepPurple[800],
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              _criarCampoTexto('Nome', _nomeCtrl),
              _criarCampoTexto('Classe', _classeCtrl),
              _criarCampoTexto('Nível', _nivelCtrl, isNumero: true),
              _criarCampoTexto('Força', _forcaCtrl, isNumero: true),
              _criarCampoTexto('Destreza', _destrezaCtrl, isNumero: true),
              _criarCampoTexto('Constituição', _constituicaoCtrl, isNumero: true),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent[700],
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  final novoPersonagem = Personagem(
                    nome: _nomeCtrl.text,
                    classe: _classeCtrl.text,
                    nivel: int.tryParse(_nivelCtrl.text) ?? 1, 
                    forca: _forcaCtrl.text,
                    destreza: _destrezaCtrl.text,
                    constituicao: _constituicaoCtrl.text,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaRpg(personagem: novoPersonagem),
                    ),
                  );
                },
                child: const Text('Gerar Ficha', style: TextStyle(fontSize: 20, color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _criarCampoTexto(String titulo, TextEditingController controlador, {bool isNumero = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        controller: controlador,
        keyboardType: isNumero ? TextInputType.number : TextInputType.text,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: titulo,
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent),
          ),
        ),
      ),
    );
  }
}