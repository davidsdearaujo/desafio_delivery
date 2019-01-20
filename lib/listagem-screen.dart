import 'package:flutter/material.dart';

import 'item-prato.dart';

class ListagemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF06121E),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                ItemPrato(
                  nome: "KAMAAGE UDON",
                  minutos: 20,
                  calorias: 196,
                  estrelas: 5,
                  cor: Color(0xFFE4BA24),
                  imagem:
                      "http://www.frontera.com.br/mobile/images/gastronomy/1024/dish-1.png",
                ),
                ItemPrato(
                  nome: "VALENCIAN PRONUNCIATION",
                  minutos: 20,
                  calorias: 196,
                  estrelas: 5,
                  cor: Colors.red,
                  imagem:
                      "http://www.frontera.com.br/mobile/images/gastronomy/1024/dish-2.png",
                ),
                ItemPrato(
                  nome: "KARAAGE UDON",
                  minutos: 20,
                  calorias: 196,
                  estrelas: 5,
                  cor: Colors.green,
                  imagem:
                      "http://www.frontera.com.br/mobile/images/gastronomy/1024/dish-3.png",
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildBottomNavigatorButtom(
                    icon: Icons.restaurant_menu, text: "Recipes"),
                _buildBottomNavigatorButtom(
                    icon: Icons.room_service, text: "Recipes", selected: true),
                _buildBottomNavigatorButtom(
                    icon: Icons.shopping_basket, text: "Shopping"),
                _buildBottomNavigatorButtom(
                    icon: Icons.spa, text: "My recipes"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigatorButtom({
    IconData icon,
    String text = "",
    bool selected = false,
  }) {
    var color = Color(selected ? 0xFFE4BA24 : 0xFF355371);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, color: color),
        Text(text, style: TextStyle(fontSize: 15, color: color))
      ],
    );
  }
}
