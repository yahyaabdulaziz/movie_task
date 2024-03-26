import 'package:flutter/material.dart';
import 'package:movie_task/ui/utils/app_assets.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "DetailsScreen";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
            "Movie Name",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(12),
          child: ListView(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                height: height * .20,
                child: Image.asset(
                  AppAssets.icSplash,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: height * .06,
              ),
              Text(
                "Movie Name",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: height * .02,
              ),
              Text(
                "dec kfkn lf fl,glm fgmkfmg  lfglfmg fkmgkfmkg fkmgkfmgk mfkgmk fkgmkfm kmfkbm",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ));
  }
}
