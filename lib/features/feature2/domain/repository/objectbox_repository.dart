import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';

abstract class ObjectBoxRepository {
  void addAllMovies(List<MovieEntity> entity);
  void clearAllMovies();
  List<MovieEntity> getAllMovies();
  //upcoming movies
  void addUpcomingMovies(List<MovieEntity> upcomingEntity);
  void clearUpcomingMovies();
  List<MovieEntity> getUpcomingMovies();
}
