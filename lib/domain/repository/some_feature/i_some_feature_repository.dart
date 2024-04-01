import 'package:fdsaf/domain/models/some_feature/some_feature.dart';

abstract class ISomeFeatureRepository {
  Future<List<SomeFeature>?> getSomeFeatureList();
}
