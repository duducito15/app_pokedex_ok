import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  List pokemons = [];
  getDataPokemon() async {
    Uri _uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.Response response = await http.get(_uri);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      //print(response.body);
      Map<String, dynamic> myMap = json.decode(response.body);
      pokemons = myMap["pokemon"];
      print(pokemons);
    }
  }

  @override
  Widget build(BuildContext context) {
    getDataPokemon();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  "Pokedex",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 1.4,
                  children: [
                    Container(
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10.0),
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 14.0, vertical: 4.0),
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
