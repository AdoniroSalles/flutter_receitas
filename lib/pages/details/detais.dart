import 'package:flutter/material.dart';
import 'package:flutter_modulo_1/models/receitas.dart';

class DetailsPage extends StatelessWidget {
  final Receita receita;

  DetailsPage({Key key, @required this.receita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDetails();
  }

  Scaffold _buildDetails() {
    return Scaffold(
        appBar: _buildAppBar(),
        body: ListView(
          children: [
            _buildImageDetails(receita.foto),
            _buildTitleDetails(receita.titulo),
            _buildRowDetailsIcon(
                '${receita.porcoes} porções', receita.tempoPreparo),
            _buildSubtitleDetails('Ingredientes'),
            _buildTextDetails(receita.ingredientes),
            _buildSubtitleDetails('Modo de preparo'),
            _buildTextDetails(receita.modoPreparo),
          ],
        ));
  }

  Widget _buildTitleDetails(title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(color: Colors.blue, fontSize: 30),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Detalhes"),
    );
  }

  Widget _buildImageDetails(images) {
    return Image.asset(images);
  }

  Row _buildRowDetailsIcon(rendimento, tempo_preparo) {
    return Row(
      children: [
        _buildColumnDetailsIcon(Icons.restaurant, rendimento),
        _buildColumnDetailsIcon(Icons.timer, tempo_preparo),
      ],
    );
  }

  Expanded _buildColumnDetailsIcon(icone, texto) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icone,
            color: Colors.blue,
          ),
          Text(
            texto,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Center _buildSubtitleDetails(subtitulo) {
    return Center(
      child: Text(
        subtitulo,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      ),
    );
  }

  Container _buildTextDetails(texto) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(texto),
    );
  }
}
