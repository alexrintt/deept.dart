import 'package:dio/dio.dart';

import '../deept_client_dio.dart';

const String kDefaultDeepTranslatorBaseUrl =
    'https://deep-translator-api.azurewebsites.net';

class DeepTranslatorClientDio extends DeepTranslatorClient {
  DeepTranslatorClientDio(this.dio);

  factory DeepTranslatorClientDio.create({
    String baseUrl = kDefaultDeepTranslatorBaseUrl,
  }) =>
      DeepTranslatorClientDio(
        createDeepTranslatorDioClientWith(baseUrl: baseUrl),
      );

  final Dio dio;

  GoogleServiceDio? _google;

  /// {@macro account}
  @override
  GoogleServiceDio get google => _google ??= GoogleServiceDio(dio);

  /// Call [close] on the [dio] instance associated with this client.
  @override
  Future<void> close({bool force = false}) async => dio.close(force: force);
}
