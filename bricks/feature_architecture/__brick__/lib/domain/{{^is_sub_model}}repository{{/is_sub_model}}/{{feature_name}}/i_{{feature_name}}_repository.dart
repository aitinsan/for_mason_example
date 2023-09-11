import 'package:for_mason_example/domain/models/{{feature_name}}/{{feature_name}}.dart';

abstract class I{{feature_name.pascalCase()}}Repository {
  Future<List<{{feature_name.pascalCase()}}>?> get{{feature_name.pascalCase()}}List();
}
