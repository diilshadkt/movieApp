import 'package:movie_app/features/feature2/data/datasources/comment_datasource.dart';
import 'package:movie_app/features/feature2/data/datasources/comment_datasource_impl.dart';
import 'package:movie_app/features/feature2/data/models/comment_model.dart';
import 'package:movie_app/features/feature2/domain/entities/comment_entity.dart';
import 'package:movie_app/features/feature2/domain/repository/comment_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'comment_repository_impl.g.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDatasource datasource;
  CommentRepositoryImpl({required this.datasource});

  @override
  Future<void> addComment(CommentEntity entity) async {
    final model = CommentModel(text: entity.text, MovieId: entity.movieId);
    await datasource.addComment(model);
  }

  @override
  Stream<List<CommentEntity>> getComment(String id) async* {
    final ds = datasource.getComment(id);
    await for (final da in ds) {
      final data = da.docs;
      yield [
        for (final i in data)
          CommentEntity(
              text: i.data().text, id: i.id, movieId: i.data().MovieId)
      ];
    }
  }
}

@riverpod
CommentRepository commentRepository(CommentRepositoryRef ref) {
  return CommentRepositoryImpl(
      datasource: ref.watch(commentDatasourceProvider));
}
