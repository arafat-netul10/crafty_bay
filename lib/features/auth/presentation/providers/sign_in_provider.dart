import 'package:crafty_bay/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:crafty_bay/app/get_network_caller.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network_caller/network_caller.dart';
import 'package:crafty_bay/features/auth/data/models/sign_in_params.dart';



class SignInProvider extends ChangeNotifier {
  bool _signInInProgress = false;

  bool get signInInProgress => _signInInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignInParams params) async {
    bool isSuccess = false;
    _signInInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.signInUrl,
      body: params.toJson(),
    );
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      String token = response.body['data']["token"];
      UserModel userModel = UserModel.fromJson(response.body['data']["user"]);
    } else {
      _errorMessage = response.errorMessage;
    }

    _signInInProgress = true;
    notifyListeners();

    return isSuccess;

  }
}
