import '../deept_client.dart';

/// Interface for this client, if you are looking for a concrete implementation
/// use [DeepTranslatorClientDio.create] from [deept_client_dio] package instead.
abstract class DeepTranslatorClient with CloseableMixin {
  const DeepTranslatorClient();

  /// {@macro google}
  GoogleService get google;
}
