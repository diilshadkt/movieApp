import 'package:movie_app/core/exceptions/base_exception.dart';
import 'package:movie_app/features/feature2/domain/repository/firebase_repository.dart';

final class DeleteFromFirebaseUsecase {
  final FirebaseRepository repository;
  DeleteFromFirebaseUsecase({required this.repository});

  Future<void> call(String id) async {
    try {
      await repository.deleteFromFireStore(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
