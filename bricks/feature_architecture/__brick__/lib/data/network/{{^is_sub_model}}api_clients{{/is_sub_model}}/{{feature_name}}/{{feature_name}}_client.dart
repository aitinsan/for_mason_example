import 'dart:async';

import 'package:{{project_name}}/data/network/dto/{{feature_name}}/{{feature_name}}_response.dart';
import 'package:{{project_name}}/internal/config/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:retrofit/retrofit.dart';

part '../../../../generated/data/network/api_clients/{{feature_name}}/{{feature_name}}_client.g.dart';

@RestApi()
abstract class {{feature_name.pascalCase()}}Client {
  factory {{feature_name.pascalCase()}}Client() {
    Dio dio = Modular.get();
    return _{{feature_name.pascalCase()}}Client(dio, baseUrl: Config.apiUrl);
  }
  @GET("/{{feature_name.pascalCase()}}")
  Future<{{feature_name.pascalCase()}}Response> get{{feature_name.pascalCase()}}();
}
