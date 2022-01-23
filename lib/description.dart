import 'package:dbmovies/utils/text.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name;
  final String description;
  final String bannerUrl;
  final String posterUrl;
  final String vote;
  final String launchOn;
  const Description({
    Key? key,
    required this.name,
    required this.description,
    required this.bannerUrl,
    required this.posterUrl,
    required this.vote,
    required this.launchOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        child: ListView(
          children: [
            SizedBox(
              height: 250.0,
              child: Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      height: 250.0,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    child: ModifiedText(
                      text: ' ⭐ Average Rating - ' + vote,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: ModifiedText(
                text: name,
                size: 24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: ModifiedText(
                text: 'Releasing On - ' + launchOn,
                size: 14.0,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 250.0,
                  width: 100.0,
                  child: Image.network(posterUrl),
                ),
                Flexible(
                  child: SizedBox(
                    child: ModifiedText(
                      text: description,
                      size: 18.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
