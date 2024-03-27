import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_task/data/model/responses/top_rated_response.dart';
import 'package:movie_task/domain/di/di.dart';
import 'package:movie_task/presentation/screens/home_screen/home_screen_view_model.dart';
import 'package:movie_task/presentation/utils/base_request_states.dart';
import 'package:movie_task/presentation/widgets/film_item.dart';
import 'package:movie_task/presentation/widgets/loading_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<HomeViewModel>();
    viewModel.loadTopRatedFilms();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
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
                child: BlocBuilder(
                    bloc: viewModel.getTopRatedUseCase,
                    builder: (context, state) {
                      if (state is BaseRequestSuccessState<List<Results>>) {
                        return buildTopRatedList(state.data!, context);
                      } else if (state is BaseRequestErrorState) {
                        return ErrorWidget(state.message);
                      } else {
                        return const LoadingView();
                      }
                    }),
              ),
            ]),
      ),
    );
  }

  buildTopRatedList(List<Results> topRatedMovies, BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels ==
                notification.metrics.maxScrollExtent &&
            notification is ScrollEndNotification) {
          HomeViewModel viewModel = BlocProvider.of<HomeViewModel>(context);
          viewModel.loadTopRatedFilms();
          // Testing end of scrolling
          print("Loading more movies...");
        }
        return true;
      },
      child: BlocProvider<HomeViewModel>.value(
        value: viewModel,
        child: ListView.builder(
          itemCount: topRatedMovies.length + 1,
          itemBuilder: (context, index) {
            if (index < topRatedMovies.length) {
              return FilmItem(
                results: topRatedMovies[index],
              );
            } else {
              // This is the last item, show a loading indicator
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
