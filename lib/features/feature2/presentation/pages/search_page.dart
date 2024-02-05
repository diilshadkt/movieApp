import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/feature2/presentation/providers/movie_provider.dart';

class SearchPage extends ConsumerWidget {
  static const routePath = "/search";
  final imagePath = "https://image.tmdb.org/t/p/w500";
  final TextEditingController searchController = TextEditingController();
  SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 26,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  context.go("/");
                },
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "search movies",
                  suffixIcon: IconButton(
                      onPressed: () {
                        ref
                            .read(getMoviesProvider.notifier)
                            .searchMovies(searchController.text, context);
                      },
                      icon: Icon(Icons.search)),
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 231, 230, 230),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 231, 230, 230),
                    ),
                  ),
                ),
              ),
            ),
            Builder(
              builder: (context) {
                return ref.watch(getMoviesProvider).isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ref.watch(getMoviesProvider).when(
                        data: (data) {
                          final search = data.search;
                          if (search == null) {
                            return const Align(
                              child: Text('Search here'),
                            );
                          } else {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                        mainAxisExtent: 300),
                                itemCount: data.search!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: MediaQuery.sizeOf(context).height /
                                        2.97,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(imagePath +
                                              data.search![index].posterPath),
                                          fit: BoxFit.fill),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        },
                        error: (error, stackTrace) => Text(error.toString()),
                        loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ));
              },
            )
          ],
        ),
      ),
    );
  }
}
