import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response_model.g.dart';
part 'register_response_model.freezed.dart';

@freezed
class RegisterResponse with _$RegisterResponse {
  @JsonSerializable(explicitToJson: true)
  const factory RegisterResponse(
      String? message,
      String? accessToken,
      ) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}