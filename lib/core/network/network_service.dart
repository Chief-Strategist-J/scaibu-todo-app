import 'package:todo_app/core/app_library.dart';

enum HttpRequestMethod { get, post, delete, put, patch, upload, download }

RestApi restApi = RestApiImpl();

class RestApiImpl implements RestApi {
  Map<String, String> createHeader() {
    Map<String, String> header = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    return header;
  }

  Uri createURL({required String endPoint}) {
    if (!endPoint.startsWith('http')) {
      return Uri.parse('$baseUrl$endPoint');
    } else {
      return Uri.parse('$baseUrl$endPoint');
    }
  }

  Future handleStreamResponse({
    required StreamedResponse response,
    void Function(int)? onStatusCodeError,
    HttpResponseType responseType = HttpResponseType.JSON,
  }) async {
    printLogMessage(response);

    String streamResponse = await response.stream.bytesToString();

    log('RESPONSE BODY : $streamResponse');

    if (response.statusCode.isSuccessful()) {
      if (responseType == HttpResponseType.JSON) {
        return await jsonDecode(streamResponse);
      } else {
        return await jsonDecode(streamResponse);
      }
    } else {
      throw handleErrorCode(response.statusCode, onStatusCodeError);
    }
  }

  @override
  Future request({
    HttpRequestMethod type = HttpRequestMethod.get,
    required String endPoint,
    required Map<String, dynamic> requestBody,
    Map<String, dynamic>? headers,
    String uploadKey = '',
    String uploadFilePath = '',
    void Function(int)? onStatusCodeError,
  }) async {
    if (await isNetworkAvailable()) {
      Response response = Response('', 200);
      StreamedResponse streamedResponse = StreamedResponse(Future(() => <int>[]).asStream(), 200);

      Uri url = createURL(endPoint: endPoint);

      Map<String, String> headers = createHeader();

      /// SORTING REQUEST TYPE

      try {
        switch (type) {
          case HttpRequestMethod.get:
            response = await get(url, headers: headers);
            break;

          case HttpRequestMethod.post:
            log('REQUEST --> $requestBody');
            response = await post(url, body: json.encode(requestBody), headers: headers);
            break;

          case HttpRequestMethod.delete:
            log('REQUEST --> $requestBody');
            response = await delete(url, body: json.encode(requestBody), headers: headers);
            break;

          case HttpRequestMethod.put:
            log('REQUEST --> $requestBody');
            response = await put(url, body: json.encode(requestBody), headers: headers);
            break;

          case HttpRequestMethod.patch:
            log('REQUEST API --> $requestBody');
            response = await patch(url, body: json.encode(requestBody), headers: headers);
            break;

          case HttpRequestMethod.upload:
            MultipartRequest request = MultipartRequest('POST', url);
            request.files.add(await MultipartFile.fromPath(uploadKey, uploadFilePath));
            request.headers.addAll(headers);
            streamedResponse = await request.send();
            break;

          case HttpRequestMethod.download:
            log('please handle download request');
            return '';
        }

        return streamResponse(
          type,
          streamedResponse,
          onStatusCodeError,
          response,
        );
      } catch (_) {
        rethrow;
      }

      /// Handing Response
    } else {
      throw errorInternetNotAvailable;
    }
  }

  @override
  Future handleResponse({
    required Response response,
    HttpResponseType responseType = HttpResponseType.JSON,
    void Function(int)? onStatusCodeError,
  }) async {
    printResponse(response);

    if (response.statusCode.isSuccessful()) {
      if (response.body.isEmpty) {
        return jsonDecode(response.body);
      } else {
        if (responseType == HttpResponseType.JSON) {
          return jsonDecode(response.body);
        } else if (responseType == HttpResponseType.FULL_RESPONSE) {
          return jsonDecode(response.body);
        } else if (responseType == HttpResponseType.STRING) {
          return jsonDecode(response.body);
        } else if (responseType == HttpResponseType.BODY_BYTES) {
          return jsonDecode(response.body);
        }
      }
    } else {
      if (response.body.isJson()) log(jsonDecode(response.body));
      if (response.body.isJson()) throw jsonDecode(response.body);
      throw handleErrorCode(response.statusCode, onStatusCodeError);
    }
  }

  Future<dynamic> streamResponse(
    HttpRequestMethod type,
    StreamedResponse streamedResponse,
    void Function(int)? onStatusCodeError,
    Response response,
  ) {
    if (type == HttpRequestMethod.upload || type == HttpRequestMethod.download) {
      return handleStreamResponse(
        response: streamedResponse,
        onStatusCodeError: onStatusCodeError,
      );
    } else {
      return handleResponse(
        response: response,
        onStatusCodeError: onStatusCodeError,
      );
    }
  }
}

void printResponse(Response response) {
  log('\n____________________________________________________\n');
  log('REQUEST URL --> ${response.request?.url}');
  log('REQUEST METHOD --> ${response.request?.method}');
  log('REQUEST HEADERS --> ${response.request?.headers}');
  log('RESPONSE HEADERS --> ${response.headers}');
  log('RESPONSE STATUS CODE --> ${response.statusCode}');
  log('RESPONSE REASON PHRASE --> ${response.reasonPhrase}');
  log('RESPONSE BODY --> ${response.body}');
  log('____________________________________________________\n\n\n');
}

void printLogMessage(StreamedResponse response) {
  log('\n____________________________________________________\n');
  log('REQUEST URL --> ${response.request?.url}');
  log('REQUEST METHOD --> ${response.request?.method}');
  log('REQUEST HEADERS --> ${response.request?.headers}');
  log('RESPONSE HEADERS --> ${response.headers}');
  log('RESPONSE STATUS CODE --> ${response.statusCode}');
  log('RESPONSE REASON PHRASE --> ${response.reasonPhrase}');
  log('____________________________________________________\n\n\n');
}
