import 'dart:convert';
import 'dart:async';
import 'package:examen_tendencias/models/hero_model.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  String _apiKey = "1e907ed1ecad3662cc09185f2a6cef7e";
  String _hash = "f3a69dd745520ec9fe8ad54b1891ef3c";
  String _url = "gateway.marvel.com";
  String _ts = "1";
  String _limit = "2";

  Future<List<Recipe>> _getRequest(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    List _temp = [];

    for (var i in decodedData['data']['results']) {
      i['thumbnail']['path'] =
          i['thumbnail']['path'] + '.' + i['thumbnail']['extension'];
      _temp.add(i);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }

  static Future<List<Recipe>> getRecipe() async {
    String _apiKey = "1e907ed1ecad3662cc09185f2a6cef7e";
    String _hash = "f3a69dd745520ec9fe8ad54b1891ef3c";
    String _url = "gateway.marvel.com";
    String _ts = "1";

    final url = Uri.https(_url, '/v1/public/characters', {
      "ts": _ts,
      "apikey": _apiKey,
      "hash": _hash,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    List _temp = [];

    for (var i in decodedData['data']['results']) {
      i['thumbnail']['path'] =
          i['thumbnail']['path'] + '.' + i['thumbnail']['extension'];
      _temp.add(i);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }

  Future<List<Recipe>> searchHeroes(String query) async {
    final url = Uri.https(_url, '/v1/public/characters', {
      'name': query,
      "ts": _ts,
      'apikey': _apiKey,
      "hash": _hash,
    });

    return await _getRequest(url);
  }
}
