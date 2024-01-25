import 'package:freezed_annotation/freezed_annotation.dart';

part 'ads_response_model.freezed.dart';
part 'ads_response_model.g.dart';


@freezed
class AdsResponse with _$AdsResponse {
  @JsonSerializable(explicitToJson: true)
  const factory AdsResponse(
      String? message
      ) = _AdsResponse;

  factory AdsResponse.fromJson(Map<String, dynamic> json) =>
      _$AdsResponseFromJson(json);
}
