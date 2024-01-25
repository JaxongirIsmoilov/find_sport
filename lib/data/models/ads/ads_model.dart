import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ads_model.g.dart';

part 'ads_model.freezed.dart';

@freezed
class AdsModel with _$AdsModel {
  @JsonSerializable(explicitToJson: true)
  const factory AdsModel(
      String? title,
      String? description,
      double? lot,
      double? lat,
      ) = _AddsModel;

  factory AdsModel.fromJson(Map<String, dynamic> json) =>
      _$AdsModelFromJson(json);
}