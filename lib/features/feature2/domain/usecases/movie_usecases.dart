import 'package:movie_app/core/exceptions/movie/movie_exception.dart';
import 'package:movie_app/core/utils/network_utils.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/domain/repository/movie_repository.dart';
import 'package:movie_app/features/feature2/domain/repository/objectbox_repository.dart';

final class MovieUsecases {
  final MovieRepository repository;
  final ObjectBoxRepository localrepo;
  MovieUsecases({required this.repository, required this.localrepo});
  Future<List<MovieEntity>> call() async {
    bool result = await NetworkUtils.hasNetwork();
    try {
      if (result) {
        final datafromApi = await repository.getMovies();
        localrepo.clearAllMovies();
        localrepo.addAllMovies(datafromApi);
        return datafromApi;
      } else {
        final datafromlocal = localrepo.getAllMovies();
        return datafromlocal;
      }
    } catch (e) {
      throw MovieException("Error while fetching movies");
    }
  }
}
