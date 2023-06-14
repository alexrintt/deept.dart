import 'package:dio/dio.dart';

import '../utils.dart';

ResponseBody createNdjsonResponse() {
  return ResponseBody(
    createSimulatedNdjsonUsingMockDir('test/responses/google'),
    200,
  );
}

ResponseBody createErrorJsonResponse() {
  return ResponseBody.fromBytes(<int>[], 422);
}

Map<String, dynamic> createSuccessJsonResponse() {
  return createSimulatedJsonUsingMockFile(
    'test/responses/google/success.json',
  );
}
