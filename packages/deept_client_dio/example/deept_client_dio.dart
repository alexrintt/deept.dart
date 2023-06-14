import 'dart:async';
import 'dart:io';

import 'package:deept_client_dio/deept_client_dio.dart';

Future<void> main(List<String> arguments) async {
  final DeepTranslatorClient deept = DeepTranslatorClientDio.create();

  await _displaySampleGoogleTranslatorUsage(deept);

  await deept.close();
}

Future<void> _displaySampleGoogleTranslatorUsage(
  DeepTranslatorClient deept, {
  String? text,
  String? source,
  String target = 'pt',
}) async {
  _header('deept.google.translate');

  final String original = text ?? 'Welcome to the club!';

  final TranslationResponse response =
      await deept.google.translate(original, source: source, target: target);

  _print('Original: $original');
  _print('Translation: ${response.translation}');
  _print('Error: ${response.error}');

  _footer('deept.google.translate');
}

bool _first = true;

void _header(String message) {
  stdout.writeln('${_first ? '' : '\n\n'}${'-' * 10} [$message] ${'-' * 10}');
  _first = false;
}

void _footer(String message) {
  stdout.writeln('${'-' * 10} [$message] ${'-' * 10}');
}

void _print(String message) {
  stdout.writeln(message);
}
