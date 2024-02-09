import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/exceptions/base_exception.dart';
import 'package:movie_app/features/feature2/data/datasources/api_datasource.dart';
import 'package:movie_app/features/feature2/data/models/movie_api_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_datasource_impl.g.dart';

class ApiDatasourceImpl implements ApiDatasource {
  static final dio = Dio();
  final token = ApiConstants.token;
  @override
  Future<MovieModel> getMovies() async {
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio.get(ApiConstants.getMoviesLink);
    return MovieModel.fromJson(response.data);
  }

  @override
  Future<MovieModel> searchMovies(String text) async {
    try {
      dio.options.headers["Autherization"] = "Bearer$token";
      Response response =
          await dio.get(ApiConstants.searchMoviesLink, queryParameters: {
        "query": text,
      });
      return MovieModel.fromJson(response.data);
    } on Exception {
      throw BaseException("error was occured");
    }
  }

  @override
  Future<MovieModel> upcomingMovies() async {
    dio.options.headers["Autherization"] = "Bearer$token";
    Response response = await dio.get(ApiConstants.upcomingMovieLink);
    return MovieModel.fromJson(response.data);
  }
}

@riverpod
ApiDatasource apiDatesource(ApiDatesourceRef ref) {
  return ApiDatasourceImpl();
}
