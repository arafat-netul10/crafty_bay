import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../shared/presentation/utils/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = "/signUpScreen";


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onTapSignUpButton(){
    Navigator.pushNamed(context, SignInScreen.name);

  }
  void onTapSignInButton(){
    Navigator.pop(context);
  }

  @override
  void dispose(){
    _nameController.dispose();
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
              onChanged: (){},
              child: Column(
                children: [
                  const SizedBox(height: 80), AppLogo(width: 160),
                  Text("Welcome to Crafty Bay", style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 6),
                  Text("Get started with us with your details", style: Theme.of(context).textTheme.labelLarge,),

                  const SizedBox(height: 16),
                  //Name
                  TextFormField(
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: AppColors.themeColor,),
                      labelText: "Name",
                    ),
                    validator: (String ? value){
                      if(value == null || value.isEmpty){
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),

                  //Email
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

                  //Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline, color: AppColors.themeColor,),
                        labelText: "Password"
                    ),
                    validator: (String? value) => Validators().validatePassword(value),
                  ),
                  const SizedBox(height: 8),

                  //Confirm Password
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline, color: AppColors.themeColor,),
                        labelText: "Confirm Password"
                    ),
                    validator: (String? value) => Validators().validateConfirmPassword(value),
                  ),
                  const SizedBox(height: 16),

                  //Sign Up Button
                  SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: onTapSignUpButton,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                          backgroundColor: AppColors.themeColor,
                          foregroundColor: Colors.white
                      ),
                      child: Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ?", style: Theme.of(context).textTheme.labelLarge,),
                      TextButton(onPressed: onTapSignInButton, child: Text("Sign In", style: TextStyle(color: AppColors.themeColor),))
                    ],
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
