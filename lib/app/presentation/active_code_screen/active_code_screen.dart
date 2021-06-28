import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foxlearn/app/api/dio_client_mixin.dart';
import 'package:foxlearn/app/infrastructure/data_sources/active_code/active_code_provider.dart';
import 'package:foxlearn/app/presentation/active_code_screen/scanner_view.dart';
import 'package:foxlearn/app/presentation/root/widgets/app_bar.dart';
import 'package:foxlearn/app/presentation/root/widgets/root_background.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';
import 'package:foxlearn/common/api_tools/dio_client.dart';
import 'package:foxlearn/common/widgets/app-button.dart';
import 'package:foxlearn/injections/_injections.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart' as URL;

import 'components/get-textField.dart';

class ActiveCodeScreen extends HookWidget with DioClientMixin {
  final TextEditingController _activeCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isKeyboardClosed = MediaQuery
        .of(context)
        .viewInsets
        .bottom == 0.0;
    final isLoading = useState(false);

    final List<Widget> textFields =
    getTextFieldItems(context, _activeCodeController);
    return Scaffold(
      // backgroundColor: AppColors.WHITE,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: Stack(
              children: [
                RootBackground(
                  marginBottom: 0.0,
                  showAppbar: false,
                ),
                Center(
                  child: ListView(
                    shrinkWrap: true,
                    //  padding: EdgeInsets.only(top: 15.0.h, left: 7.0.w, right: 7.0.w),
                    physics: BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 1.0.h,
                      ),
                      // CircleButton(
                      //   onTap: () {},
                      //   contentPadding: 15,
                      //   iconColor: AppColors.WHITE,
                      //   svgIcon: Assets.svgCamera,
                      //   width: 20,
                      //   height: 20,
                      //   backgroundColor: AppColors.PRIMARY,
                      // ),
                      //  if (!isKeyboardClosed) Spacer(),
                      ScannerView(
                        isKeyboardClosed: isKeyboardClosed,
                        onChange: (code) {
                          _activeCodeController.text = code;
                        },
                      ),
                      SizedBox(
                        height: 3.0.h,
                      ),
                      textFields[0],
                      textFields[1],
                      SizedBox(
                        height: 5.0.h,
                      ),
                      Center(
                          child: AppButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  isLoading.value = true;
                                  final suc = await ActiveCodeProvider()
                                      .activeCode(
                                      code: _activeCodeController.text);
                                  print(_activeCodeController.text);
                                  isLoading.value = false;
                                  if (suc.isRight) {
                                    _activeCodeController.clear();
                                    Get.snackbar(
                                        "تنبيه !!!", "تم تفعيل الكود بنجاح",
                                        snackPosition: SnackPosition.BOTTOM,
                                        margin: EdgeInsets.all(20),
                                        backgroundColor: AppColors.LIGHT_Red,
                                        colorText: AppColors.WHITE);
                                  }
                                }
                              },
                              buttonText: "تفعيل")),
                      SizedBox(
                        height: 3.0.h,
                      ),
                      GestureDetector(
                        onTap: () =>
                            URL.launch("https://www.telegram.me/SomeBot"),
                        child: Center(
                            child: Text(
                              "هل تحتاج مساعدة؟",
                              style: AppTextStyles.medium(),
                            )),
                      )
                    ],
                  ),
                ),
                if (isLoading.value)
                  Container(
                      color: AppColors.WHITE.withOpacity(0.5),
                      child: Center(child: LottieLoading()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
