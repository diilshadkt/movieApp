import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/features/feature2/domain/entities/movie_entity.dart';
part 'provider_state.freezed.dart';

@freezed
class ProviderState with _$ProviderState {
  factory ProviderState({
    required List<MovieEntity> movies,
    required List<MovieEntity>? search,
  }) = _ProviderState;
}
