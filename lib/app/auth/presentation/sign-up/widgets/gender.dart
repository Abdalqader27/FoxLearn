import 'package:flutter/material.dart';
import 'package:foxlearn/app/auth/presentation/sign-in/widgets/radio-button.dart';

///return row contain two button , female and male
class ItemGenderOptions extends StatelessWidget {
  final bool gender;
  final onMaleButton;
  final onFemaleButton;

  const ItemGenderOptions({Key? key, required this.gender, this.onMaleButton, this.onFemaleButton})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RadioButton(
          myGender: false,
          selectedGender: gender,
          title: "ذكر",
          onPressed: onMaleButton,
        ),
        RadioButton(
          myGender: true,
          selectedGender: gender,
          title: "أنثى",
          onPressed: onFemaleButton,
        ),
      ],
    );
  }
}

class GenderRadioButton extends StatelessWidget {
  final onFemaleButton, onMaleButton;
  final bool currentGender;
  const GenderRadioButton(
      {Key? key, this.onFemaleButton, this.onMaleButton, required this.currentGender})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ItemGenderOptions(
        gender: currentGender, onFemaleButton: onFemaleButton, onMaleButton: onMaleButton);
  }
}
