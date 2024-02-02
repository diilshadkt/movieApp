import 'package:movie_app/core/exceptions/base_exception.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/domain/repository/firebase_repository.dart';

final class GetFromFirebaseUsecase {
  final FirebaseRepository repository;
  GetFromFirebaseUsecase({required this.repository});

  Stream<List<MovieEntity>> call() {
    try {
      return repository.getFromFireStore();
    } catch (e) {
      throw BaseException("cannot get item");
    }
  }
}
