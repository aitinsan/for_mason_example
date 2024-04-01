import 'package:fdsaf/data/db/entities/some_feature/some_feature_entity.dart';
import 'package:fdsaf/domain/models/some_feature/some_feature.dart';
import 'package:smartstruct/smartstruct.dart';
import 'package:fdsaf/data/db/entities/some_feature/glossary_entity.dart';
import 'package:fdsaf/domain/models/some_feature/glossary.dart';
import 'package:fdsaf/data/db/mappers/some_feature/glossary_entity_mapper.dart';

part '../../../../generated/data/db/mappers/some_feature/some_feature_entity_mapper.mapper.g.dart';

@Mapper()
abstract class SomeFeatureEntityMapper {
  @Mapping(source: mapFromGlossary, target: "glossary")
  
  SomeFeatureEntity fromModel(SomeFeature model);
  @Mapping(source: mapToGlossary, target: "glossary")
  
  SomeFeature toModel(SomeFeatureEntity model);
}

  
  
  GlossaryEntity? mapFromGlossary(SomeFeature source) =>
    source.glossary == null
        ? null
        : GlossaryEntityMapperImpl().fromModel(source.glossary!);

  Glossary? mapToGlossary(SomeFeatureEntity source) =>
    source.glossary == null
        ? null
        : GlossaryEntityMapperImpl().toModel(source.glossary!);
  
