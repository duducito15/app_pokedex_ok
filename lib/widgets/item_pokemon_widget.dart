import 'package:flutter/material.dart';

class ItemPokemonWidget extends StatelessWidget {
  const ItemPokemonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff4ccfb2),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -25,
            right: -20,
            child: Image.asset(
              "assets/images/pokeball.png",
              height: 120.0,
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          Positioned(
            right: -15,
            bottom: -10,
            child: Image.network(
                "http://www.serebii.net/pokemongo/pokemon/001.png"),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              children: [
                Text(
                  "Bulbasaur",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 6.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
                  child: Text(
                    "Grass",
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
