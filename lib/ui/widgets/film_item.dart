import 'package:flutter/material.dart';
import 'package:movie_task/ui/screens/details_screen/details_screen.dart';
import 'package:movie_task/ui/utils/app_assets.dart';

class FilmItem extends StatelessWidget {
  const FilmItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreen.routeName);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .18,
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
                  child: Image.asset(
                    AppAssets.icSplash,
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
                      const Text("Film name"),
                      const SizedBox(height: 8),
                      const Text("Film desc"),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 30,
                            color: Colors.yellow,
                          ),
                          Text("8.88",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.blueAccent))
                        ],
                      ),
                      const Text(
                        "12-12-3349",
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
