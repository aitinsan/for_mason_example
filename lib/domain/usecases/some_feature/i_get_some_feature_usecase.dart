import 'package:fdsaf/domain/models/some_feature/some_feature.dart';

abstract class IGetSomeFeatureListUseCase {
  Future<List<SomeFeature>?> call();
}
