import 'package:foxlearn/app/root/domain/entities/root_entity.dart';
import 'package:foxlearn/app/root/domain/logic/root_logic.dart';
import 'package:foxlearn/app/root/infrastructure/repositories/root_repository.dart';

class RootFacadeService with RootLogic {
  const RootFacadeService({
    required this.repository,
  });

  final RootRepository repository;

  List<RootEntity> getRootElements() {
    return repository.getRootElements();
  }
}
