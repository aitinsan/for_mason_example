import 'package:fdsaf/data/network/api_clients/some_feature/some_feature_client.dart';
import 'package:fdsaf/data/network/dto/some_feature/some_feature_response.dart';
import 'package:fdsaf/data/network/mappers/some_feature/some_feature_mapper.dart';
import 'package:fdsaf/domain/models/some_feature/some_feature.dart';
import 'package:fdsaf/domain/repository/some_feature/i_some_feature_repository.dart';
import 'package:fdsaf/internal/exceptions/data_access_exception.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class SomeFeatureRepository implements ISomeFeatureRepository {
  final api = SomeFeatureClient();

  @override
  Future<List<SomeFeature>?> getSomeFeatureList() async {
    try {
      SomeFeatureResponse result = await api.getSomeFeature(); //TODO

      if (result.isError) {
        throw (DataAccessException(result.errors!));
      }

      if (result.data != null) {
        return result.data!
            .map((dto) => SomeFeatureMapperImpl().toModel(dto))
            .toList();
      }
      return null;
    } catch (e, st) {
      if (e is DioError) {
        if (e.response?.statusCode == 302) {
          throw DataAccessException('Неверный пароль');
        }
        if (e.response?.statusCode == 7) {
          throw DataAccessException('Нет соединения');
        }
      }
      rethrow;
    }
  }
}
