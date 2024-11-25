import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prism/constants.dart';
import 'package:prism/models/movie.dart';
import 'package:prism/screens/details_screen.dart';

class SearchScreen extends StatefulWidget {
  final String apiKey = "80df10980ac9cd84a2711c695eb171e6";

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Movie> _searchResults = [];
  bool _isLoading = false;

  // Function to fetch search results from TMDB
  Future<List<Movie>> _getSearchMovies(String query) async {
    if (query.isEmpty || query.length < 3) {
      return []; // Avoid searching for very short or empty queries
    }

    // Encode query to avoid issues with special characters
    final String encodedQuery = Uri.encodeComponent(query.trim());

    final _movieSearchUrl =
        'https://api.themoviedb.org/3/search/movie?api_key=${Constants.apiKey}&query=$encodedQuery';

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(_movieSearchUrl));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception('Failed to load search results');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Movies or Series", style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for movies or TV series...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (query) async {
                if (query.length >= 3) {
                  // Only search if query has more than 3 characters
                  final results = await _getSearchMovies(query);
                  setState(() {
                    _searchResults = results;
                  });
                } else {
                  setState(() {
                    _searchResults = []; // Clear results if query is too short
                  });
                }
              },
            ),
          ),

          // Results or Loading Indicator
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : _searchResults.isEmpty
                  ? Center(child: Text("Hmm...nothing here"))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final item = _searchResults[index];
                          return ListTile(
                            leading: Image.network(
                              '${Constants.imagePath}${item.posterPath}',
                              fit: BoxFit.cover,
                            ),
                            title: Text(item.title),
                            subtitle: Text("Release Date: ${item.releaseDate}"),
                            onTap: () {
                              // Navigate to the details page when a movie is clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(movie: item),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}
