import 'dart:developer';

import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/utils/snackbar.dart';
import 'package:movie_app/features/feature2/data/repository/comment_repository_impl.dart';
import 'package:movie_app/features/feature2/data/repository/firebase_repository_impl.dart';
import 'package:movie_app/features/feature2/data/repository/movie_repository_impl.dart';
import 'package:movie_app/features/feature2/domain/entities/comment_entity.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/domain/repository/comment_repository.dart';
import 'package:movie_app/features/feature2/domain/repository/movie_repository.dart';
import 'package:movie_app/features/feature2/domain/usecases/add_comment_usecase.dart';
import 'package:movie_app/features/feature2/domain/usecases/get_comment_usecase.dart';
import 'package:movie_app/features/feature2/domain/usecases/add_to_firebase_usecase.dart';
import 'package:movie_app/features/feature2/domain/usecases/delete_to_firebase_usecase.dart';
import 'package:movie_app/features/feature2/domain/usecases/get_from_firebase_usecase.dart';
import 'package:movie_app/features/feature2/domain/usecases/movie_usecases.dart';
import 'package:movie_app/features/feature2/domain/usecases/search_movie_usecase.dart';
import 'package:movie_app/features/feature2/presentation/providers/provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_provider.g.dart';

@riverpod
class GetMovies extends _$GetMovies {
  late MovieEntity entity;
  late final MovieRepository repository;
  late final CommentEntity entity2;
  late final CommentRepository repository2;
  @override
  Future<ProviderState> build() async {
    return ProviderState(
        movies: await MovieUsecases(
            repository: ref.watch(movieRepositoryProvider))(),
        search: null);
  }

//favourite
  Future<void> addToFireStore(MovieEntity entity) async {
    final repository = ref.watch(firebaseRepositoryProvider);
    return AddToFirebaseUsecase(repository: repository)(entity);
  }

  Stream<List<MovieEntity>> getFromFirestore() {
    final repositorys = ref.watch(firebaseRepositoryProvider);
    return GetFromFirebaseUsecase(repository: repositorys)();
  }

  Future<void> deleteFromFirestore(String id) {
    final repository = ref.watch(firebaseRepositoryProvider);
    return DeleteFromFirebaseUsecase(repository: repository)(id);
  }

  //comment
  Future<void> addComment(CommentEntity entity2) async {
    final repository = ref.watch(commentRepositoryProvider);
    return AddCommentUsecase(repository: repository)(entity2);
  }

  Stream<List<CommentEntity>> getComment(String id) {
    final repository = ref.watch(commentRepositoryProvider);
    return GetCommentUsecase(repository: repository)(id);
  }

  //search
  Future<void> searchMovies(String text, BuildContext context) async {
    try {
      final repository = ref.watch(movieRepositoryProvider);
      final data = await SearchMovieUsecase(repository: repository)(text);
      state = AsyncValue.data(state.value!.copyWith(search: data));
    } on Exception catch (e) {
      log(e.toString());
      Future.sync(
          () => SnackbarUtils.showSnackbarMessage(context, e.toString()));
    }
  }
}
