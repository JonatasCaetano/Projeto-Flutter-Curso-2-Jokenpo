import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp= AssetImage('imagens/padrao.png');

  var _mensagem= 'Escolha uma opção';

  void _opcaoSelecionada (String escolhaUsuario){

    var opcoes=['pedra', 'papel', 'tesoura'];
    var numero= Random().nextInt(3);
    var escolhaApp=opcoes[numero];
    switch(escolhaApp){
      case 'pedra':
        setState(() {
          _imagemApp= AssetImage('imagens/pedra.png');
        });
        break;

      case 'papel' :
        setState(() {
          _imagemApp= AssetImage('imagens/papel.png');
        });
        break;

      case 'tesoura' :
        setState(() {
          _imagemApp=AssetImage('imagens/tesoura.png');
        });
        break;}

    if(
    (escolhaUsuario=='pedra' && escolhaApp=='tesoura') ||
        (escolhaUsuario=='tesoura' && escolhaApp=='papel') ||
        (escolhaUsuario=='papel' && escolhaApp=='pedra')
    )
    {_mensagem='Você venceu';}
    else if(
    (escolhaApp=='pedra' && escolhaUsuario=='tesoura') ||
        (escolhaApp=='tesoura' && escolhaUsuario=='papel') ||
        (escolhaApp=='papel' && escolhaUsuario=='pedra')
    )
    {_mensagem='Você perdeu';}
    else{
      _mensagem='Empatou';
    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text('JokenPo'
        ),
      ) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Escolha do App:',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          Image(image: this._imagemApp, height: 100,),
          Text(_mensagem,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: ()=> _opcaoSelecionada ('pedra') ,
                child: Image.asset('imagens/pedra.png', height: 90,) ,
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada ('papel') ,
                child: Image.asset('imagens/papel.png', height: 90,) ,
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada ('tesoura') ,
                child: Image.asset('imagens/tesoura.png', height: 90,) ,
              )

              /*
              Image.asset('imagens/pedra.png', height: 90,),
              Image.asset('imagens/papel.png', height: 90,),
              Image.asset('imagens/tesoura.png', height: 90,)
              */
            ],
          )
        ],
      ) ,
    );
  }
}


