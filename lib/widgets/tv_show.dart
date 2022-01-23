// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:dbmovies/description.dart';
import 'package:dbmovies/utils/text.dart';
import 'package:flutter/material.dart';

class TvShows extends StatelessWidget {
  final List tvShows;

  const TvShows({
    Key? key,
    required this.tvShows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Popular Tv Shows ',
            size: 26,
            color: Colors.amber,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 200,
              child: ListView.builder(
                  itemCount: tvShows.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Description(
                              name: tvShows[index]['original_name'],
                              bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                  tvShows[index]['backdrop_path'],
                              posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                  tvShows[index]['poster_path'],
                              description: tvShows[index]['overview'],
                              vote: tvShows[index]['vote_average'].toString(),
                              launchOn:
                                  tvShows[index]['last_air_date'].toString(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        width: 250.0,
                        child: Column(
                          children: [
                            Container(
                              width: 250,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            tvShows[index]['backdrop_path']),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: ModifiedText(
                                text: tvShows[index]['original_name'] ??
                                    'Loading',
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
