import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class Rico extends StatefulWidget {
  @override
  _RicoState createState() => _RicoState();
}
//classe interna do tipo State, que recebe a Classe Rico

class _RicoState extends State<Rico> {
  double _contador = 6;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("GAME OUVER"),
          content: Text("você perdeu tudo - you lose!!"),
          actions: <Widget>[
            new FlatButton(
                onPressed: ()=> exit(0),
                child: Text("Fechar")),
          ],
        );
      },
    );
  } //showDialog

  void _maisGrana() {
    setState(() {
      //método respónsavel pela atualização (valores) da da nossa

      Random sorteio = new Random();

      int min = 1;
      int max = 5;
      int r = min + sorteio.nextInt(max - min);

      if (r == 1) {
        //se o sorteio for = 1 o usuario ganha 30
        _contador = _contador + 30;
        print(r);
      } else if (r == 2) {
        //so o sorteio for = 2 o usuario pode perde seu dinheiro
        _contador = _contador - 20;
        print(r);
      } else if (r == 3) {
        //se o sorteio for = 3 o usuario  pode perde metade do dinheiro
        _contador = _contador / 2;
        print(r);
      } else if (r == 4)
      {
        //se o sorteio for = 3 o usuario pode duplicar seu dinheiro
        _contador = _contador * 2;
        print(r);
      }

      if(_contador <= 0)
        {
         _showDialog();
         _contador = 10;
        }

    });
  }

  @override
  Widget build(BuildContext context) {
    //Cria a tela(ui)
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Venha Ficar Rico")),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: <Widget>[
              //Título do App
              Expanded(
                child: Center(
                  child: Text(
                    "Venha Ficar Rico!!!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),

              //valor em dinheiro
              Expanded(
                child: Center(
                  child: Text(
                    "R\$ $_contador",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: _contador >= 150 ? Colors.red : Colors.green,
                    ),
                  ),
                ),
              ),

              //botão de Ação

              Expanded(
                child: Center(
                  child: FlatButton(
                    onPressed: _maisGrana,
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Text(
                        "Mais Grana!!!",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
