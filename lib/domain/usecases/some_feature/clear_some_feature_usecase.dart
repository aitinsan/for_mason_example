import 'package:fdsaf/domain/repository/some_feature/i_some_feature_local_repository.dart';
import 'package:fdsaf/domain/usecases/some_feature/i_clear_some_feature_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClearSomeFeatureListUseCase implements IClearSomeFeatureListUsecase {
  @override
  Future<bool> call() async {
    final ISomeFeatureLocalRepository localSomeFeatureRepository =
        Modular.get();
    final ready = await localSomeFeatureRepository.clearCache();
    return ready;
  }
}
