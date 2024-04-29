import 'package:book_stack/constants/custom_colors.dart';
import 'package:book_stack/utils/spacers.dart';
import 'package:book_stack/widgets/authentication_screen.dart';
import 'package:book_stack/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PseudonyminputScreen extends StatefulWidget {
  static const routeName = '/PhoneinputScreen';
  const PseudonyminputScreen({super.key});

  @override
  State<PseudonyminputScreen> createState() => _PseudonyminputScreenState();
}

class _PseudonyminputScreenState extends State<PseudonyminputScreen> {
  final TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  String pseudonym = "";
  String mobileNumber = "";
  String completeMobileNumber = "";
  String password = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      resizeToAvoidBottomInset: true,
      topPadding: 35,
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      buttonText: "Create Account",
      isButtonLoading: isLoading,
      onButtonTap: () async {
        FocusScope.of(context).unfocus();
        bool? validate = formKey.currentState?.validate();
        print(validate);
        if (validate == true) {
          setState(() {
            isLoading = true;
          });
          await Future.delayed(const Duration(seconds: 2));

          setState(() {
            isLoading = false;
          });
          // Navigator.pushNamed(context, KnowYouScreen.routeName);
        }
      },
      title: "Welcome to Cozycove, buddy!",
      subTitle: "Choose a pseudonym to maintain anonymity on our platform",
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pseudonym",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: CustomColors.labelTextColor),
            ),
            verticalSpacer(15),
            customTextField(
              "streetName",
              hintText: "e.g craby_didi",
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                      errorText: 'Pseudonym cannot be empty '),
                ],
              ),
              onChanged: (value) {
                setState(() {
                  pseudonym = value!;
                });
              },
            ),
            verticalSpacer(20),
          ],
        ),
      ),
    );
  }
}
