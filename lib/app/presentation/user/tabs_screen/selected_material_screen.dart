import 'package:flutter/material.dart';
import 'package:foxlearn/common/animation/painter.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/styles.dart';

class SelectedMaterialScreen extends StatelessWidget {
  final animationController;

  const SelectedMaterialScreen({Key? key, this.animationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("SelectedMaterialScreen build ");
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: CustomPaint(
            painter: AnimatedCustomPainter(
              animationController.view,
              AppColors.LIGHT_Red,
              AppColors.primaryColor,
            ),
          ),
        ),
        ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 10),
            separatorBuilder: (_, i) => SizedBox(height: 10),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (_, i) => _item(i)),
      ],
    );
  }

  Widget _item(i) {
    return Opacity(
      opacity: .7,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        shape: AppStyles.cardStyle2,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: RadioListTile(
          title: Text("اللغات الصورية", style: TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text("مادة متخصصة بلاتومات الحتمي "),
          onChanged: (t) {},
          value: true,
          groupValue: true,
        ),
      ),
    );
  }
}
