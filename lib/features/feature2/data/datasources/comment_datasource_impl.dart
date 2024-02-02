import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/features/feature2/data/datasources/comment_datasource.dart';
import 'package:movie_app/features/feature2/data/models/comment_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'comment_datasource_impl.g.dart';

class CommentDatasourceImpl implements CommentDatasource {
  final db = FirebaseFirestore.instance.collection("comments").withConverter(
      fromFirestore: CommentModel.fromFirestore,
      toFirestore: (model, _) => model.toFirestore());

  @override
  Future<void> addComment(CommentModel model) async {
    await db.add(model);
  }

  @override
  Stream<QuerySnapshot<CommentModel>> getComment(String movieId) {
    return db.where("movieId", isEqualTo: movieId).snapshots();
  }
}

@riverpod
CommentDatasource commentDatasource(CommentDatasourceRef ref) {
  return CommentDatasourceImpl();
}
