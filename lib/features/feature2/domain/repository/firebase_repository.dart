import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';

abstract class FirebaseRepository {
  Future<void> addToFireStore(MovieEntity entity);
  Stream<List<MovieEntity>> getFromFireStore();
  Future<void> deleteFromFireStore(String id);
}
