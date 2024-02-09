import 'package:movie_app/features/feature2/domain/entities/comment_entity.dart';

abstract class CommentRepository {
  Future<void> addComment(CommentEntity entity);
  Stream<List<CommentEntity>> getComment(String id);
  Future<void> deleteComment(String id);
}
