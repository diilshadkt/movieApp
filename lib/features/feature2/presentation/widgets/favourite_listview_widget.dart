import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/presentation/providers/movie_provider.dart';

class FavouriteListviewWidget extends ConsumerWidget {
  final imagePath = "https://image.tmdb.org/t/p/w500";
  final List<MovieEntity> movieList;

  const FavouriteListviewWidget({super.key, required this.movieList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height / 3,
            width: MediaQuery.sizeOf(context).width / 1,
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                  image: NetworkImage(imagePath + movieList[index].posterPath),
                  fit: BoxFit.fill),
            ),
            child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(.30),
                  child: IconButton(
                      onPressed: () {
                        ref
                            .read(getMoviesProvider.notifier)
                            .deleteFromFirestore(
                                movieList[index].id.toString());
                      },
                      icon: Icon(Icons.delete)),
                )),
          ),
        );
      },
    );
  }
}
