# Deep Translator for Dart

[![Pub Version](https://img.shields.io/pub/v/deeptc)](https://pub.dev/packages/deeptc) [![Pub Version](https://img.shields.io/pub/points/deeptc)](https://pub.dev/packages/deeptc)

This library provides a function that translate a given text to a given language using [Deep Translate API](https://deep-translator-api.azurewebsites.net/docs).

## Installation

```yaml
dependencies:
  deeptc: ^0.1.1
```

Import:

```dart
import 'package:deeptc/deeptc.dart';
```

## Usage

The usage is pretty straightforward:

```dart
import 'package:deeptc/deeptc.dart';

print(await translate('Hi, welcome to the club!', to: 'pt'));
// >> Oi, bem vindo ao clube!
```

Close the associated HTTP client using:

```dart
import 'package:deeptc/deeptc.dart';

print(await translate('Hi, welcome to the club!', to: 'pt'));
// >> Oi, bem vindo ao clube!

// ... HTTP connections are still alive for performance concerns.

// Dio client keep the HTTP connections alive.
// To kill any live HTTP connection call:
await closeTranslateDioClient();
```

## Contributing

TODO.
