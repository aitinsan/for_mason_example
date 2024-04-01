import 'package:fdsaf/domain/models/some_feature/some_feature.dart';

abstract class ISomeFeatureLocalRepository {
  Future<List<SomeFeature>?> getSomeFeatureList();

  Future<bool> saveSomeFeatureList(List<SomeFeature> someFeature);

  Future<bool> clearCache();
}
