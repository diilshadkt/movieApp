// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_api_model.freezed.dart';
part 'movie_api_model.g.dart';

@freezed
class MovieModel with _$MovieModel {
  factory MovieModel({
    @JsonKey(name: "page") required int page,
    @JsonKey(name: "total_pages") required int totalpages,
    @JsonKey(name: "results") required List<Result> results,
    @JsonKey(name: "total_results") required int totalResult,
  }) = _MovieModel;
  factory MovieModel.fromJson(Map<String, Object?> json) =>
      _$MovieModelFromJson(json);
}

@freezed
class Result with _$Result {
  factory Result({
    @JsonKey(name: "adult") required bool adult,
    @JsonKey(name: "backdrop_path") required String? backdropPath,
    @JsonKey(name: "genre_ids") required List<int> genreIds,
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "original_language") required String originalLanguage,
    @JsonKey(name: "original_title") required String originalTitle,
    @JsonKey(name: "overview") required String overview,
    @JsonKey(name: "popularity") required double popularity,
    @JsonKey(name: "poster_path") required String? posterPath,
    @JsonKey(name: "release_date") required DateTime releaseDate,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "video") required bool video,
    @JsonKey(name: "vote_average") required double voteAverage,
    @JsonKey(name: "vote_count") required int voteCount,
  }) = _Result;
  factory Result.fromJson(Map<String, Object?> json) => _$ResultFromJson(json);
}
