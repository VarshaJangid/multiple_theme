import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

import 'widget/game_widget.dart';
import '/model/game_model.dart';

class GamePage extends StatefulWidget {
  final String categoryId;

  const GamePage({required this.categoryId, super.key});

  @override
  State<GamePage> createState() => _GameState();
}

class _GameState extends State<GamePage> {
  List<GameModel> gameList = [];

  @override
  void initState() {
    fetchGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: gameList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: gameList.map((gameModel) {
                return GameWidget(
                  gameModel: gameModel,
                );
              }).toList(),
            ),
    );
  }

  fetchGames() async {
    gameList = await gameApi();
    setState(() {});
  }

  Future<List<GameModel>> gameApi() async {
    http.Response response = await http.get(Uri.parse(
        "https://games.gamepix.com/games?category=${widget.categoryId}"));
    var responseJson = json.decode(response.body);
    return (responseJson['data'] as List)
        .map((p) => GameModel.fromJson(p))
        .toList();
  }
}
