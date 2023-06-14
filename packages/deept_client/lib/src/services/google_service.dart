import '../../deept_client.dart';

/// {@template google}
/// https://deep-translator-api.azurewebsites.net/docs#/default/google_translate_google__post
/// {@endtemplate}
abstract class GoogleService with CloseableMixin {
  /// Interface for this client.
  const GoogleService();

  /// Use google translator to translate a text.
  ///
  /// - [source] language to translate from.
  /// - [target] target language to translate to.
  /// - [text] text you want to translate.
  /// - [proxies] proxies you want to use (optional).
  ///
  /// https://deep-translator-api.azurewebsites.net/docs#/default/google_translate_google__post
  Future<TranslationResponse> translate(
    String text, {
    required String target,
    String? source,
    List<String>? proxies,
  });
}
