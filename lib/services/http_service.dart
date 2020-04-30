import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_messenger/models/game_model.dart';

class HttpService {
  final String url = "https://free-nba.p.rapidapi.com/games";
  final headers = {
    'x-rapidapi-host': "free-nba.p.rapidapi.com",
    'x-rapidapi-key': "d4670f4573mshca492fc0bd3310ap11c9a1jsn2c70ee09337e"
  };

  Future<GamesList> getGamesList(int pageNumber, int numberOfGames) async {
    var params = {"page": pageNumber.toString(), "per_page": numberOfGames.toString()};

    var urlWithParams = Uri.parse(url).replace(queryParameters: params);

    Response responce = await get(urlWithParams, headers: headers);

    if (responce.statusCode == 200) {
      return GamesList.fromJson(json.decode(responce.body));
    } else {
      throw Exception("Error: ${responce.reasonPhrase}");
    }
  }

  Future<Game> getGame(int gameId) async {
    Response responce =
        await get(url + "/" + gameId.toString(), headers: headers);

    if (responce.statusCode == 200) {
      return Game.fromJson(json.decode(responce.body));
    } else {
      throw Exception("Error: ${responce.reasonPhrase}");
    }
  }
}
