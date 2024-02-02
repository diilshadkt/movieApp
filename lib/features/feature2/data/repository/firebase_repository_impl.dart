import 'package:movie_app/features/feature2/data/datasources/firebase_datasource.dart';
import 'package:movie_app/features/feature2/data/datasources/firebase_datasource_impl.dart';
import 'package:movie_app/features/feature2/data/models/firestore_model.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/domain/repository/firebase_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_repository_impl.g.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FireBaseDataSource dataSource;
  FirebaseRepositoryImpl({required this.dataSource});

  @override
  Future<void> addToFireStore(MovieEntity entity) async {
    final model = FireStoreModel(
        id: entity.id,
        originalTitle: entity.originalTitle,
        overview: entity.overview,
        posterPath: entity.posterPath,
        title: entity.title,
        releaseDate: entity.releaseDate,
        language: entity.language,
        voteAverage: entity.voteAverage);
    await dataSource.addToFireStore(model);
  }

  @override
  Future<void> deleteFromFireStore(String id) async {
    await dataSource.deleteFromFireStore(id);
  }

  @override
  Stream<List<MovieEntity>> getFromFireStore() async* {
    final querySnapshot = dataSource.getFromFireStore();
    await for (final doc in querySnapshot) {
      final data = doc.docs;
      yield [
        for (final model in data)
          MovieEntity(
              id: model.data().id,
              originalTitle: model.data().originalTitle,
              overview: model.data().overview,
              posterPath: model.data().posterPath,
              title: model.data().title,
              releaseDate: model.data().releaseDate,
              language: model.data().language,
              voteAverage: model.data().voteAverage),
      ];
    }
  }
}

@riverpod
FirebaseRepository firebaseRepository(FirebaseRepositoryRef ref) {
  return FirebaseRepositoryImpl(
      dataSource: ref.watch(fireBaseDataSourceProvider));
}
