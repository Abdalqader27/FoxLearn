import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_result.freezed.dart';

@freezed
abstract class RepoResult<T> with _$RepoResult<T> {
  const factory RepoResult.success({required T data}) = Success<T>;

  const factory RepoResult.failure({required T data}) = Failure<T>;

  const factory RepoResult.exception({required String message}) = Exception<T>;
}
