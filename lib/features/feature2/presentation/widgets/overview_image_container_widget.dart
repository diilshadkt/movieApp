import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/theme/themes/app_theme.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/presentation/providers/movie_provider.dart';

class OverviewImageContainerWidget extends ConsumerWidget {
  final MovieEntity entity;
  final imagePath = "https://image.tmdb.org/t/p/w500";
  const OverviewImageContainerWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(children: [
      Container(
        width: MediaQuery.sizeOf(context).width / 1,
        height: MediaQuery.sizeOf(context).height / 1.65,
        decoration: BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
                image: NetworkImage(imagePath + entity.posterPath),
                fit: BoxFit.fill)),
      ),
      //arrow button
      Positioned(
        left: 7,
        top: 28,
        child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.40),
            radius: 25,
            child: IconButton(
                onPressed: () {
                  context.go("/");
                },
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 30,
                  color: Colors.white,
                ))),
      ),
      // favourite button
      Positioned(
        right: 7,
        top: 28,
        child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.40),
            radius: 25,
            child: IconButton(
                onPressed: () {
                  ref.read(getMoviesProvider.notifier).addToFireStore(entity);
                },
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ))),
      ),
      Positioned(
        left: 17,
        bottom: 40,
        child: Text(
          entity.title,
          style: AppTheme.of(context)
              .typography
              .h800
              .copyWith(color: Colors.amberAccent, fontFamily: "mohave"),
        ),
      ),
      Positioned(
        right: 30,
        bottom: 42,
        child: Text(
          "(${entity.releaseDate.year})",
          style: AppTheme.of(context)
              .typography
              .h200
              .copyWith(color: Colors.amberAccent),
        ),
      ),
      Positioned(
        left: 17,
        bottom: 13,
        child: Row(
          children: [
            //action
            Container(
              height: MediaQuery.sizeOf(context).height / 32,
              width: MediaQuery.sizeOf(context).width / 6.50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey, width: 2)),
              child: Center(
                child: Text(
                  "ACTION",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              ),
            ),

            //drama
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: MediaQuery.sizeOf(context).height / 32,
                width: MediaQuery.sizeOf(context).width / 6.50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey, width: 2)),
                child: Center(
                  child: Text(
                    "DRAMA",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
              ),
            ),

            //horror
            Container(
              height: MediaQuery.sizeOf(context).height / 32,
              width: MediaQuery.sizeOf(context).width / 6.50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey, width: 2)),
              child: Center(
                child: Text(
                  "HORROR",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              ),
            )
          ],
        ),
      )
    ]);
  }
}
