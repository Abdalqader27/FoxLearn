import 'package:foxlearn/app/infrastructure/models/intro_model.dart';
import 'package:foxlearn/resources/values/paths.dart';

class IntroLocalDataProvider {
  List<IntroModel> _listItem = [
    IntroModel(
        id: 1,
        title: "منصة تعليمية ",
        image: AppPaths.intro1,
        description:
            "يحتوى على مجموعة متنوعة من الأنشطة التفاعلية\n\لجميع طلاب الجامعات في سوريا \n"),
    IntroModel(
        id: 2,
        title: "تحفيزات",
        image: AppPaths.intro2,
        description: "التطبيق غني "
            "بلمعلومات  "
            "والمناهج الدراسية بلإضافة إلى اختبارات وترتيبات وجوائز"),
    IntroModel(
        id: 3,
        title: "منوعات",
        image: AppPaths.intro3,
        description: "وفيديوهات وألعاب "
            "تفاعلية مع مختلف الموادِّ وحتى المهارات التنفيذية كالتركيز والذاكرة والمنطق والمشاعر وحل المشاكل"),
  ];

  List<IntroModel> getIntroItems() => _listItem;

  IntroModel getItemById(int id) {
    return _listItem[id];
  }
}
