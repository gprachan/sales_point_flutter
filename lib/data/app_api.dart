import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salespoint_flutter/models/response/school_listing_response.dart';

part 'app_api.g.dart';

/// flutter pub run build_runner build --delete-conflicting-outputs
@RestApi(baseUrl: 'https://nayakitab.iwengineering.com/')
abstract class AppApiClient {
  factory AppApiClient(Dio dio, {String? baseUrl}) = _AppApiClient;

  static const _basePath = 'api';

  static const String schoolListingApi = "$_basePath/school";

  static const String terms = "$_basePath/terms";

  @GET(schoolListingApi)
  Future<HttpResponse<List<SchoolListingResponse>>> getSchooListing();
}
