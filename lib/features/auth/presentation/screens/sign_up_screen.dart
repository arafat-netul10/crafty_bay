import 'package:crafty_bay/features/auth/data/models/sign_up_params.dart';
import 'package:crafty_bay/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/show_snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../shared/presentation/utils/validators.dart';
import '../../../shared/presentation/widgets/centered_progress_indicator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = "/signUpScreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final SignUpProvider _signUpProvider = SignUpProvider();

  bool _enableButton = false;

  void _checkIfFormValid(){
    if (_formKey.currentState!.validate()) {
      _enableButton = true;
    }
    else{
      _enableButton = false;
    }
  }

  void onTapSignInButton() {
    Navigator.pop(context);
  }

  void onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    SignUpParams params = SignUpParams(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      mobileNumber: _mobileController.text.trim(),
      city: _cityController.text.trim(),
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );

    final bool isSuccess = await _signUpProvider.signUp(params);
    if (isSuccess) {
      Navigator.pushNamed(context, VerifyOTP.name);
    } else {
      showSnackBarMessage(context, _signUpProvider.errorMessage!);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _cityController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _signUpProvider,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                autovalidateMode: .onUserInteraction,
                onChanged: _checkIfFormValid,
                child: Column(
                  children: [
                    const SizedBox(height: 80), AppLogo(width: 160),
                    Text(
                      "Welcome to Crafty Bay",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Create an account to get started",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),

                    const SizedBox(height: 16),
                    //Name
                    TextFormField(
                      controller: _nameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.themeColor,
                        ),
                        labelText: "Name",
                      ),
                      validator: (String? value) =>
                          Validators().validateName(value),
                    ),
                    const SizedBox(height: 8),

                    //Email
                    TextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: AppColors.themeColor,
                        ),
                        labelText: "Email",
                      ),
                      validator: (String? value) =>
                          Validators().validateEmail(value),
                    ),
                    const SizedBox(height: 8),

                    //Mobile
                    TextFormField(
                      controller: _mobileController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone_android_outlined,
                          color: AppColors.themeColor,
                        ),
                        labelText: "Mobile Number",
                      ),
                      validator: (String? value) =>
                          Validators().validateMobile(value),
                    ),
                    const SizedBox(height: 8),

                    //City
                    TextFormField(
                      controller: _cityController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: AppColors.themeColor,
                        ),
                        labelText: "City",
                      ),
                      validator: (String? value) =>
                          Validators().validateCity(value),
                    ),
                    const SizedBox(height: 8),

                    //Password
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: AppColors.themeColor,
                        ),
                        labelText: "Password",
                      ),
                      validator: (String? value) =>
                          Validators().validatePassword(value),
                    ),
                    const SizedBox(height: 8),

                    //Confirm Password
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: AppColors.themeColor,
                        ),
                        labelText: "Confirm Password",
                      ),
                      validator: (String? value) =>
                          Validators().validateConfirmPassword(value),
                    ),
                    const SizedBox(height: 16),

                    //Sign Up Button
                    SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: Consumer<SignUpProvider>(
                        builder: (context, _,_) {
                          if(_signUpProvider.signUpInProgress){
                           return CenteredProgressIndicator();
                          }

                          return ElevatedButton(
                            onPressed: _enableButton ? onTapSignUpButton : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _enableButton == false ? Colors.grey : AppColors.themeColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              foregroundColor: Colors.white,
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ?",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        TextButton(
                          onPressed: onTapSignInButton,
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: AppColors.themeColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


