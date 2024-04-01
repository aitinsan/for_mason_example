import 'package:{{project_name}}/domain/models/{{feature_name}}/{{feature_name}}.dart';

abstract class IGet{{feature_name.pascalCase()}}ListUseCase {
  Future<List<{{feature_name.pascalCase()}}>?> call();
}
