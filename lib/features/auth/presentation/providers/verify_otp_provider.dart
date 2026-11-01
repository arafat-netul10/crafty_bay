import 'package:flutter/material.dart';
import 'package:crafty_bay/app/get_network_caller.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network_caller/network_caller.dart';
import 'package:crafty_bay/features/auth/data/models/verify_otp_params.dart';



class VerifyOtpProvider extends ChangeNotifier {
  bool _verifyOtpInProgress = false;

  bool get verifyOtpInProgress => _verifyOtpInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> verifyOtp(VerifyOtpParams params) async {
    bool isSuccess = false;
    _verifyOtpInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.verifyOtpUrl(params.email, params.otp),
      body: params.toJson(),
    );
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _verifyOtpInProgress = true;
    notifyListeners();

    return isSuccess;

  }
}
