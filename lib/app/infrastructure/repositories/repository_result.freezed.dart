// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'repository_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RepoResultTearOff {
  const _$RepoResultTearOff();

  Success<T> success<T>({required T data}) {
    return Success<T>(
      data: data,
    );
  }

  Failure<T> failure<T>({required T data}) {
    return Failure<T>(
      data: data,
    );
  }

  Exception<T> exception<T>({required String message}) {
    return Exception<T>(
      message: message,
    );
  }
}

/// @nodoc
const $RepoResult = _$RepoResultTearOff();

/// @nodoc
mixin _$RepoResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(T data) failure,
    required TResult Function(String message) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(T data)? failure,
    TResult Function(String message)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Failure<T> value) failure,
    required TResult Function(Exception<T> value) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    TResult Function(Exception<T> value)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoResultCopyWith<T, $Res> {
  factory $RepoResultCopyWith(
          RepoResult<T> value, $Res Function(RepoResult<T>) then) =
      _$RepoResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$RepoResultCopyWithImpl<T, $Res>
    implements $RepoResultCopyWith<T, $Res> {
  _$RepoResultCopyWithImpl(this._value, this._then);

  final RepoResult<T> _value;
  // ignore: unused_field
  final $Res Function(RepoResult<T>) _then;
}

/// @nodoc
abstract class $SuccessCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) then) =
      _$SuccessCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$SuccessCopyWithImpl<T, $Res> extends _$RepoResultCopyWithImpl<T, $Res>
    implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(Success<T> _value, $Res Function(Success<T>) _then)
      : super(_value, (v) => _then(v as Success<T>));

  @override
  Success<T> get _value => super._value as Success<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Success<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Success<T> implements Success<T> {
  const _$Success({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'RepoResult<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success<T> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $SuccessCopyWith<T, Success<T>> get copyWith =>
      _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(T data) failure,
    required TResult Function(String message) exception,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(T data)? failure,
    TResult Function(String message)? exception,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Failure<T> value) failure,
    required TResult Function(Exception<T> value) exception,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    TResult Function(Exception<T> value)? exception,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements RepoResult<T> {
  const factory Success({required T data}) = _$Success<T>;

  T get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessCopyWith<T, Success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) then) =
      _$FailureCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$FailureCopyWithImpl<T, $Res> extends _$RepoResultCopyWithImpl<T, $Res>
    implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(Failure<T> _value, $Res Function(Failure<T>) _then)
      : super(_value, (v) => _then(v as Failure<T>));

  @override
  Failure<T> get _value => super._value as Failure<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Failure<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Failure<T> implements Failure<T> {
  const _$Failure({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'RepoResult<$T>.failure(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Failure<T> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $FailureCopyWith<T, Failure<T>> get copyWith =>
      _$FailureCopyWithImpl<T, Failure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(T data) failure,
    required TResult Function(String message) exception,
  }) {
    return failure(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(T data)? failure,
    TResult Function(String message)? exception,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Failure<T> value) failure,
    required TResult Function(Exception<T> value) exception,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    TResult Function(Exception<T> value)? exception,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<T> implements RepoResult<T> {
  const factory Failure({required T data}) = _$Failure<T>;

  T get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FailureCopyWith<T, Failure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExceptionCopyWith<T, $Res> {
  factory $ExceptionCopyWith(
          Exception<T> value, $Res Function(Exception<T>) then) =
      _$ExceptionCopyWithImpl<T, $Res>;
  $Res call({String message});
}

/// @nodoc
class _$ExceptionCopyWithImpl<T, $Res> extends _$RepoResultCopyWithImpl<T, $Res>
    implements $ExceptionCopyWith<T, $Res> {
  _$ExceptionCopyWithImpl(
      Exception<T> _value, $Res Function(Exception<T>) _then)
      : super(_value, (v) => _then(v as Exception<T>));

  @override
  Exception<T> get _value => super._value as Exception<T>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(Exception<T>(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Exception<T> implements Exception<T> {
  const _$Exception({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'RepoResult<$T>.exception(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Exception<T> &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $ExceptionCopyWith<T, Exception<T>> get copyWith =>
      _$ExceptionCopyWithImpl<T, Exception<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(T data) failure,
    required TResult Function(String message) exception,
  }) {
    return exception(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(T data)? failure,
    TResult Function(String message)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Failure<T> value) failure,
    required TResult Function(Exception<T> value) exception,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    TResult Function(Exception<T> value)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class Exception<T> implements RepoResult<T> {
  const factory Exception({required String message}) = _$Exception<T>;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExceptionCopyWith<T, Exception<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
