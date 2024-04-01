import 'package:fdsaf/internal/network/basis_responce.dart';
import 'package:fdsaf/data/network/dto/some_feature/some_feature_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../../../generated/data/network/dto/some_feature/some_feature_response.g.dart';

@JsonSerializable()
class SomeFeatureResponse extends BasisResponseDto {
  List<SomeFeatureDto>? data;

  SomeFeatureResponse({
    this.data,
    bool? succeeded,
    String? message,
    String? errors,
  }) : super(succeeded: succeeded, message: message, errors: errors);

  factory SomeFeatureResponse.fromJson(Map<String, dynamic> json) =>
      _$SomeFeatureResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SomeFeatureResponseToJson(this);
}
