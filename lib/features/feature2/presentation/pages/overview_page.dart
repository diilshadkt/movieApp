import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/overview_constants.dart';
import 'package:movie_app/core/theme/themes/app_theme.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/presentation/widgets/overview_icon_container_widget.dart';
import 'package:movie_app/features/feature2/presentation/widgets/overview_image_container_widget.dart';
import 'package:movie_app/features/feature2/presentation/widgets/review_widget.dart';
import 'package:movie_app/features/feature2/presentation/widgets/synopsis_overview_widget.dart';

class OverviewPage extends ConsumerWidget {
  final MovieEntity entity;
  final imagePath = "https://image.tmdb.org/t/p/w500";
  const OverviewPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 26, 39),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OverviewImageContainerWidget(entity: entity),

            // part 2
            SizedBox(
              height: 3,
            ),
            OverviewIconContainerWidget(entity: entity),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1,
                color: Color.fromARGB(255, 89, 88, 88),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 290, bottom: 14),
              child: Text(
                OverViewConstants.synopsis,
                style: AppTheme.of(context).typography.h600.copyWith(
                    color: Colors.white,
                    fontFamily: "mohave",
                    letterSpacing: 0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SeeMoreWidget(text: entity.overview),
            ),
            ReviewWidget()
          ],
        ),
      ),
    );
  }
}
