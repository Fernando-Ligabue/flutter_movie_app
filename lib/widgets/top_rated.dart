// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:dbmovies/description.dart';
import 'package:dbmovies/utils/text.dart';
import 'package:flutter/material.dart';

class TopRated extends StatelessWidget {
  final List topRated;

  const TopRated({
    Key? key,
    required this.topRated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Top Rated Movies',
            size: 26,
            color: Colors.amber,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 270,
              child: ListView.builder(
                itemCount: topRated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            name: topRated[index]['title'],
                            bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                topRated[index]['backdrop_path'],
                            posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                topRated[index]['poster_path'],
                            description: topRated[index]['overview'],
                            vote: topRated[index]['vote_average'].toString(),
                            launchOn: topRated[index]['release_date'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 140.0,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        topRated[index]['poster_path']),
                              ),
                            ),
                          ),
                          Container(
                            child: ModifiedText(
                              text: topRated[index]['title'] ?? 'Loading',
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
