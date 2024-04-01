import 'package:{{project_name}}/domain/models/{{feature_name}}/{{feature_name}}.dart';

abstract class I{{feature_name.pascalCase()}}LocalRepository {
  Future<List<{{feature_name.pascalCase()}}>?> get{{feature_name.pascalCase()}}List();

  Future<bool> save{{feature_name.pascalCase()}}List(List<{{feature_name.pascalCase()}}> {{feature_name.camelCase()}});

  Future<bool> clearCache();
}
