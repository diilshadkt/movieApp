import 'package:movie_app/core/exceptions/movie/movie_exception.dart';
import 'package:movie_app/core/utils/network_utils.dart';
import 'package:movie_app/features/feature2/data/models/upcoming_entity_model.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/domain/repository/movie_repository.dart';
import 'package:movie_app/features/feature2/domain/repository/objectbox_repository.dart';

final class UpcomingMovieUsecases {
  final MovieRepository repository;
  final ObjectBoxRepository localrepo;
  UpcomingMovieUsecases({required this.repository, required this.localrepo});
  Future<List<MovieEntity>> call() async {
    final result = await NetworkUtils.hasNetwork();
    try {
      if (result) {
        final datafromApi = await repository.upcomingMovies();
        localrepo.clearUpcomingMovies();
        localrepo.addUpcomingMovies(datafromApi);
        return datafromApi;
      } else {
        final datafromlocal = localrepo.getUpcomingMovies();
        return datafromlocal;
      }
    } catch (e) {
      throw MovieException("Error while fetching movies");
    }
  }
}
