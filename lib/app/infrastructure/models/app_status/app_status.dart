import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_status.freezed.dart';

@freezed
class AppStatus with _$AppStatus {
  const factory AppStatus.update() = _Update;
  const factory AppStatus.supported() = _Supported;
  const factory AppStatus.unSupported() = _UnSupported;
}
