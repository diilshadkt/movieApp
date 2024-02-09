import 'package:movie_app/features/feature2/data/datasources/cache_datasource.dart';
import 'package:movie_app/features/feature2/data/datasources/cache_datasource_impl.dart';
import 'package:movie_app/features/feature2/data/models/objectbox_entity.model.dart';
import 'package:movie_app/features/feature2/data/models/upcoming_entity_model.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/domain/repository/objectbox_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'objectbox_repository_impl.g.dart';

class ObjectBoxRepositoryImpl implements ObjectBoxRepository {
  final CacheDatasource datasource;
  ObjectBoxRepositoryImpl({required this.datasource});

  @override
  void addAllMovies(List<MovieEntity> entity) {
    final movieModel = [
      for (final movie in entity)
        ObjectBoxEntityModel(
          title: movie.title,
          movieId: movie.id,
          originalLanguage: movie.language,
          originalTitle: movie.originalTitle,
          overview: movie.overview,
          poster_path: movie.posterPath,
          backdrop_path: movie.backdropPath,
          releaseDate: movie.releaseDate,
          voteAverage: movie.voteAverage,
          voteCount: movie.voteAverage,
        )
    ];
    return datasource.addAllMovies(movieModel);
  }

  @override
  List<MovieEntity> getAllMovies() {
    final models = datasource.getAllMovies();
    return [
      for (final movieModel in models)
        MovieEntity(
          id: movieModel.id,
          originalTitle: movieModel.originalTitle ?? "",
          overview: movieModel.overview ?? '',
          posterPath: movieModel.poster_path ?? "",
          backdropPath: movieModel.backdrop_path ?? "",
          title: movieModel.title ?? "",
          releaseDate: movieModel.releaseDate!,
          language: movieModel.originalLanguage ?? "",
          voteAverage: movieModel.voteCount!,
        )
    ];
  }

  @override
  void clearAllMovies() {
    datasource.clearAllMovies();
  }

  @override
  void addUpcomingMovies(List<MovieEntity> upcomingEntity) {
    final movieModel = [
      for (final movie in upcomingEntity)
        UpcomingEntityModel(
          title: movie.title,
          movieId: movie.id,
          originalLanguage: movie.language,
          originalTitle: movie.originalTitle,
          overview: movie.overview,
          backdrop_path: movie.backdropPath,
          poster_path: movie.posterPath,
          releaseDate: movie.releaseDate,
          voteAverage: movie.voteAverage,
          voteCount: movie.voteAverage,
        )
    ];
    return datasource.addUpcomingMovies(movieModel);
  }

  @override
  void clearUpcomingMovies() {
    datasource.clearUpcomingMovies();
  }

  @override
  List<MovieEntity> getUpcomingMovies() {
    final models = datasource.getUpcomingMovies();
    return [
      for (final movieModel in models)
        MovieEntity(
            id: movieModel.id,
            originalTitle: movieModel.originalTitle ?? "",
            overview: movieModel.overview ?? '',
            posterPath: movieModel.poster_path ?? "",
            backdropPath: movieModel.backdrop_path ?? "",
            title: movieModel.title ?? "",
            releaseDate: movieModel.releaseDate!,
            language: movieModel.originalLanguage ?? "",
            voteAverage: movieModel.voteCount!)
    ];
  }
}

@riverpod
ObjectBoxRepository objectBoxRepository(ObjectBoxRepositoryRef ref) {
  return ObjectBoxRepositoryImpl(
      datasource: ref.watch(cacheDatasourceProvider));
}
