import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/screens/authentication/sign_in/signup_view_model.dart';
import 'package:book_stack/screens/authentication/sign_up/forgot_password_screen.dart';
import 'package:book_stack/screens/authentication/sign_up/sign_in_screen.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:book_stack/widgets/authentication_screen.dart';
import 'package:book_stack/widgets/custom_border_button.dart';
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

class SignUpScreen extends StatefulHookConsumerWidget {
  static const routeName = '/SignUpScreen';
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;

  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool showInterests = false;

  @override
  Widget build(BuildContext context) {
    final signUpVM = ref.watch(signupProvider);
    return NewAuthFormWidget(
      resizeToAvoidBottomInset: false,
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      isButtonLoading: isLoading,
      onButtonTap: () async {
        setState(() {
          isLoading = true;
        });
        await Future.delayed(const Duration(seconds: 3));

        setState(() {
          isLoading = false;
        });
        Navigator.pushNamed(context, BottomNavigationScreen.routeName);
      },
      buttonText: "Register",
      title: showInterests ? "Select Interests" : "Register",
      subTitle: showInterests
          ? "Select up to 2 categories for personalized recommendations"
          : "Create an account to get started",
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
                Visibility(
                  visible: showInterests == true ? false : true,
                  maintainState: true,
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
                      Row(
                        children: [
                          Expanded(
                            child: customTextField(
                              "firstName",
                              hintText: "First Name",
                              prefixIcon: Icons.person,
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(
                                      errorText: 'First Name cannot be empty '),
                                ],
                              ),
                              onChanged: (value) {
                                _formKey.currentState?.fields['firstName']
                                    ?.validate();
                                // setState(() {
                                //   email = value!;
                                // });
                              },
                            ),
                          ),
                          horizontalSpacer(20),
                          Expanded(
                            child: customTextField(
                              "lastName",
                              hintText: "Surname",
                              prefixIcon: Icons.person,
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(
                                      errorText: 'Surname cannot be empty '),
                                ],
                              ),
                              onChanged: (value) {
                                _formKey.currentState?.fields['lastName']
                                    ?.validate();
                                // setState(() {
                                //   email = value!;
                                // });
                              },
                            ),
                          ),
                        ],
                      ),
                      verticalSpacer(30),
                      customTextField(
                        "email",
                        hintText: "Email address",
                        prefixIcon: Icons.email,
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.email(
                                errorText: 'Provided email not valid '),
                            FormBuilderValidators.required(
                                errorText: 'Email cannot be empty '),
                          ],
                        ),
                        onChanged: (value) {
                          _formKey.currentState?.fields['email']?.validate();
                          setState(() {
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
                          _formKey.currentState?.fields['password']?.validate();
                          setState(() {
                            password = value!;
                            print(password);
                          });
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.minLength(6,
                              errorText:
                                  'Good passwords are greater than 6 characters'),
                          FormBuilderValidators.required(
                              errorText: 'Password field cannot be empty '),
                        ]),
                      ),
                      verticalSpacer(30),
                      customTextField(
                        "confirm_password",
                        hintText: "Confirm Password",
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
                          _formKey.currentState?.fields['confirm_password']
                              ?.validate();
                          setState(() {
                            // password = value!;
                            print(password);
                          });
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.equal(password,
                              errorText: 'Passwords do not match!'),
                          // FormBuilderValidators.equalLength(password.length,
                          //     errorText: 'Passwords do not match!'),
                        ]),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  // opacity: showInterests == true ? 1 : 0,
                  visible: showInterests == true ? true : false,
                  maintainState: true,
                  child: FormBuilderFilterChip(
                    //selectedColor: Colors.pink,
                    runAlignment: WrapAlignment.end,
                    maxChips: 2,
                    runSpacing: 10,
                    spacing: 20,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    // backgroundColor: CustomColors.mainPinkColor,
                    checkmarkColor: CustomColors.greyBgColor,
                    selectedColor: CustomColors.mainBlueColor.withOpacity(0.4),

                    // labelStyle: const TextStyle(color: Colors.white),
                    elevation: 10,
                    name: 'interests',
                    options: options,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      hoverColor: Colors.white,
                      floatingLabelStyle: TextStyle(color: Colors.pink),
                      fillColor: Colors.pink,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink)),
                    ),
                  ),
                ),
                verticalSpacer(40),
                Visibility(
                  visible: showInterests == true ? false : true,
                  child: NewCustomButton(
                    title: "Continue",
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      var validate = _formKey.currentState?.validate();

                      if (validate == true) {
                        _formKey.currentState?.save();
                        setState(() {
                          firstName = _formKey
                                  .currentState?.fields['firstName']?.value
                                  .toString()
                                  .trim() ??
                              "";
                          lastName = _formKey
                                  .currentState?.fields['lastName']?.value
                                  .toString()
                                  .trim() ??
                              "";

                          email = _formKey.currentState?.fields['email']?.value
                                  .toString()
                                  .trim() ??
                              "";
                          password =
                              _formKey.currentState?.fields['password']?.value;

                          showInterests = true;
                          // isLoading = true;
                        });

                        // signUpVM.signIn(email, password);
                      }

                      // await Future.delayed(const Duration(seconds: 3));

                      // setState(() {
                      //   isLoading = false;
                      // });
                      // Navigator.pushNamed(
                      //     context, BottomNavigationScreen.routeName);
                    },
                    isLoading: isLoading,
                  ),
                ),
                Visibility(
                  visible: showInterests == true ? true : false,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomBorderButton(
                            title: "Go Back",
                            onTap: () {
                              setState(() {
                                showInterests = false;
                              });
                            }),
                      ),
                      horizontalSpacer(20),
                      Expanded(
                        child: NewCustomButton(
                          title: "Register",
                          onTap: () async {
                            setState(() {
                              // showInterests = true;
                              print(firstName);
                              print(lastName);
                              print(email);
                              print(password);
                              signUpVM.signUp(
                                firstName: firstName,
                                lastName: lastName,
                                email: email,
                                password: password,
                              );
                              // isLoading = true;
                            });
                            // await Future.delayed(const Duration(seconds: 3));

                            // setState(() {
                            //   isLoading = false;
                            // });
                            // Navigator.pushNamed(
                            //     context, BottomNavigationScreen.routeName);
                          },
                          isLoading: signUpVM.isLoading,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpacer(20),
                Visibility(
                  visible: !showInterests,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, SignInScreen.routeName);
                    },
                    child: Center(
                      child: RichText(
                        text: const TextSpan(
                          text: "Already have an account ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: CustomColors.greyBgColor),
                          children: [
                            TextSpan(
                              text: 'Sign in',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

var options = const [
  FormBuilderChipOption(value: 'Drama', child: Text('Drama')),
  FormBuilderChipOption(value: 'Fantasy', child: Text('Fantasy')),

  FormBuilderChipOption(value: 'Cooking', child: Text('Cooking')),
  FormBuilderChipOption(value: 'Mystery', child: Text('Mystery')),
  FormBuilderChipOption(value: 'Romance', child: Text('Romance')),
  FormBuilderChipOption(value: 'Self Help', child: Text('Self Help')),
  FormBuilderChipOption(value: 'Thriller', child: Text('Thriller')),
  // FormBuilderChipOption(value: 'Rugby', child: Text('Rugby')),
  // FormBuilderChipOption(value: 'Skiing', child: Text('Skiing')),
  // FormBuilderChipOption(value: 'Shooting', child: Text('Shooting')),
];
