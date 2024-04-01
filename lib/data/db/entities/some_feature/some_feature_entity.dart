import 'package:hive_flutter/hive_flutter.dart';
import 'package:fdsaf/data/db/entities/some_feature/glossary_entity.dart';

part '../../../../generated/data/db/entities/some_feature/some_feature_entity.g.dart';

@HiveType(typeId: 123)
class SomeFeatureEntity {

  
  @HiveField(0)
  final  GlossaryEntity? glossary;
  



  SomeFeatureEntity({
    
    this.glossary,
  });
}
