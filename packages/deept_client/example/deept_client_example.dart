import 'dart:io';

import 'package:deept_client/deept_client.dart';

class MyCustomGoogleService implements GoogleService {
  /// A cool custom service implementation...

  @override
  void noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MyCustomDeepTranslatorClient extends DeepTranslatorClient {
  @override
  MyCustomGoogleService get google => MyCustomGoogleService();

  @override
  Future<void> close({bool force = false}) async {
    stdout.write('Because you can not download RAM.');
  }
}

void main() => _tryRunAndThrowGhostImplementation();

Future<void> _tryRunAndThrowGhostImplementation() async {
  final MyCustomDeepTranslatorClient customClient =
      MyCustomDeepTranslatorClient();
  await customClient.google.translate('Hi!', target: 'pt');
}
