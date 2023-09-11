import 'package:for_mason_example/domain/models/{{feature_name}}/{{feature_name}}.dart';

abstract class IGet{{feature_name.pascalCase()}}ListUseCase {
  Future<List<{{feature_name.pascalCase()}}>?> call();
}
