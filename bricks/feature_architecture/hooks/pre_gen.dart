import 'dart:convert';
import 'dart:io';

import 'package:mason/mason.dart';

import 'enums/types_enum.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;
  getFile(context);
  if (context.vars['json'] is String &&
      (context.vars['json'] as String).isNotEmpty) {
    List<Map<String, dynamic>> subModels = [];
    var jsonData = jsonDecode(context.vars['json']);
    if (jsonData is Map<String, dynamic>) {
      List<Map<String, dynamic>> propertiesFromJson = [];
      List<Map<String, dynamic>> subModelsNames = [];
      jsonData.forEach((key, value) {
        bool isCustomType =
            value.runtimeType.toString().toLowerCase().contains('<') ||
                value.runtimeType.toString().toLowerCase().contains('>');
        String type = '';
        String entityType = '';
        String dtoType = '';
        bool isList = false;
        if (value.runtimeType == Null) {
          logger.warn("$key is null");
          final nullValueType = logger.chooseOne<DartTypes>(
            "What is the type of $key",
            defaultValue: DartTypes.Null,
            choices: DartTypes.values,
            display: (choice) => choice.name,
          );
          if (nullValueType == DartTypes.list ||
              nullValueType == DartTypes.model) {
            final nonNullValue = logger.prompt(
              'example values of \'$key\' $nullValueType',
              defaultValue: '',
            );
            isCustomType = true;

            final decodedJson = jsonDecode(nonNullValue);
            if (nullValueType == DartTypes.list) {
              value = [decodedJson];
            } else {
              value = decodedJson;
            }
          } else {
            type = nullValueType.name;
            entityType = type;
            dtoType = type;
          }
        }
        if (isCustomType) {
          if (value is List) {
            isList = true;
            if (value.isEmpty) {
              type = 'List<Null>';
              entityType = 'List<Null>';
              dtoType = 'List<Null>';
            } else if (value.first is Map<String, dynamic>) {
              type = 'List<${key.pascalCase}>';
              entityType = 'List<${key.pascalCase}Entity>';
              dtoType = 'List<${key.pascalCase}Dto>';

              subModelsNames.add({
                'isList': isList,
                'model_name': key.snakeCase,
              });
              subModels.add({
                "model_name": key.snakeCase,
                "model": value.first,
              });
            } else {
              type = 'List<${value.first.runtimeType.toString()}>';
              entityType = type;
              dtoType = type;
            }
          } else if (key.runtimeType is Null) {
            logger.warn(
                "$key is null $key is null$key is null$key is null$key is null$key is null$key is null$key is null$key is null");
          } else {
            type = key.pascalCase;
            entityType = '${key.pascalCase}Entity';
            dtoType = '${key.pascalCase}Dto';
            if (value is Map<String, dynamic>) {
              print('value $value');
              subModelsNames.add({
                'isList': isList,
                'model_name': key.snakeCase,
              });
              subModels.add({
                "model_name": key.snakeCase,
                "model": value,
              });
            }
          }
        } else if (value.runtimeType == Null) {
        } else {
          type = value.runtimeType.toString();
          entityType = type;
          dtoType = type;
        }
        final property = {
          'name': key,
          'type': type,
          'entity_type': entityType,
          'dto_type': dtoType,
          'index': propertiesFromJson.length,
        };
        propertiesFromJson.add(property);
      });
      if (context.vars['sub_models'] == null) {
        context.vars = {
          ...context.vars,
          'properties': propertiesFromJson,
          'sub_models': jsonEncode(subModels),
          'sub_model_list_names': subModelsNames
        };
      } else {
        context.vars = {
          ...context.vars,
          'properties': propertiesFromJson,
        };
      }
    }
  }
}

void getFile(HookContext context) {
  if (context.vars['is_sub_model'] != true) {
    print('used json file');
    final jsonFile = File(context.vars['jsonFile']);

    /// Check for json file
    if (jsonFile.existsSync()) {
      context.vars = {
        ...context.vars,
        'json': jsonFile.readAsStringSync(),
      };
    }
    context.vars = {
      ...context.vars,
      'is_sub_model': false,
    };
  }
}
