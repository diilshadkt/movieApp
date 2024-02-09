import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/homepage_constants.dart';
import 'package:movie_app/core/theme/themes/app_theme.dart';
import 'package:movie_app/features/authentication/presentation/widgets/signout_button.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/presentation/pages/profile_page.dart';
import 'package:movie_app/features/feature2/presentation/providers/movie_provider.dart';
import 'package:movie_app/features/feature2/presentation/widgets/bottom_navigationbar_widget.dart';
import 'package:movie_app/features/feature2/presentation/widgets/gridview_widget.dart';

class HomePage extends ConsumerWidget {
  final imageBasePath = "https://image.tmdb.org/t/p/w500";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.textInverse,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.push(ProfilePage.path);
          },
          icon: const Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        actions: const [
          SignOutButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: ref.watch(getMoviesProvider).isRefreshing
            ? Center(
                child: CircularProgressIndicator(),
              )
            : switch (ref.watch(getMoviesProvider)) {
                AsyncData(:final value) => Column(children: [
                    CarouselSlider.builder(
                        itemCount: value.movies.length,
                        itemBuilder: (context, index, realIndex) {
                          final posterPathFile =
                              File(value.movies[index].posterPath);

                          final ImageProvider image;
                          if (posterPathFile.existsSync()) {
                            image = FileImage(posterPathFile);
                          } else {
                            image = NetworkImage(
                              imageBasePath + value.movies[index].posterPath,
                            );
                          }
                          return Padding(
                            padding: EdgeInsets.only(
                                top: AppTheme.of(context).spaces.space_125),
                            child: InkWell(
                              onTap: () {
                                context.push("/overviewPage",
                                    extra: value.movies[index]);
                              },
                              child: Container(
                                height: 400,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: image,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          aspectRatio: 10.0,
                          height: 330,
                          viewportFraction: 0.92,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 1000),
                          autoPlayCurve: Curves.linear,
                          enlargeCenterPage: true,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 330, top: 15),
                      child: Text(HomePageConstants.latest,
                          style: AppTheme.of(context).typography.h600.copyWith(
                              fontFamily: 'mohave', color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 300),
                      child: Text(HomePageConstants.movies,
                          style: AppTheme.of(context).typography.h800.copyWith(
                                fontFamily: 'mohave',
                              )),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.all(AppTheme.of(context).spaces.space_125),
                      child: Container(
                        height: 350,
                        child: GridViewWidget(movieList: value.upcomingMovies),
                      ),
                    )
                  ]),
                AsyncError(
                  :final error,
                ) =>
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          error.toString(),
                          style: TextStyle(color: Colors.amber),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              ref.invalidate(getMoviesProvider);
                            },
                            child: Text('Retry')),
                      ],
                    ),
                  ),
                _ => const Center(
                    child: CircularProgressIndicator(),
                  ),
              },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}




  // backgroundColor: Colors.black,
        // backgroundColor: AppTheme.of(context).colors.textInverse,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   actions: [
        //     SignOutButton(),
        //   ],
        // ),
        // body: SingleChildScrollView(
        //   child: switch (ref.watch(getMoviesProvider)) {
        //     AsyncData(:final value) => Column(children: [
        //         CarouselSlider.builder(
        //             itemCount: value.length,
        //             itemBuilder: (context, index, realIndex) {
        //               return Padding(
        //                 padding: EdgeInsets.only(
        //                     top: AppTheme.of(context).spaces.space_125),
        //                 child: InkWell(
        //                   onTap: () {
        //                     context.push("/overviewPage", extra: value[index]);
        //                   },
        //                   child: Container(
        //                     height: 400,
        //                     decoration: BoxDecoration(
        //                         borderRadius: BorderRadius.circular(10),
        //                         image: DecorationImage(
        //                           image: NetworkImage(
        //                             imageBasePath + value[index].posterPath,
        //                           ),
        //                           fit: BoxFit.fill,
        //                         )),
        //                   ),
        //                 ),
        //               );
        //             },
        //             options: CarouselOptions(
        //               aspectRatio: 10.0,
        //               height: 330,
        //               viewportFraction: 0.92,
        //               enableInfiniteScroll: true,
        //               autoPlay: true,
        //               autoPlayInterval: Duration(seconds: 3),
        //               autoPlayAnimationDuration: Duration(milliseconds: 1000),
        //               autoPlayCurve: Curves.linear,
        //               enlargeCenterPage: true,
        //             )),
        //         Padding(
        //           padding: EdgeInsets.only(right: 330, top: 15),
        //           child: Text(HomePageConstants.latest,
        //               style: AppTheme.of(context)
        //                   .typography
        //                   .h600
        //                   .copyWith(fontFamily: 'mohave', color: Colors.grey)),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(right: 300),
        //           child: Text(HomePageConstants.movies,
        //               style: AppTheme.of(context).typography.h800.copyWith(
        //                     fontFamily: 'mohave',
        //                   )),
        //         ),
        //         Padding(
        //           padding:
        //               EdgeInsets.all(AppTheme.of(context).spaces.space_125),
        //           child: Container(
        //             height: 350,
        //             child: GridViewWidget(
        //                 movieList: value, itemCount: value.length),
        //           ),
        //         )
        //       ]),
        //     AsyncError(
        //       :final error,
        //     ) =>
        //       Center(
        //         child: Text(error.toString()),
        //       ),
        //     _ => Center(
        //         child: CircularProgressIndicator(),
        //       ),
        //   },
        // )