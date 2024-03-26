import 'package:flutter/material.dart';
import 'package:movie_task/data/model/top_rated_response.dart';
import 'package:movie_task/ui/screens/details_screen/details_screen.dart';
import 'package:movie_task/ui/utils/constants.dart';

class FilmItem extends StatelessWidget {
  Results results;

  FilmItem({required this.results, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreen.routeName);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .22,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                    "${Constants.imagePath}${results.posterPath}",
                    fit: BoxFit.fill,
                  ),
                )),
            Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 4),
                      Text(results.title ?? ""),
                      const SizedBox(height: 8),
                      Text(results.overview ?? "",maxLines: 2),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.yellow,
                          ),
                          Text(results.voteAverage.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.blueAccent))
                        ],
                      ),
                      Text(
                        results.releaseDate ?? "",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey.shade500, fontSize: 16),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
