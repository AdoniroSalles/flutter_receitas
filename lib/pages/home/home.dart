import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_modulo_1/models/receitas.dart';
import 'package:flutter_modulo_1/pages/details/detais.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cozinhando em casa"),
      ),
      body: _buildListCards(),
    );
  }

  FutureBuilder _buildListCards() {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/receitas.json'), //pega os dados
      builder: (context, snapshot) {
        List<dynamic> receitas = json.decode(snapshot.data.toString());

        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            Receita receita = Receita.fromJson(receitas[index]);

            return _buildCard(receita);
          },
          itemCount: receitas == null ? 0 : receitas.length,
        );
      },
    );
  }

  Widget _buildCard(receita) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                _imageCard(receita.foto),
                _buildGradientBackground(),
                _positionCard(receita.titulo),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              receita: receita,
            ),
          ),
        );
      },
    );
  }

  Positioned _positionCard(String titulo) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text(
        titulo,
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }

  Container _buildGradientBackground() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [Colors.transparent, Colors.blueAccent.withOpacity(0.7)]),
      ),
    );
  }

  Image _imageCard(foto) {
    return Image.asset(
      foto,
      fit: BoxFit.fill,
    );
  }
}
