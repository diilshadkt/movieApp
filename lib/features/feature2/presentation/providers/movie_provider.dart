import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/feature2/data/repository/movie_repository_impl.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/domain/repository/movie_repository.dart';
import 'package:movie_app/features/feature2/domain/usecases/movie_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_provider.g.dart';

@riverpod
class GetMovies extends _$GetMovies {
  late final MovieRepository repository;
  @override
  Future<List<MovieEntity>> build() async {
    repository = ref.watch(movieRepositoryProvider);
    return MovieUsecases(repository: repository)();
  }
}
