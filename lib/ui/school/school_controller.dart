import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salespoint_flutter/api/api_provider.dart';
import 'package:salespoint_flutter/api/response_wrapper.dart';
import 'package:salespoint_flutter/data/app_api.dart';
import 'package:salespoint_flutter/di/get_it.dart';
import 'package:salespoint_flutter/models/response/school_listing_response.dart';
import 'package:salespoint_flutter/utils/logger.dart';
import 'package:salespoint_flutter/utils/response_handler.dart';

class SchoolController extends ChangeNotifier {
  final apiClient = getIt<AppApiClient>();

  SchoolController() {
    // getSchools();
    getSchoolListing();
  }

  String? _error;
  List<SchoolListingResponse>? _schools;

  String? get error => _error;

  List<SchoolListingResponse>? get schools => _schools;

  Future<void> getSchoolListing() async {
    BaseResponse<List<SchoolListingResponse>> result = await doTryCatch(() async {
      HttpResponse<List<SchoolListingResponse>> response = await apiClient.getSchooListing();
      return response.handleResponse();
    });
    if (result.error == null) {
      List<SchoolListingResponse> schoolWithGrades = List.of([]);
      result.data?.forEach((element) {
        if (element.grades != null && element.grades?.isNotEmpty == true) {
          schoolWithGrades.add(element);
        }
      });
      _schools = schoolWithGrades;
    } else {
      _error = error;
    }
    notifyListeners();
  }

  @Deprecated('This is not in use.')
  Future<void> getSchools() async {
    var response = await ApiProvider.get(ApiProvider.schoolListingApi);
    if (response.status == ResponseWrapper.COMPLETED) {
      try {
        Iterable l = jsonDecode(response.data);
        loggerE(l.toString());
        _schools = List<SchoolListingResponse>.from(l.map((model) {
          loggerE('${SchoolListingResponse.fromJson(model)}');
          if (model['grades'] != null) {
            Iterable l = jsonDecode(model['grades']);
            // grades = List<Grade>.from(l.map((e) => Grade.fromJson(e)));
          }
          return SchoolListingResponse.fromJson(model);
        }));
      } catch (e) {
        _error = 'Exception from UI $e';
      }
    } else {
      _error = response.message;
    }
    notifyListeners();
  }
}
