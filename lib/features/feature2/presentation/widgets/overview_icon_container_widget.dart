import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/overview_constants.dart';
import 'package:movie_app/core/theme/themes/app_theme.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';

class OverviewIconContainerWidget extends ConsumerWidget {
  final MovieEntity entity;
  const OverviewIconContainerWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(children: [
      Container(
        width: MediaQuery.sizeOf(context).width / 1.08,
        height: MediaQuery.sizeOf(context).height / 10,
        // color: Colors.amber,
      ),
      // item 1
      Positioned(
        left: 10,
        top: 17,
        child: Column(
          children: [
            const Icon(
              Icons.alarm,
              size: 30,
              color: Colors.lightGreen,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                "${entity.releaseDate.day}-${entity.releaseDate.month}-${entity.releaseDate.year}",
                style: AppTheme.of(context)
                    .typography
                    .h400
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      // item 2
      Positioned(
        left: 160,
        top: 15,
        child: Column(
          children: [
            Image.asset(
              OverViewConstants.languageLogoPath,
              width: 50,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                "Language :${entity.language}",
                style: AppTheme.of(context)
                    .typography
                    .h400
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      //item 3
      Positioned(
        left: 330,
        top: 13,
        child: Column(
          children: [
            Image.asset(
              OverViewConstants.ratingLogoPath,
              width: 40,
              color: Colors.orange,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                entity.voteAverage.toString(),
                style: AppTheme.of(context)
                    .typography
                    .h600
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      )
    ]);
  }
}
