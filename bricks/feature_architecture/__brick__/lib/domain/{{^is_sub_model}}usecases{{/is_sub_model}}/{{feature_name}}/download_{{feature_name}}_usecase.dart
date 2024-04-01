import 'package:{{project_name}}/domain/repository/{{feature_name}}/i_{{feature_name}}_local_repository.dart';
import 'package:{{project_name}}/domain/repository/{{feature_name}}/i_{{feature_name}}_repository.dart';
import 'package:{{project_name}}/domain/usecases/{{feature_name}}/i_download_{{feature_name}}_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Download{{feature_name.pascalCase()}}ListUseCase
    implements IDownload{{feature_name.pascalCase()}}ListUseCase {
  @override
  Future<void> call() async {
    final I{{feature_name.pascalCase()}}Repository {{feature_name.camelCase()}}Repository =
        Modular.get();
    final {{feature_name.camelCase()}} = await {{feature_name.camelCase()}}Repository.get{{feature_name.pascalCase()}}List();
    if ({{feature_name.camelCase()}} != null) {
      I{{feature_name.pascalCase()}}LocalRepository local{{feature_name.pascalCase()}}Repository =
          Modular.get();
      local{{feature_name.pascalCase()}}Repository.save{{feature_name.pascalCase()}}List({{feature_name.camelCase()}});
    }
  }
}
