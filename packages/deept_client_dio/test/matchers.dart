import 'package:deept_client_dio/deept_client_dio.dart';
import 'package:dio/dio.dart';
import 'package:test/expect.dart';

const _IsValidNdjsonOptions isValidNdjsonOptions = _IsValidNdjsonOptions();

class _IsValidNdjsonOptions extends Matcher {
  const _IsValidNdjsonOptions();

  @override
  bool matches(Object? item, Map<dynamic, dynamic> matchState) {
    final Options ndjsonOptions = createNdjsonDioOptions();

    return item is Options &&
        item.responseType == ndjsonOptions.responseType &&
        equals(ndjsonOptions.headers).matches(item.headers, matchState) &&
        item.contentType == ndjsonOptions.contentType;
  }

  @override
  Description describe(Description description) => description
      .add('given options does not match options of [createNdjsonDioOptions]');
}

const _IsValidJsonOptions isValidJsonOptions = _IsValidJsonOptions();

class _IsValidJsonOptions extends Matcher {
  const _IsValidJsonOptions();

  @override
  bool matches(Object? item, Map<dynamic, dynamic> matchState) {
    final Options jsonOptions = createJsonDioOptions();

    return item is Options &&
        item.responseType == jsonOptions.responseType &&
        equals(jsonOptions.headers).matches(item.headers, matchState) &&
        item.contentType == jsonOptions.contentType;
  }

  @override
  Description describe(Description description) => description
      .add('given options does not match options of [createJsonDioOptions]');
}
