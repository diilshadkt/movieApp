import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies();
  Future<List<MovieEntity>> upcomingMovies();
  Future<List<MovieEntity>> searchMovies(String text);
}
