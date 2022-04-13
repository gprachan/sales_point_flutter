import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:salespoint_flutter/api/api_provider.dart';
import 'package:salespoint_flutter/api/response_wrapper.dart';
import 'package:salespoint_flutter/common/custom_button.dart';
import 'package:salespoint_flutter/data/Prefs.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:salespoint_flutter/models/request/login_request.dart';
import 'package:salespoint_flutter/models/response/login_response.dart';
import 'package:salespoint_flutter/theme/assets.dart';
import 'package:salespoint_flutter/theme/colors.dart';
import 'package:salespoint_flutter/ui/dashboard/dashboard_page.dart';
import 'package:salespoint_flutter/utils/alert_utils.dart';
import 'package:salespoint_flutter/utils/logger.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = 'routeLoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _prefs = getIt<Prefs>();
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'vinayshrestha@yopmail.com');
  final passwordController = TextEditingController(text: 'password');
  bool showPassword = false;

  void _onLogin() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState?.validate() == true) {
      AlertUtils.showProgressDialog(context);
      LoginRequest request = LoginRequest(
        email: emailController.text,
        password: passwordController.text,
      );
      var response = await ApiProvider.post(ApiProvider.loginApi, request.toJson());
      if (response.status == ResponseWrapper.COMPLETED) {
        Navigator.pop(context);
        LoginResponse? loginResponse = LoginResponse.fromJson(response.data);
        _prefs.accessToken = loginResponse.accessToken;
        _prefs.loginData = loginResponse;
        Navigator.pushReplacementNamed(context, DashboardPage.routeName);
      } else {
        Navigator.pop(context);
        AlertUtils.showSnackBar(
          context,
          response.message,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 130),
                Lottie.asset(
                  AppAssets.loginLottie,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Login to continue',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty == true) {
                      return 'Email is required!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(
                        showPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty == true) {
                      return 'Password is required!';
                    }
                    return null;
                  },
                  obscureText: showPassword,
                ),
                const SizedBox(height: 16),
                CustomButton(
                  onClick: _onLogin,
                  label: 'LOGIN',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
