import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';
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
    Response response = await dio.get(
        "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-Us&page=1&sort_by=popularity.desc");
    return MovieModel.fromJson(response.data);
  }
}

@riverpod
ApiDatasource apiDatesource(ApiDatesourceRef ref) {
  return ApiDatasourceImpl();
}
