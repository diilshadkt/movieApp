import 'package:movie_app/core/exceptions/base_exception.dart';
import 'package:movie_app/features/feature2/domain/entities/comment_entity.dart';
import 'package:movie_app/features/feature2/domain/repository/comment_repository.dart';

class AddCommentUsecase {
  final CommentRepository repository;
  AddCommentUsecase({required this.repository});
  Future<void> call(CommentEntity entity) async {
    try {
      await repository.addComment(entity);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
