import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salespoint_flutter/data/app_api.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:salespoint_flutter/extensions/string_ext.dart';
import 'package:salespoint_flutter/models/create_bill_share_data.dart';
import 'package:salespoint_flutter/models/request/add_student_request.dart';
import 'package:salespoint_flutter/models/response/add_student_response.dart';
import 'package:salespoint_flutter/utils/alert_utils.dart';

import '../../common/custom_button.dart';
import '../../utils/response_handler.dart';

class AddStudentPage extends StatelessWidget {
  AddStudentPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  static const routeName = 'RouteNameAddStudentPage';
  final CreateBillShareData? data;

  final _apiClient = getIt<AppApiClient>();

  final _formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();

  void _onAddStudent(BuildContext context) async {
    if (_formKey.currentState?.validate() == true) {
      FocusManager.instance.primaryFocus?.unfocus();
      AlertUtils.showProgressDialog(context);

      AddStudentRequest request = AddStudentRequest(
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        phoneNo: phoneNumber.text,
        address: address.text,
        schoolId: data?.schoolId,
        gradeId: data?.gradeId,
      );
      BaseResponse<AddStudentResponse> result = await doTryCatch(() async {
        HttpResponse<AddStudentResponse> response = await _apiClient.addStudent(request);
        return response.handleResponse();
      });
      Navigator.pop(context);
      if (result.errorMessage == null) {
        _formKey.currentState?.reset();
        AlertUtils.showAlertDialog(
          context,
          'Student Added',
          'Student added successfully into the system',
          'Ok',
          onClick: () {},
        );
      } else {
        AlertUtils.showAlertDialog(
          context,
          'Error',
          result.errorMessage,
          'Ok',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  controller: firstName,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty == true) {
                      return 'First name is required!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: lastName,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty == true) {
                      return 'Last name is required!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty == true) {
                      return 'Email address is required!';
                    } else if (!value.isValidEmail()) {
                      return 'Invalid email address!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: phoneNumber,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Phone number',
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty == true) {
                      return 'Phone number is required!';
                    } else if (!value.isValidPhone()) {
                      return 'Invalid phone number!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: address,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    hintText: 'Address',
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty == true) {
                      return 'Address is required!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CustomButton(
                  onClick: () {
                    _onAddStudent(context);
                  },
                  label: 'ADD STUDENT',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
