import 'package:movie_app/features/feature2/data/datasources/api_datasource.dart';
import 'package:movie_app/features/feature2/data/datasources/api_datasource_impl.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/domain/repository/movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_repository_impl.g.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiDatasource datasource;
  MovieRepositoryImpl({required this.datasource});

  @override
  Future<List<MovieEntity>> getMovies() async {
    final data = await datasource.getMovies();

    late List<MovieEntity> results;
    results = [
      for (var result in data.results)
        MovieEntity(
            id: result.id,
            originalTitle: result.originalTitle,
            overview: result.overview,
            posterPath: result.posterPath ?? "no image",
            backdropPath: result.backdropPath ?? "no poster",
            title: result.title,
            voteAverage: result.voteAverage,
            language: result.originalLanguage,
            releaseDate: result.releaseDate),
    ];
    return results;
  }

  @override
  Future<List<MovieEntity>> upcomingMovies() async {
    final data = await datasource.upcomingMovies();
    late List<MovieEntity> results;
    results = [
      for (var result in data.results)
        MovieEntity(
            id: result.id,
            originalTitle: result.originalTitle,
            overview: result.overview,
            posterPath: result.posterPath ?? "no image",
            backdropPath: result.backdropPath ?? "no poster",
            title: result.title,
            voteAverage: result.voteAverage,
            language: result.originalLanguage,
            releaseDate: result.releaseDate),
    ];
    return results;
  }

  @override
  Future<List<MovieEntity>> searchMovies(String text) async {
    final data = await datasource.searchMovies(text);
    late List<MovieEntity> results;
    results = [
      for (var result in data.results)
        (MovieEntity(
            id: result.id,
            originalTitle: result.originalTitle,
            overview: result.overview,
            posterPath: result.posterPath ?? 'no image',
            backdropPath: result.backdropPath ?? "no poster",
            title: result.title,
            voteAverage: result.voteAverage,
            language: result.originalLanguage,
            releaseDate: result.releaseDate)),
    ];
    return results;
  }
}

@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) {
  return MovieRepositoryImpl(datasource: ref.watch(apiDatesourceProvider));
}
