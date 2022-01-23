import 'package:dbmovies/utils/text.dart';
import 'package:dbmovies/widgets/top_rated.dart';
import 'package:dbmovies/widgets/trending.dart';
import 'package:dbmovies/widgets/tv_show.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvShows = [];
  final String apikey = 'YOUR-API-KEY';
  final readAccessToken = 'YOUR-READ-ACCESS-TOKEN';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readAccessToken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPouplar();

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tvShows = tvResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: ModifiedText(
            text: 'My Flutter Movie App',
            color: Colors.amber[600],
            size: 20.0,
          ),
        ),
        body: ListView(
          children: [
            TvShows(tvShows: tvShows),
            TopRated(topRated: topRatedMovies),
            TrendingMovies(trending: trendingMovies),
          ],
        ),
      ),
    );
  }
}
