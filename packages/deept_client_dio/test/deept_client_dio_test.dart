import 'package:deept_client_dio/deept_client_dio.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

@GenerateNiceMocks(
  <MockSpec<Object>>[
    MockSpec<Dio>(),
  ],
)
import 'deept_client_dio_test.mocks.dart';
import 'matchers.dart';
import 'responses/google/create_response.dart' as google_service;

void main() {
  group('Google', () {
    test(
        'https://deep-translator-api.azurewebsites.net/docs#/default/google_translate_google__post',
        () async {
      final MockDio mockDio = MockDio();

      when(
        mockDio.post<Map<String, dynamic>>(
          '/google/',
          data: argThat(isMap, named: 'data'),
          options: argThat(isValidJsonOptions, named: 'options'),
        ),
      ).thenAnswer(
        (_) => Future<Response<Map<String, dynamic>>>.value(
          Response<Map<String, dynamic>>(
            requestOptions: RequestOptions(),
            data: google_service.createSuccessJsonResponse(),
          ),
        ),
      );

      final DeepTranslatorClient deept = DeepTranslatorClientDio(mockDio);

      final TranslationResponse response =
          await deept.google.translate('Welcome to the club!', target: 'pt');

      expect(response.error, isNull);
    });
  });
}
