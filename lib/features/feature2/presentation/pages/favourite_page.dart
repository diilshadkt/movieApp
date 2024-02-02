import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/feature2/presentation/providers/movie_provider.dart';
import 'package:movie_app/features/feature2/presentation/widgets/favourite_listview_widget.dart';

class FavouritePage extends ConsumerWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("FAVOURITE"),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width / 1,
        child: StreamBuilder(
            stream: ref.read(getMoviesProvider.notifier).getFromFirestore(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return FavouriteListviewWidget(movieList: snapshot.data!);
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error:${snapshot.error}'),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
