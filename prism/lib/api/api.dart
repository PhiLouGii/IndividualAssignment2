import 'dart:convert';

import 'package:prism/constants.dart';
import 'package:prism/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static const _popularUrl =
      'https://api.themoviedb.org/3/tv/popular?api_key=${Constants.apiKey}';
  static const _topRatedseriesUrl =
      'https://api.themoviedb.org/3/tv/top_rated?api_key=${Constants.apiKey}';
  static const _airingtodayUrl =
      'https://api.themoviedb.org/3/tv/airing_today?api_key=${Constants.apiKey}';
  static const _movieSearchUrl =
      'https://api.themoviedb.org/3/search/movie?api_key=${Constants.apiKey}';
  static const _seriesSearchUrl =
      'https://api.themoviedb.org/3/search/tv?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Serie>> getPopularSeries() async {
    final response = await http.get(Uri.parse(_popularUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((serie) => Serie.fromJson(serie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Serie>> getTopRatedSeries() async {
    final response = await http.get(Uri.parse(_topRatedseriesUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((serie) => Serie.fromJson(serie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Serie>> getAiringTodaySeries() async {
    final response = await http.get(Uri.parse(_airingtodayUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((serie) => Serie.fromJson(serie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getSearchMovies() async {
    final response = await http.get(Uri.parse(_movieSearchUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Serie>> getSearchSeries() async {
    final response = await http.get(Uri.parse(_seriesSearchUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((serie) => Serie.fromJson(serie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
}
