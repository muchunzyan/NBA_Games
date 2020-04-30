import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GamesList {
  List<Game> games;

  GamesList({this.games});

  factory GamesList.fromJson(Map<String, dynamic> json) {
    var gamesJson = json["data"] as List;

    List<Game> gamesList = gamesJson.map((i) => Game.fromJson(i)).toList();

    return GamesList(games: gamesList);
  }
}

class Game {
  final int id;
  final String date;
  final int homeTeamScore;
  final String homeTeamFullName;
  final int period;
  final int season;
  final String status;
  final int visitorTeamScore;
  final String visitorTeamFullName;

  Game(
      {@required this.id,
      @required this.date,
      @required this.homeTeamScore,
      @required this.homeTeamFullName,
      @required this.period,
      @required this.season,
      @required this.status,
      @required this.visitorTeamScore,
      @required this.visitorTeamFullName});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
        id: json["id"] as int,
        date: json["date"] as String,
        homeTeamScore: json["home_team_score"] as int,
        homeTeamFullName: json["home_team"]["full_name"] as String,
        period: json["period"] as int,
        season: json["season"] as int,
        status: json["status"] as String,
        visitorTeamScore: json["visitor_team_score"] as int,
        visitorTeamFullName: json["visitor_team"]["full_name"] as String);
  }
}
