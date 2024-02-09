import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/features/feature2/data/models/comment_model.dart';

abstract class CommentDatasource {
  Future<void> addComment(CommentModel model);
  Stream<QuerySnapshot<CommentModel>> getComment(String movieId);

  Future<void> deleteComment(String id);
}
