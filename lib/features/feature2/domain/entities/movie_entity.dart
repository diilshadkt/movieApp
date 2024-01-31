import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_entity.freezed.dart';

@freezed
class MovieEntity with _$MovieEntity {
  factory MovieEntity({
    required String originalTitle,
    required String overview,
    required String posterPath,
    required String title,
    required DateTime releaseDate,
    required String language,
    required double voteAverage,
  }) = _MovieEntity;
}
