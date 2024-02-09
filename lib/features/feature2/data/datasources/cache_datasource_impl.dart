import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/object_box/object_box.dart';
import 'package:movie_app/core/object_box/upcoming_objectbox.dart';
import 'package:movie_app/features/feature2/data/datasources/cache_datasource.dart';
import 'package:movie_app/features/feature2/data/models/objectbox_entity.model.dart';
import 'package:movie_app/features/feature2/data/models/upcoming_entity_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cache_datasource_impl.g.dart';

class CacheDatasourceImpl implements CacheDatasource {
  final movieBox = ObjectBoxStore.instance.box;
  final upcomingBox = UpcomingObjectBoxStore.instance.box;

  @override
  void addAllMovies(List<ObjectBoxEntityModel> entity) async {
    final dio = Dio(BaseOptions(baseUrl: ApiConstants.imageBasePath));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cahced_images';
    for (final movie in entity) {
      final posterPathLocation = '$cacheDirectory${movie.poster_path}';
      final backdropPathLocation = '$cacheDirectory${movie.backdrop_path}';

      await dio.download(movie.poster_path!, posterPathLocation);
      await dio.download(movie.backdrop_path!, backdropPathLocation);

      movie.poster_path = posterPathLocation;
      movie.backdrop_path = backdropPathLocation;

      movieBox.put(movie);
    }
  }

  @override
  void clearAllMovies() {
    movieBox.removeAll();
  }

  @override
  List<ObjectBoxEntityModel> getAllMovies() {
    return movieBox.getAll();
  }

  @override
  void addUpcomingMovies(List<UpcomingEntityModel> upcomingEntity) async {
    final dio = Dio(BaseOptions(baseUrl: ApiConstants.imageBasePath));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cahced_images';
    for (final movie in upcomingEntity) {
      final posterPathLocation = '$cacheDirectory${movie.poster_path}';
      final backdropPathLocation = '$cacheDirectory${movie.backdrop_path}';

      await dio.download(movie.poster_path!, posterPathLocation);
      await dio.download(movie.backdrop_path!, backdropPathLocation);

      movie.poster_path = posterPathLocation;
      movie.backdrop_path = backdropPathLocation;

      upcomingBox.put(movie);
    }
  }

  @override
  void clearUpcomingMovies() {
    upcomingBox.removeAll();
  }

  @override
  List<UpcomingEntityModel> getUpcomingMovies() {
    return upcomingBox.getAll();
  }
}

@riverpod
CacheDatasource cacheDatasource(CacheDatasourceRef ref) {
  return CacheDatasourceImpl();
}
