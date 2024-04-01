import 'dart:async';

import 'package:fdsaf/data/network/dto/some_feature/some_feature_response.dart';
import 'package:fdsaf/internal/config/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:retrofit/retrofit.dart';

part '../../../../generated/data/network/api_clients/some_feature/some_feature_client.g.dart';

@RestApi()
abstract class SomeFeatureClient {
  factory SomeFeatureClient() {
    Dio dio = Modular.get();
    return _SomeFeatureClient(dio, baseUrl: Config.apiUrl);
  }
  @GET("/SomeFeature")
  Future<SomeFeatureResponse> getSomeFeature();
}
