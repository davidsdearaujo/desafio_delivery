import 'package:flutter/material.dart';

class ItemPrato extends StatelessWidget {
  final String nome;
  final int estrelas;
  final int minutos;
  final int calorias;
  final String imagem;
  final Color cor;

  bool get _wrap => nome.length > 15;

  const ItemPrato({
    Key key,
    this.nome,
    this.estrelas,
    this.minutos,
    this.calorias,
    this.imagem,
    this.cor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Stack(
        overflow: Overflow.visible,
        fit: StackFit.loose,
        children: <Widget>[
          Positioned(
            left: 10,
            right: 10,
            bottom: 0,
            child: Card(
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildBottomCardButton(Icons.favorite, "375 Likes"),
                    _buildBottomCardButton(Icons.mode_comment, "75 Comments"),
                    _buildBottomCardButton(Icons.share, "Share"),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 35),
            child: Card(
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.all(20),
                      children: <Widget>[
                        Text(
                          nome,
                          style: TextStyle(
                            color: cor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        _wrap ? SizedBox(height: 11) : SizedBox(height: 5),
                        _wrap ? Container() : _buildStars(count: estrelas),
                        _wrap ? Container() : SizedBox(height: 15),
                        _buildValues(minutos, calorias),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(right: 30),
              width: 140,
              child: Image.network(imagem, fit: BoxFit.cover),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStars({int count = 0, double size = 14}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        count,
        (i) => Icon(
              Icons.star,
              color: Color(0xFFE4BA24),
              size: size,
            ),
      ),
    );
  }

  Widget _buildValues(int minutes, int nutritions) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              minutes.toString(),
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text("minutos", style: TextStyle(color: Colors.grey))
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "/",
            style: TextStyle(color: Colors.grey[200], fontSize: 40),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              nutritions.toString(),
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text("calorias", style: TextStyle(color: Colors.grey))
          ],
        ),
        SizedBox(width: 15),
        !_wrap ? Container() : _buildStars(count: estrelas),
      ],
    );
  }

  Widget _buildBottomCardButton(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, size: 14, color: Colors.grey),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
