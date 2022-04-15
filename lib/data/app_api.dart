import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salespoint_flutter/models/request/create_address_request.dart';
import 'package:salespoint_flutter/models/request/create_address_response.dart';
import 'package:salespoint_flutter/models/request/create_bill_request.dart';
import 'package:salespoint_flutter/models/response/common_response.dart';
import 'package:salespoint_flutter/models/response/create_bill_response.dart';
import 'package:salespoint_flutter/models/response/school_listing_response.dart';
import 'package:salespoint_flutter/models/response/student_address_list_response.dart';
import 'package:salespoint_flutter/models/response/student_listing_response.dart';

part 'app_api.g.dart';

/// flutter pub run build_runner build --delete-conflicting-outputs
@RestApi(baseUrl: 'https://nayakitab.iwengineering.com/')
abstract class AppApiClient {
  factory AppApiClient(Dio dio, {String? baseUrl}) = _AppApiClient;

  static const _basePath = 'api';

  static const String _schoolListingApi = "$_basePath/school";
  static const String _studentListingApi = "$_basePath/students/byschoolandgrade";
  static const String _generateBillApi = "$_basePath/bill";
  static const String _createAddressId = "$_basePath/studentaddress";
  static const String _studentAddressList = "$_basePath/student/{id}/addresses";

  @GET(_schoolListingApi)
  Future<HttpResponse<List<SchoolListingResponse>>> getSchoolListing();

  @GET(_studentListingApi)
  Future<HttpResponse<StudentListingResponse>> getStudentListing(
    @Query('gradeId') int? gradeId,
    @Query('schoolId') int? schoolId,
    @Query('page') int? page,
  );

  @POST(_generateBillApi)
  Future<HttpResponse<CreateBillResponse>> generateBill(@Body() CreateBillRequest request);

  @POST(_createAddressId)
  Future<HttpResponse<CreateAddressResponse>> createStudentAddress(@Body() CreateAddressRequest request);

  @GET(_studentAddressList)
  Future<HttpResponse<StudentAddressListResponse>> getStudentAddressList(@Path('id') int? id);
}
