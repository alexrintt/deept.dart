import 'package:deept_client_dio/deept_client_dio.dart';
import 'package:dio/dio.dart';

Dio? _dio;

/// Call this function if you want to shutdown the [_dio] instance associated with the [translate] method.
Future<void> closeTranslateDioClient() async {
  if (_dio != null) {
    _dio!.close(force: true);
    _dio = null;
  }
}

/// Translates a given string [text] to the target language [to].
///
/// Optionally provide the source language [from].
///
/// This is a simple function that currently uses Deep Translator API under the hood and returns the translated [String].
///
/// [Null] is returned if error.
Future<String?> translate(
  String text, {
  required String to,
  String? from,
  bool enableLogging = false,
}) async {
  _dio ??= createDeepTranslatorDioClientWith();

  if (enableLogging) {
    _dio!.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  final DeepTranslatorClientDio deept = DeepTranslatorClientDio(_dio!);

  final TranslationResponse response = await deept.google.translate(
    text,
    target: to,
    source: from,
  );

  return response.translation;
}
