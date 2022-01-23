// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:dbmovies/description.dart';
import 'package:dbmovies/utils/text.dart';
import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({
    Key? key,
    required this.trending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Trending Movies',
            size: 26,
            color: Colors.amber,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 270,
              child: ListView.builder(
                  itemCount: trending.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Description(
                              name: trending[index]['title'],
                              bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                  trending[index]['backdrop_path'],
                              posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                  trending[index]['poster_path'],
                              description: trending[index]['overview'],
                              vote: trending[index]['vote_average'].toString(),
                              launchOn: trending[index]['release_date'],
                            ),
                          ),
                        );
                      },
                      child: trending[index]['title'] != null
                          ? Container(
                              width: 140.0,
                              child: Column(
                                children: [
                                  Container(
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500' +
                                                trending[index]['poster_path']),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: ModifiedText(
                                      text:
                                          trending[index]['title'] ?? 'Loading',
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
