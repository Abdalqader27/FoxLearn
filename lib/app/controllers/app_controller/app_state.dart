import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.loggedIn() = LoggedIn;
  const factory AppState.loggedOut() = LoggedOut;
  const factory AppState.intro() = Intro;
  const factory AppState.loading() = Loading;
}
