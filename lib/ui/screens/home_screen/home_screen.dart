import 'package:flutter/material.dart';
import 'package:movie_task/ui/widgets/film_item.dart';

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
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return const FilmItem();
            }),
      ),
    );
  }
}
