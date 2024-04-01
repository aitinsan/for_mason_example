import 'package:json_annotation/json_annotation.dart';
import 'package:fdsaf/data/network/dto/some_feature/glossary_dto.dart';

part '../../../../generated/data/network/dto/some_feature/some_feature_dto.g.dart';

@JsonSerializable()
class SomeFeatureDto {
  
  GlossaryDto? glossary;
  

  SomeFeatureDto({ 
    this.glossary,

  });
  factory SomeFeatureDto.fromJson(Map<String, dynamic> json) =>
      _$SomeFeatureDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SomeFeatureDtoToJson(this);
}
