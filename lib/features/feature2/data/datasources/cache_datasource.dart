import 'package:movie_app/features/feature2/data/models/objectbox_entity.model.dart';
import 'package:movie_app/features/feature2/data/models/upcoming_entity_model.dart';

abstract class CacheDatasource {
  void addAllMovies(List<ObjectBoxEntityModel> entity);
  void clearAllMovies();
  List<ObjectBoxEntityModel> getAllMovies();
  //upcoming movie
  void addUpcomingMovies(List<UpcomingEntityModel> upcomingEntity);
  void clearUpcomingMovies();
  List<UpcomingEntityModel> getUpcomingMovies();
}
