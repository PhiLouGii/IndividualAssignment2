import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prism/constants.dart';
import 'package:prism/models/movie.dart';
import 'package:prism/screens/details_series_screen.dart';

class SearchSeriesScreen extends StatefulWidget {
  final String apiKey = "80df10980ac9cd84a2711c695eb171e6";

  @override
  _SearchSeriesScreenState createState() => _SearchSeriesScreenState();
}

class _SearchSeriesScreenState extends State<SearchSeriesScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Serie> _searchResults = [];
  bool _isLoading = false;

  // Function to fetch search results from TMDB
  Future<List<Serie>> _getSearchSeries(String query) async {
    if (query.isEmpty || query.length < 3) {
      return []; // Avoid searching for very short or empty queries
    }

    // Encode query to avoid issues with special characters
    final String encodedQuery = Uri.encodeComponent(query.trim());

    final _seriesSearchUrl =
        'https://api.themoviedb.org/3/search/tv?api_key=${Constants.apiKey}&query=$encodedQuery';

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(_seriesSearchUrl));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        return decodedData.map((serie) => Serie.fromJson(serie)).toList();
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
                  final results = await _getSearchSeries(query);
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
                            title: Text(item.originalName),
                            subtitle:
                                Text("First Air Date: ${item.firstAirDate}"),
                            onTap: () {
                              // Navigate to the details page when a movie is clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsSeriesScreen(serie: item),
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
