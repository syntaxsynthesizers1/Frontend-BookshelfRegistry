import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/screens/authentication/sign_in/sign_up_screen.dart';
import 'package:book_stack/screens/authentication/sign_in/signup_view_model.dart';
import 'package:book_stack/screens/authentication/sign_up/forgot_password_screen.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:book_stack/widgets/authentication_screen.dart';
import 'package:book_stack/widgets/custom_textfield.dart';
import 'package:book_stack/widgets/new_authentication_screen.dart';
import 'package:book_stack/widgets/new_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../dashboard/bottom_navigation_screen.dart';

class SignInScreen extends StatefulHookConsumerWidget {
  static const routeName = '/SignInScreen';
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;

  String mobileNumberDialCode = "";
  String mobileNumber = "";
  String email = "";
  String completeMobileNumber = "";
  String password = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    final signUpVM = ref.watch(signupProvider);
    return NewAuthFormWidget(
      resizeToAvoidBottomInset: false,
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      isButtonLoading: signUpVM.isLoading,
      onButtonTap: () async {
        FocusScope.of(context).unfocus();
        var validate = _formKey.currentState?.validate();

        if (validate == true) {
          _formKey.currentState?.save();

          var email =
              _formKey.currentState?.fields['email']?.value.toString().trim();
          var password = _formKey.currentState?.fields['password']?.value;

          signUpVM.signIn(email, password);
        }
        // Navigator.pushNamed(context, BottomNavigationScreen.routeName);
      },
      buttonText: "Login",
      title: "Login",
      subTitle: "Welcome back. Enter your details to continue",
      footer: Center(
        child: RichText(
          text: const TextSpan(
            text: 'Powered by ',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: CustomColors.greyBgColor),
            children: [
              TextSpan(
                text: 'Bookstack',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: CustomColors.mainBlueColor),
              ),
            ],
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Text(
                //   "Email Address",
                //   style: TextStyle(
                //     fontWeight: FontWeight.w700,
                //     fontSize: 14,
                //   ),
                // ),
                // verticalSpacer(10),
                customTextField(
                  "email",
                  hintText: "Email address",
                  prefixIcon: Icons.email,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.email(
                          errorText: 'Provided email not valid '),
                      FormBuilderValidators.required(
                          errorText: 'Email field cannot be empty '),
                    ],
                  ),
                  onChanged: (value) {
                    setState(() {
                      _formKey.currentState?.fields['email']?.validate();
                      email = value!;
                    });
                  },
                ),
                verticalSpacer(30),
                // const Text(
                //   "Password",
                //   style: TextStyle(
                //     fontWeight: FontWeight.w700,
                //     fontSize: 14,
                //   ),
                // ),
                // verticalSpacer(10),
                customTextField(
                  "password",
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: obscurePassword
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  obscureText: obscurePassword,
                  onSuffixTap: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _formKey.currentState?.fields['password']?.validate();
                      password = value!;
                      print(password);
                    });
                  },
                  validator: FormBuilderValidators.compose([
                    // FormBuilderValidators.minLength(6,
                    //     errorText:
                    //         'Good passwords are greater than 6 characters'),
                    FormBuilderValidators.required(
                        errorText: 'Password field cannot be empty '),
                  ]),
                ),
                verticalSpacer(20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ForgotPasswordScreen.routeName);
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: CustomColors.mainBlueColor,
                      ),
                    ),
                  ),
                ),
                verticalSpacer(40),
                NewCustomButton(
                  title: "Login",
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    var validate = _formKey.currentState?.validate();

                    if (validate == true) {
                      _formKey.currentState?.save();

                      var email = _formKey.currentState?.fields['email']?.value
                          .toString()
                          .trim();
                      var password =
                          _formKey.currentState?.fields['password']?.value;

                      signUpVM.signIn(email, password);

                      // signUpVM.loadBooks();
                    }
                  },
                  isLoading: signUpVM.isLoading,
                ),
                verticalSpacer(20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, SignUpScreen.routeName);
                  },
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        text: "Don't have an account ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: CustomColors.greyBgColor),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: CustomColors.mainBlueColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
