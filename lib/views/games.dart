import 'package:flutter/material.dart';
import 'package:my_messenger/models/game_model.dart';
import 'package:my_messenger/services/http_service.dart';
import 'package:my_messenger/views/current_game.dart';

class GamesView extends StatefulWidget {
  @override
  _GamesViewState createState() => _GamesViewState();
}

class _GamesViewState extends State<GamesView> {
  final HttpService httpService = HttpService();
  Future<GamesList> gamesList;

  int pageNumber = 1;
  int numberOfGames = 20;

  @override
  void initState() {
    super.initState();
    gamesList = httpService.getGamesList(pageNumber, numberOfGames);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List of games"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  if (pageNumber != 1) {
                    setState(() {
                      pageNumber -= 1;
                      gamesList =
                          httpService.getGamesList(pageNumber, numberOfGames);
                    });
                  }
                },
                child: Icon(Icons.skip_previous, color: Colors.white)),
            FlatButton(
                onPressed: () {
                  setState(() {
                    pageNumber += 1;
                    gamesList =
                        httpService.getGamesList(pageNumber, numberOfGames);
                  });
                },
                child: Icon(Icons.skip_next, color: Colors.white))
          ],
        ),
        body: FutureBuilder<GamesList>(
          future: gamesList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        "${snapshot.data.games[index].homeTeamFullName} - ${snapshot.data.games[index].visitorTeamFullName}"),
                    subtitle: Text(
                        "Score: ${snapshot.data.games[index].homeTeamScore} - ${snapshot.data.games[index].visitorTeamScore}"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CurrentGame(
                              gameId: snapshot.data.games[index].id)));
                    },
                  );
                },
                itemCount: snapshot.data.games.length,
              );
            } else if (snapshot.hasError) {
              return Text("Error");
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
