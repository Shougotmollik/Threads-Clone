import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:theadsclone/routes/route_names.dart';
import 'package:theadsclone/utils/app_assets_path.dart';
import 'package:theadsclone/widgets/text_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
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
                      Text('Login',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          )),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
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
                const SizedBox(height: 5.0),
                ElevatedButton(
                    onPressed: _loginBtn,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    )),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(RouteNames.signUpScreen)),
                ], text: "Don't have an account? "))
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _loginBtn() {
    if (_key.currentState!.validate()) {
      print('all okay in login');
    }
  }
}
