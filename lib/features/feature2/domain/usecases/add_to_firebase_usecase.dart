import 'package:movie_app/core/exceptions/base_exception.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
import 'package:movie_app/features/feature2/domain/repository/firebase_repository.dart';

final class AddToFirebaseUsecase {
  final FirebaseRepository repository;
  AddToFirebaseUsecase({required this.repository});

  Future<void> call(MovieEntity entity) async {
    try {
      await repository.addToFireStore(entity);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
