import 'package:for_mason_example/domain/models/{{feature_name}}/{{feature_name}}.dart';
import 'package:for_mason_example/domain/repository/{{feature_name}}/i_{{feature_name}}_local_repository.dart';
import 'package:for_mason_example/domain/usecases/{{feature_name}}/i_get_{{feature_name}}_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Get{{feature_name.pascalCase()}}ListUseCase implements IGet{{feature_name.pascalCase()}}ListUseCase {
  @override
  Future<List<{{feature_name.pascalCase()}}>?> call() async {
    final I{{feature_name.pascalCase()}}LocalRepository local{{feature_name.pascalCase()}}Repository =
        Modular.get();
    final {{feature_name.camelCase()}} =
        await local{{feature_name.pascalCase()}}Repository.get{{feature_name.pascalCase()}}List();
    return {{feature_name.camelCase()}};
  }
}
