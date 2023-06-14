import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart' hide Headers;

import '../../deept_client_dio.dart';

part 'google_service_dio.g.dart';

/// {@template google}
/// https://deep-translator-api.azurewebsites.net/docs#/default/google_translate_google__post
/// {@endtemplate}
@RestApi()
abstract class GoogleServiceDio implements GoogleService {
  factory GoogleServiceDio(Dio dio) => _GoogleServiceDio._(dio, dio);

  factory GoogleServiceDio.create({
    String? accessToken,
    String baseUrl = kDefaultDeepTranslatorBaseUrl,
  }) =>
      GoogleServiceDio(
        createDeepTranslatorDioClientWith(
          accessToken: accessToken,
          baseUrl: baseUrl,
        ),
      );

  const GoogleServiceDio._(this.dio);

  /// Dio client linked with this service instance.
  final Dio dio;

  /// Use google translator to translate a text.
  ///
  /// - [source] language to translate from.
  /// - [target] target language to translate to.
  /// - [text] text you want to translate.
  /// - [proxies] proxies you want to use (optional).
  ///
  /// https://deep-translator-api.azurewebsites.net/docs#/default/google_translate_google__post
  @POST('/google/')
  Future<TranslationResponse> translate(
    String text, {
    required String target,
    String? source,
    List<String>? proxies,
  }) async {
    final Response<dynamic> response = await dio.post(
      '/google/',
      data: <String, dynamic>{
        'text': text,
        'target': target,
        'source': source ?? 'auto',
        'proxies': proxies,
      },
      options: createJsonDioOptions(),
    );

    return TranslationResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Close the [dio] instance associated with this service instance.
  ///
  /// Note that you will not be able to use other service that uses this same [dio] instance.
  @override
  Future<void> close({bool force = false}) async => dio.close(force: force);
}
