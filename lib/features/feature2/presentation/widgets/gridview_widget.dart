import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/themes/app_theme.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';

class GridViewWidget extends StatelessWidget {
  final imagePath = "https://image.tmdb.org/t/p/w500";
  final List<MovieEntity> movieList;
  const GridViewWidget({super.key, required this.movieList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          mainAxisExtent: 336),
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        final posterPathFile = File(movieList[index].posterPath);

        final ImageProvider image;
        if (posterPathFile.existsSync()) {
          image = FileImage(posterPathFile);
        } else {
          image = NetworkImage(
            imagePath + movieList[index].posterPath,
          );
        }
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height / 2.97,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(image: image, fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: AppTheme.of(context).spaces.space_50),
                child: Container(
                  height: MediaQuery.sizeOf(context).height / 24,
                  width: MediaQuery.sizeOf(context).width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 216, 213, 213),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Watch Now>>",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
