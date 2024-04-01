import 'package:fdsaf/domain/repository/some_feature/i_some_feature_local_repository.dart';
import 'package:fdsaf/domain/repository/some_feature/i_some_feature_repository.dart';
import 'package:fdsaf/domain/usecases/some_feature/i_download_some_feature_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DownloadSomeFeatureListUseCase
    implements IDownloadSomeFeatureListUseCase {
  @override
  Future<void> call() async {
    final ISomeFeatureRepository someFeatureRepository =
        Modular.get();
    final someFeature = await someFeatureRepository.getSomeFeatureList();
    if (someFeature != null) {
      ISomeFeatureLocalRepository localSomeFeatureRepository =
          Modular.get();
      localSomeFeatureRepository.saveSomeFeatureList(someFeature);
    }
  }
}
