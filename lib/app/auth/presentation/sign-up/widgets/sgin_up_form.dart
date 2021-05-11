import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foxlearn/app/auth/infrastructure/models/user_model.dart';
import 'package:foxlearn/app/auth/presentation/bloc/auth_bloc.dart';
import 'package:foxlearn/app/auth/presentation/bloc/auth_event.dart';
import 'package:foxlearn/app/auth/presentation/bloc/auth_state.dart';
import 'package:foxlearn/app/auth/presentation/sign-up/widgets/text_field_items.dart';
import 'package:foxlearn/common/widgets/app-button.dart';
import 'package:foxlearn/injections/_injections.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'indecator.dart';

class SignUpForm extends HookWidget {
  final TextEditingController? _phoneController = TextEditingController();
  final TextEditingController? _nameController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _collegeController = TextEditingController();
  final FocusNode? _phoneNode = FocusNode();
  final FocusNode? _passwordNode = FocusNode();
  final FocusNode? _emailNode = FocusNode();
  final FocusNode? _nameNode = FocusNode();
  final GlobalKey<FormState>? _formKey = GlobalKey();
  final _pageViewController = PageController(initialPage: 0);
  late final ValueNotifier<GenderCollege> genderCollege;

  @override
  Widget build(BuildContext context) {
    genderCollege = useState(GenderCollege(gender: false, selectedCollege: -1));
    List<Widget> firstItems = getEditTextsFirstPage(context,
        phoneController: _phoneController,
        phoneNode: _phoneNode,
        nameController: _nameController,
        nameNode: _nameNode,
        genderCollege: genderCollege);
    List<Widget> secondItems = getEditTextsSecondPage(context,
        emailController: _emailController,
        emailNode: _emailNode,
        passwordController: _passwordController,
        passwordNode: _passwordNode,
        collegeController: _collegeController,
        genderCollege: genderCollege);

    List<Widget> bodyPages = [
      ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: firstItems.length,
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 0.0.w),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return firstItems[index];
        },
      ),
      ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: secondItems.length,
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 0.0.w),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return secondItems[index];
        },
      ),
    ];
    final helloText = Center(
        child: Text(
      "مرحباً بك",
      style: AppTextStyles.medium(fontWeight: FontWeight.bold),
    ));
    final registerText = Center(
        child: Text(
      "يرجى تسجيل الدخول",
      style: AppTextStyles.medium(fontWeight: FontWeight.w600),
    ));
    return Form(
      key: _formKey,
      child: BlocBuilder<AuthBloc, AuthState>(
        bloc: serviceLocator<AuthBloc>(),
        builder: (BuildContext context, state) {
          if (state is LoadingState) return Center(child: CircularProgressIndicator());
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              helloText,
              SizedBox(
                height: 1.0.h,
              ),
              registerText,
              SizedBox(height: 4.0.h),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: PageView(
                    clipBehavior: Clip.antiAlias,
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageViewController,
                    onPageChanged: (int index) {},
                    children: bodyPages),
              ),
              SignUpStepper(
                indexPage: state.index!,
                pageController: _pageViewController,
                countStepper: 2,
              ),
              SizedBox(height: 2.0.h),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: AppButton(onPressed: () => onPressedPre(), buttonText: "السابق"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: AppButton(onPressed: () => onPressedNext(), buttonText: "التالي"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.0.h),
              // HaveAccountButton(onTap: () => onHaveAccount(context)),
              // SizedBox(height: 7.0.h),
            ],
          );
        },
      ),
    );
  }

  onHaveAccount(context) {
    serviceLocator<AuthBloc>().add(LogoutEvent());
  }

  onPressedNext() async {
    if (_formKey!.currentState!.validate()) {
      if (serviceLocator<AuthBloc>().state.index != 1) {
        serviceLocator<AuthBloc>().add(IncrementEvent(serviceLocator<AuthBloc>().state.index! + 1));
        _pageViewController.jumpToPage(serviceLocator<AuthBloc>().state.index! + 1);
      } else {
        if (genderCollege.value.selectedCollege == -1)
          BotToast.showText(text: 'قم بتحدد الكلية من فضلك');
        else
          serviceLocator<AuthBloc>()
            ..add(SignUpEvent(
                user: UserModel(
                    password: '',
                    phoneNumber: 1,
                    gender: false,
                    college: 1,
                    email: ',',
                    userName: '')));
      }
    }
  }

  onPressedPre() async {
    if (serviceLocator<AuthBloc>().state.index != 0) {
      serviceLocator<AuthBloc>().add(DecrementEvent(serviceLocator<AuthBloc>().state.index! - 1));
      _pageViewController.jumpToPage(serviceLocator<AuthBloc>().state.index! - 1);
      // serviceLocator<AuthBloc>()
      //   ..add((LoginEvent(
      //     UserModel(
      //         firstName: _nameController!.text,
      //         //phoneNumber: int.parse(_phoneController!.text),
      //         password: _passwordController!.text,
      //         email: ''),
      //   )));
    }
  }
}

class GenderCollege {
  bool gender;
  int selectedCollege;
  GenderCollege({required this.gender, required this.selectedCollege});
}
