import '../../data/models/ads/ads_model.dart';
import '../../data/models/ads_response/ads_response_model.dart';
import '../../data/models/register/register_model.dart';
import '../../data/models/register_response/register_response_model.dart';

abstract class AppRepository {
  Future<RegisterResponse> register(RegisterModel registerModel);
  Future<AdsResponse> sendAd(AdsModel adsModel);
}
