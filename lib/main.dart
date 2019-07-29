//imports de bibliotecas necessárias para o projeto
import 'package:flutter/material.dart';

//Método principal
void main() {
  //Metodos que executa a app
  runApp(new MaterialApp(
      //Titulo do App
      title: 'Contador de Visitantes',
      //Definiciçaõ do widget inicial
      home: new Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _contador = 0;
  String _info = "Pode Entrar";

  void _incrementar(){
    setState(() {
     _contador++; 
     if(_contador >= 10)
      _info = "Não pode Entrar";
    });
  }

   void _decrementar(){
    setState(() {
     _contador--; 
     if(_contador <= 10)
      _info = "Pode Entrar";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
        //Componete que permite empilhar widgets
        children: <Widget>[
          Image.asset(
            'imagens/fundo001.jpg',
            fit: BoxFit.cover
          ),
          Column(
            //Alinhamento vertifcal
            mainAxisAlignment: MainAxisAlignment.center,
            //Array de filhos, itens da colunas
            children: <Widget>[
              //Itens da coluna
              Text('Visitantes: $_contador',
                  //Formatação visual dos elementos
                  style: TextStyle(
                      //elemento de texto
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              //Widget de linha
              Row(
                //alinhamento princiapl
                mainAxisAlignment: MainAxisAlignment.center,
                //array de itens da linha
                children: <Widget>[
                  //Elemento que perimite definir espaçamentos interno
                  Padding(
                    //Tamanho do espaçamento
                    padding: EdgeInsets.all(10),
                    //item dentro do elemento
                    child: FlatButton(
                        child: Text('Entrar',
                            style:
                                TextStyle(fontSize: 40, color: Colors.white)),
                        onPressed: () { _incrementar(); }),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: FlatButton(
                        child: Text('Sair',
                            style:
                                TextStyle(fontSize: 40, color: Colors.white)),
                        onPressed: () { _decrementar();}),
                  )
                ],
              ),

              Text(_info,
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 30))
            ],
          )
        ],
      );
  }
}
