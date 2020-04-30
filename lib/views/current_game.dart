import 'package:flutter/material.dart';
import 'package:my_messenger/models/game_model.dart';
import 'package:my_messenger/services/http_service.dart';

class CurrentGame extends StatefulWidget {
  final int gameId;
  CurrentGame({this.gameId});

  @override
  _CurrentGameState createState() => _CurrentGameState();
}

class _CurrentGameState extends State<CurrentGame> {
  final HttpService httpService = HttpService();
  Future<Game> currentGame;

  @override
  void initState() {
    super.initState();
    currentGame = httpService.getGame(widget.gameId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Game"),
      ),
      body: FutureBuilder(
          future: currentGame,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("ID: ${snapshot.data.id}",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Date: ${snapshot.data.date}",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Home team score: ${snapshot.data.homeTeamScore}",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Home team full name: ${snapshot.data.homeTeamFullName}",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Period: ${snapshot.data.period}",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Season: ${snapshot.data.season}",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Status: ${snapshot.data.status}",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Visitor team score: ${snapshot.data.visitorTeamScore}",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Visitor team full name: ${snapshot.data.visitorTeamFullName}",
                        style: TextStyle(fontSize: 18)),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text("Error");
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
