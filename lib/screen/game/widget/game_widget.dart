import 'package:flutter/material.dart';

import '/model/game_model.dart';
import '../game_web_view.dart';

class GameWidget extends StatelessWidget {
  final GameModel gameModel;

  const GameWidget({Key? key, required this.gameModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameWebView(gameURL: gameModel.url),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .13,
              width: MediaQuery.of(context).size.width * .245,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(gameModel.thumbnailUrl),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    gameModel.title,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    gameModel.description,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
