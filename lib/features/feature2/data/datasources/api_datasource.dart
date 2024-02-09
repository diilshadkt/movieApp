import 'package:movie_app/features/feature2/data/models/movie_api_model.dart';

abstract class ApiDatasource {
  Future<MovieModel> getMovies();
  Future<MovieModel> upcomingMovies();
  Future<MovieModel> searchMovies(String text);
}
