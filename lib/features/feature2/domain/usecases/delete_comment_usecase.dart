import 'package:movie_app/core/exceptions/base_exception.dart';
import 'package:movie_app/features/feature2/domain/repository/comment_repository.dart';

class DeleteCommentUsecase {
  final CommentRepository repository;
  DeleteCommentUsecase({required this.repository});
  Future<void> call(String id) async {
    try {
      return await repository.deleteComment(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
