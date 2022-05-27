import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salespoint_flutter/api/api_provider.dart';
import 'package:salespoint_flutter/models/response/school_listing_response.dart';


part 'helper_api.g.dart';

/// flutter pub run build_runner build --delete-conflicting-outputs
@RestApi(baseUrl: ApiProvider.baseUrl)
abstract class HelperApiClient {
  factory HelperApiClient(Dio dio, {String? baseUrl}) = _HelperApiClient;

  static const _basePath = 'api';

  static const String _schoolListingApi = "$_basePath/school";

  @GET(_schoolListingApi)
  Future<HttpResponse<List<SchoolListingResponse>>> getSchoolListing();

}
