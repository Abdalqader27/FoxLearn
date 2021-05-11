import 'package:foxlearn/app/root/application/root_facade_service.dart';
import 'package:foxlearn/app/root/presentation/home/widget/courses_banks/courses/courses_container.dart';

import 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.rootService})
      : super(HomeState(
          widget: CoursesContainer(),
        ));
  final RootFacadeService rootService;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is ChangeWidgetTab) {
      // pageController.jumpToPage(event.index);
      yield HomeState(widget: event.widget);
    }
  }
}
