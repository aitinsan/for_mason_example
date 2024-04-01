import 'package:fdsaf/data/db/entities/some_feature/some_feature_entity.dart';
import 'package:fdsaf/data/db/mappers/some_feature/some_feature_entity_mapper.dart';
import 'package:fdsaf/domain/models/some_feature/some_feature.dart';
import 'package:fdsaf/domain/repository/some_feature/i_some_feature_local_repository.dart';
import 'package:fdsaf/data/db/entities/some_feature/glossary_entity.dart';

import 'package:hive/hive.dart';

class SomeFeatureLocalRepository
    implements ISomeFeatureLocalRepository {
  SomeFeatureLocalRepository() {}
  @override
  Future<List<SomeFeature>?> getSomeFeatureList() async {
    final box =
        await Hive.openBox(123.toString());
    final entities = List<SomeFeatureEntity>.from(box.values);

    return entities
        .map((entity) => SomeFeatureEntityMapperImpl().toModel(entity))
        .toList();
  }

  @override
  Future<bool> saveSomeFeatureList(List<SomeFeature> contacts) async {
    final box =
        await Hive.openBox(123.toString());
    final entities = contacts
        .map((entity) => SomeFeatureEntityMapperImpl().fromModel(entity))
        .toList();
    await box.clear();
    box.addAll(entities);
    return true;
  }

  @override
  Future<bool> clearCache() async {
    final box =
        await Hive.openBox(123.toString());
    box.clear();
    return true;
  }
}
