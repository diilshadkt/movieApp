import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/constants/overview_constants.dart';
import 'package:movie_app/core/theme/themes/app_theme.dart';
import 'package:movie_app/features/feature2/domain/entities/comment_entity.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/presentation/providers/movie_provider.dart';

class ReviewWidget extends ConsumerWidget {
  final TextEditingController reviewController;
  final MovieEntity entity;
  const ReviewWidget(
      {super.key, required this.reviewController, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.sizeOf(context).height / 2,
                color: Colors.yellow,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height / 14,
                    width: MediaQuery.sizeOf(context).width / 1.5,
                    child: Column(
                      children: [
                        TextField(
                          controller: reviewController,
                          decoration: InputDecoration(
                            labelText: "Type here",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  ref
                                      .read(getMoviesProvider.notifier)
                                      .addComment(CommentEntity(
                                          text: reviewController.text,
                                          id: "",
                                          movieId: entity.id.toString()));
                                },
                                icon: Icon(Icons.send_outlined)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        StreamBuilder(
                          stream: ref
                              .watch(getMoviesProvider.notifier)
                              .getComment(entity.id.toString()),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                color: Colors.amber,
                                height: 300,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) => Card(
                                    color: Colors.amber,
                                    child: ListTile(
                                      title: Text(snapshot.data![index].text),
                                      leading: Text("${index + 1}"),
                                      trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete)),
                                    ),
                                  ),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return const Text("error");
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          height: MediaQuery.sizeOf(context).height / 17,
          width: MediaQuery.sizeOf(context).width / 1.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 23, left: 10),
            child: Text(
              OverViewConstants.addReview,
              style: AppTheme.of(context)
                  .typography
                  .h400
                  .copyWith(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
