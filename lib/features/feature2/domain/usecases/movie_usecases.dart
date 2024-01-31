import 'package:movie_app/core/exceptions/movie/movie_exception.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/domain/repository/movie_repository.dart';

final class MovieUsecases {
  final MovieRepository repository;
  MovieUsecases({required this.repository});
  Future<List<MovieEntity>> call() async {
    try {
      return await repository.getMovies();
    } catch (e) {
      throw MovieException("Error while fetching movies");
    }
  }
}
