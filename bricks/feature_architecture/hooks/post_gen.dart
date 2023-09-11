import 'dart:convert';
import 'dart:io';

import 'package:mason/mason.dart';
import 'pre_gen.dart' as pre_gen;

Future<void> run(HookContext context) async {
  await generateSubModels(context);
  final progress = context.logger.progress('build build_runner');
  final ProcessResult result = await Process.run(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: true,
  );
  if (result.exitCode == 0) {
    progress.complete();
  } else {
    progress.fail('build_runner faild to run');
  }
}

Future<void> generateSubModels(HookContext context) async {
  final logger = context.logger;

  var subModelJson = jsonDecode(context.vars['sub_models']);

  if (subModelJson is List && subModelJson.isNotEmpty) {
    for (var element in subModelJson) {
      if (element is Map<String, dynamic> &&
          logger.confirm(
            'Would you like to create \'${element['model_name']}\' model?',
            defaultValue: true,
          )) {
        final subModel = element['model'];
        print('subModel $subModel');
        final vars = {
          'feature_name': context.vars['feature_name'],
          'hive_number': logger.prompt(
              ' What is the hive number for ${element['model_name']}Entity? (ex:123)',
              defaultValue: 123),
          'jsonFile': "",
          'sub_model_name': element['model_name'],
          'json': jsonEncode(subModel),
          'is_sub_model': true,
        };
        final directory = Directory.current.path;

        List<String> folders;

        if (Platform.isWindows) {
          folders = directory.split(r'\').toList();
        } else {
          folders = directory.split('/').toList();
        }

        await pre_gen.run(context..vars = vars);

        final modelTestGen =
            await MasonGenerator.fromBrick(Brick.path('bricks/api_structure'));
        modelTestGen.generate(
            DirectoryGeneratorTarget(
              Directory(('${folders.join('/')}')),
            ),
            vars: context.vars);
        await generateSubModels(context);
      }
    }
  }
}
