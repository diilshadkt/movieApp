import 'package:movie_app/core/exceptions/base_exception.dart';
import 'package:movie_app/features/feature2/domain/entities/comment_entity.dart';
import 'package:movie_app/features/feature2/domain/repository/comment_repository.dart';

class GetCommentUsecase {
  final CommentRepository repository;
  GetCommentUsecase({required this.repository});

  Stream<List<CommentEntity>> call(String id) {
    try {
      return repository.getComment(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
