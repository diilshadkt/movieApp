import 'package:movie_app/core/exceptions/base_exception.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/domain/repository/movie_repository.dart';

class SearchMovieUsecase {
  final MovieRepository repository;
  SearchMovieUsecase({required this.repository});
  Future<List<MovieEntity>> call(String text) async {
    try {
      return repository.searchMovies(text);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
