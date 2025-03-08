import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:theadsclone/controller/auth_controller.dart';
import 'package:theadsclone/routes/route_names.dart';
import 'package:theadsclone/utils/app_assets_path.dart';
import 'package:theadsclone/widgets/text_input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();
  final AuthController controller = Get.put(AuthController());

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Form(
            key: _key,
            child: Column(
              spacing: 16.0,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssetsPath.appLogo,
                  height: 60,
                  width: 60,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    spacing: 4,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Register',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          )),
                      Text(
                        'Welcome to threads Clone app',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                TextInputField(
                  hintText: 'Enter your name',
                  labelText: 'Name',
                  controller: _nameTEController,
                  validatorCallback: ValidationBuilder()
                      .required()
                      .minLength(3)
                      .maxLength(50)
                      .build(),
                ),
                TextInputField(
                  hintText: 'Enter your email address',
                  labelText: 'Email',
                  controller: _emailTEController,
                  validatorCallback:
                      ValidationBuilder().required().email().build(),
                ),
                TextInputField(
                  isPasswordField: true,
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  controller: _passwordTEController,
                  validatorCallback: ValidationBuilder()
                      .required()
                      .minLength(6)
                      .maxLength(20)
                      .build(),
                ),
                TextInputField(
                  isPasswordField: true,
                  hintText: 'Enter your confirm password',
                  labelText: 'confirm Password',
                  controller: _confirmPasswordTEController,
                  validatorCallback: (arg) {
                    if (_passwordTEController.text != arg) {
                      return 'confirm password does not matched';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 4.0),
                Obx(
                  () => ElevatedButton(
                      onPressed: _registerBtn,
                      child: Text(
                        controller.registerLoading.value
                            ? 'Processing..'
                            : 'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      )),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(RouteNames.loginScreen)),
                ], text: "Already have an account? "))
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _registerBtn() {
    if (_key.currentState!.validate()) {
      controller.registration(
        _nameTEController.text,
        _emailTEController.text,
        _passwordTEController.text,
      );
    }
  }
}
