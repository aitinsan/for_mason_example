import 'package:{{project_name}}/domain/repository/{{feature_name}}/i_{{feature_name}}_local_repository.dart';
import 'package:{{project_name}}/domain/usecases/{{feature_name}}/i_clear_{{feature_name}}_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Clear{{feature_name.pascalCase()}}ListUseCase implements IClear{{feature_name.pascalCase()}}ListUsecase {
  @override
  Future<bool> call() async {
    final I{{feature_name.pascalCase()}}LocalRepository local{{feature_name.pascalCase()}}Repository =
        Modular.get();
    final ready = await local{{feature_name.pascalCase()}}Repository.clearCache();
    return ready;
  }
}
