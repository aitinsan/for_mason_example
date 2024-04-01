import 'package:fdsaf/domain/models/some_feature/some_feature.dart';
import 'package:fdsaf/domain/repository/some_feature/i_some_feature_local_repository.dart';
import 'package:fdsaf/domain/usecases/some_feature/i_get_some_feature_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GetSomeFeatureListUseCase implements IGetSomeFeatureListUseCase {
  @override
  Future<List<SomeFeature>?> call() async {
    final ISomeFeatureLocalRepository localSomeFeatureRepository =
        Modular.get();
    final someFeature =
        await localSomeFeatureRepository.getSomeFeatureList();
    return someFeature;
  }
}
