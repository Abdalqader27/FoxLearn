
import 'package:foxlearn/common/helpers/functions.dart';
import 'package:rxdart/rxdart.dart';

import 'base_bloc.dart';
import 'map-preferences.dart';

class StyleMapBloc with Preferences implements BaseBloc {
  /// Subjects or StreamControllers
  final BehaviorSubject<String> _mapMode = BehaviorSubject<String>();

  /// Observables
  Stream<String> get mapMode => _mapMode.stream;

  /// Functions
  void init() async {
    final String? mapMode = await getMapMode();
    try {
      final String mapFileData =
          await Functions.getFileData('assets/$mapMode.json');
      _mapMode.sink.add(mapFileData);
    } catch (_) {
      _mapMode.sink.add('');
    }
  }

  void changeMapMode(String mode) async {
    await saveMapMode(mode);
    init();
  }

  @override
  void dispose() => _mapMode.close();
}
