
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/features/shared/presentation/utils/validators.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = "/signInScreen";


  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onTapSignInButton(){
    if(_formKey.currentState!.validate()){
      Navigator.pushNamed(context, VerifyOTP.name);
    }

  }
  void onTapSignUpButton(){
    Navigator.pushNamed(context, SignUpScreen.name);

  }
  void onTapForgotPassword(){

  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              autovalidateMode: .onUserInteraction,
              onChanged: (){},
              child: Column(
                children: [
                 const SizedBox(height: 80), AppLogo(width: 160),
                  Text("Welcome Back", style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 6),
                  Text("Sign in with your email and password", style: Theme.of(context).textTheme.labelLarge,),

                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined, color: AppColors.themeColor,),
                      labelText: "Email",
                    ),
                    validator: (String? value) => Validators().validateEmail(value),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline, color: AppColors.themeColor,),
                      labelText: "Password"
                    ),
                    validator: (String? value) => Validators().validatePassword(value),
                  ),

                  const SizedBox(height: 16),
                  SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: onTapSignInButton,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                        backgroundColor: AppColors.themeColor,
                        foregroundColor: Colors.white
                      ),
                        child: Text("Sign In", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ?", style: Theme.of(context).textTheme.labelLarge,),
                      TextButton(onPressed: onTapSignUpButton, child: Text("Sign Up", style: TextStyle(color: AppColors.themeColor),))
                    ],
                  ),
                  TextButton(onPressed: onTapForgotPassword, child: Text("Forgot Password", style: TextStyle(color: AppColors.themeColor),)),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
