import 'dart:convert';

import '../constants.dart';
import '../models/movies.dart';
import 'package:http/http.dart' as http;
class Api{
static const _trendingUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apikey}';


static const _topRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apikey}';


static const _nowPlayingUrl = 'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apikey}';

  Future<List<Movie>> getTrendingMovies() async{
    final response = await http.get(Uri.parse(_trendingUrl));
    if(response.statusCode == 200){
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
     return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something happened');
    }
  }


Future<List<Movie>> getTopRatedMovies() async{
  final response = await http.get(Uri.parse(_topRatedUrl));
  if(response.statusCode == 200){
    final decodeData = json.decode(response.body)['results'] as List;
    print(decodeData);
    return decodeData.map((movie) => Movie.fromJson(movie)).toList();
  }else{
    throw Exception('Something happened');
  }
}



Future<List<Movie>> getnowPlayingMovies() async{
  final response = await http.get(Uri.parse(_nowPlayingUrl));
  if(response.statusCode == 200){
    final decodeData = json.decode(response.body)['results'] as List;
    print(decodeData);
    return decodeData.map((movie) => Movie.fromJson(movie)).toList();
  }else{
    throw Exception('Something happened');
  }
}
}