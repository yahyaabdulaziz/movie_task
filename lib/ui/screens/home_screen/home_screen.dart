import 'package:flutter/material.dart';
import 'package:movie_task/data/api/api.dart';
import 'package:movie_task/data/model/top_rated_response.dart';
import 'package:movie_task/ui/widgets/error_view.dart';
import 'package:movie_task/ui/widgets/film_item.dart';
import 'package:movie_task/ui/widgets/loading_view.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18)),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "Movie Task",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.all(12),
                child: Text(
                  "Top Rated Movies",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.blueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )),
            Expanded(
              child: FutureBuilder(
                  future: ApiManger.getTopRatedMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return buildTopRatedList(snapshot.data!);
                    } else if (snapshot.hasError) {
                      return ErrorView(message: snapshot.error.toString());
                    } else {
                      return const Center(child: LoadingView());
                    }
                  }),
            ),
          ]),
    );
  }

  buildTopRatedList(List<Results> topRatedMovie) {
    return Expanded(
      child: ListView.builder(
          itemCount: topRatedMovie.length,
          itemBuilder: (context, index) {
            return FilmItem(
              results: topRatedMovie[index],
            );
          }),
    );
  }
}
