import 'package:fdsaf/data/network/dto/some_feature/some_feature_dto.dart';
import 'package:fdsaf/domain/models/some_feature/some_feature.dart';
import 'package:smartstruct/smartstruct.dart';
import 'package:fdsaf/data/network/dto/some_feature/glossary_dto.dart';
import 'package:fdsaf/domain/models/some_feature/glossary.dart';
import 'package:fdsaf/data/network/mappers/some_feature/glossary_mapper.dart';

part '../../../../generated/data/network/mappers/some_feature/some_feature_mapper.mapper.g.dart';

@Mapper()
abstract class SomeFeatureMapper {
  @Mapping(source: mapFromGlossaryDto, target: "glossary")
  
  SomeFeature toModel(SomeFeatureDto model);
}

  
  
  Glossary? mapFromGlossaryDto(SomeFeatureDto source) =>
    source.glossary == null
        ? null
        : GlossaryMapperImpl().toModel(source.glossary!);
  
