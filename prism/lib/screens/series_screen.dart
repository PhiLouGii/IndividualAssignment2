import 'package:flutter/material.dart';
import 'package:prism/api/api.dart';
import 'package:prism/models/movie.dart';
import 'package:prism/screens/home_screen.dart';
import 'package:prism/screens/series_search_screen.dart';
import 'package:prism/widgets/series_slider.dart';
import 'package:prism/widgets/trending_series_slider.dart';

class SeriesScreen extends StatefulWidget {
  const SeriesScreen({super.key});

  @override
  State<SeriesScreen> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen> {
  late Future<List<Serie>> popularSeries;
  late Future<List<Serie>> topRatedSeries;
  late Future<List<Serie>> airingtodaySeries;

  @override
  void initState() {
    super.initState();
    popularSeries = Api().getPopularSeries();
    topRatedSeries = Api().getTopRatedSeries();
    airingtodaySeries = Api().getAiringTodaySeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/prism_logo.png',
          fit: BoxFit.cover,
          height: 50,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.movie),
            tooltip: 'Go to Movies',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchSeriesScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Popular Series',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            child: FutureBuilder(
                future: popularSeries,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return TrendingSlider(
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
          const SizedBox(height: 32),
          Text(
            'Top Rated Series',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            child: FutureBuilder(
                future: topRatedSeries,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return MovieSlider(
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
          const SizedBox(height: 32),
          Text(
            'Airing Today',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            child: FutureBuilder(
                future: airingtodaySeries,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return MovieSlider(
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ]),
      ),
    );
  }
}
