import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/ads/ads_model.dart';
import '../../models/ads_response/ads_response_model.dart';
import '../../models/register/register_model.dart';
import '../../models/register_response/register_response_model.dart';


part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('auth/register')
  Future<RegisterResponse> register(@Body() RegisterModel registerModel);

  @POST('ads')
  Future<AdsResponse> sendAd(@Body() AdsModel adsModel);
}
