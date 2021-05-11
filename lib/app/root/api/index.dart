import 'package:foxlearn/app/root/application/root_facade_service.dart';
import 'package:foxlearn/app/root/domain/entities/root_entity.dart';
import 'package:foxlearn/injections/_injections.dart';

class RootApi {
  final RootFacadeService rootFacade = serviceLocator<RootFacadeService>();

  List<RootEntity> getRootElements() {
    return rootFacade.getRootElements();
  }
}
