import 'package:crafty_bay/features/auth/presentation/providers/verify_otp_provider.dart';
import 'package:crafty_bay/features/home/presentation/screens/home_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../shared/presentation/widgets/centered_progress_indicator.dart';
import '../../../shared/presentation/widgets/show_snackbar_message.dart';
import '../../data/models/verify_otp_params.dart';
import '../providers/otp_timer_provider.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  static const String name = "/verifyOTP";
  final String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final PinInputController _oTPController = PinInputController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final OtpTimerProvider _otpTimerProvider = OtpTimerProvider(60);

  final VerifyOtpProvider _verifyOtpProvider = VerifyOtpProvider();



  @override
  void initState() {
    // TODO: implement initState
    _otpTimerProvider.startTimer();
    super.initState();
  }

  void onTapVerifyButton() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, HomeScreen.name);
    }
  }

  Future<void> _verifyOtp () async {
    final bool isSuccess = await _verifyOtpProvider.verifyOtp(
      VerifyOtpParams(
        email: _oTPController.text,
        otp: _oTPController.text,
      ),
    );
  if(isSuccess){
    Navigator.pushNamed(context, HomeScreen.name);
  }
  else{
    showSnackBarMessage(context, _verifyOtpProvider.errorMessage!);
  }

  }

  void onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  void onTapResendButton() {
    _otpTimerProvider.startTimer();
  }

  @override
  void dispose() {
    _oTPController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _otpTimerProvider),
        ChangeNotifierProvider.value(value: _verifyOtpProvider),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                autovalidateMode: .onUserInteraction,
                onChanged: () {},
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    AppLogo(width: 160),
                    Text(
                      "OTP Verification",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Enter your OTP to verify your account",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),

                    const SizedBox(height: 16),
                    MaterialPinField(
                      pinController: _oTPController,
                      length: 4,
                      onCompleted: (pin) => print('PIN: $pin'),
                      onChanged: (value) => print('Changed: $value'),
                      keyboardType: .number,
                      theme: MaterialPinTheme(
                        shape: MaterialPinShape.outlined,
                        borderColor: AppColors.themeColor,
                        fillColor: Colors.transparent,
                        focusedBorderColor: AppColors.themeColor,
                        focusedFillColor: Colors.transparent,
                        filledFillColor: Colors.transparent,
                        filledBorderColor: AppColors.themeColor,
                        completeFillColor: AppColors.themeColor,

                        borderWidth: 2,
                        cellSize: Size(56, 64),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    const SizedBox(height: 16),
                    SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: Consumer(
                        builder: (context, _, _) {
                          if (_verifyOtpProvider.verifyOtpInProgress) {
                            return CenteredProgressIndicator();
                          }

                          return ElevatedButton(
                            onPressed: onTapVerifyButton,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              backgroundColor: AppColors.themeColor,
                              foregroundColor: Colors.white,
                            ),
                            child: Text(
                              "Verify OTP",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }
                      ),
                    ),
                    const SizedBox(height: 26),

                    Consumer<OtpTimerProvider>(
                      builder: (context, _, _) {
                        if (_otpTimerProvider.secondsLeft == 0) {
                          return TextButton(
                            onPressed: onTapResendButton,
                            child: Text(
                              "Resend OTP",
                              style: TextStyle(color: AppColors.themeColor),
                            ),
                          );
                        } else {
                          return RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(text: "Resend OTP after "),
                                TextSpan(
                                  text: "${_otpTimerProvider.secondsLeft}s",
                                  style: TextStyle(color: AppColors.themeColor),
                                ),
                              ],
                            ),
                          );
                        }
                      },
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
