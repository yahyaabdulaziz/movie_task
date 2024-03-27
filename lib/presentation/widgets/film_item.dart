import 'package:flutter/material.dart';
import 'package:movie_task/data/model/responses/top_rated_response.dart';
import 'package:movie_task/presentation/screens/details_screen/details_screen.dart';
import 'package:movie_task/presentation/utils/constants.dart';

class FilmItem extends StatefulWidget {
  Results results;

  FilmItem({required this.results, super.key});

  @override
  State<FilmItem> createState() => _FilmItemState();
}

class _FilmItemState extends State<FilmItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreen.routeName,
            arguments: widget.results);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .25,
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
                    "${Constants.imagePath}${widget.results.posterPath}",
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
                      const SizedBox(height: 12),
                      Text(widget.results.title ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Text(
                        widget.results.overview ?? "",
                        maxLines: 2,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.yellow,
                          ),
                          Text(widget.results.voteAverage.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.blueAccent))
                        ],
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.all(6),
                        child: Text(
                          widget.results.releaseDate ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Colors.grey.shade500, fontSize: 12),
                          textAlign: TextAlign.right,
                        ),
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
