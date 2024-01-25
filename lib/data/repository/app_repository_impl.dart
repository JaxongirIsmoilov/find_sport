import 'package:find_sport/data/data_sources/remote/api_service.dart';
import 'package:find_sport/data/models/ads/ads_model.dart';
import 'package:find_sport/data/models/ads_response/ads_response_model.dart';
import 'package:find_sport/data/models/register/register_model.dart';
import 'package:find_sport/data/models/register_response/register_response_model.dart';
import 'package:find_sport/di/di.dart';
import 'package:find_sport/domain/repository/app_repository.dart';

class AppRepositoryImpl extends AppRepository{
  final api = getIt<ApiService>();
  @override
  Future<AdsResponse> sendAd(AdsModel adsModel) async{
   final result = await api.sendAd(adsModel);
    return result;
  }

  @override
  Future<RegisterResponse> register(RegisterModel registerModel) async{
    final result = api.register(registerModel);
    return result;
  }

}