import 'package:todo_app/core/todo_library.dart';

enum HttpRequestMethod { GET, POST, DELETE, PUT, PATCH, UPLOAD, DOWNLOAD }

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
      return Uri.parse('$BASE_URL$endPoint');
    } else {
      return Uri.parse('$BASE_URL$endPoint');
    }
  }

  Future handleStreamResponse({
    required StreamedResponse response,
    required String requestAPIName,
    void Function(int)? onStatusCodeError,
    HttpResponseType responseType = HttpResponseType.JSON,
  }) async {
    printLogMessage(requestAPIName, response);

    String streamResponse = await response.stream.bytesToString();

    setValue(requestAPIName, streamResponse);
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
    HttpRequestMethod type = HttpRequestMethod.GET,
    required String endPoint,
    required Map<String, dynamic> requestBody,
    Map<String, dynamic>? headers,
    String uploadKey = '',
    String uploadFilePath = '',
    required String requestAPIName,
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
          case HttpRequestMethod.GET:
            response = await get(url, headers: headers);
            break;

          case HttpRequestMethod.POST:
            log('REQUEST --> $requestBody');
            response = await post(url, body: json.encode(requestBody), headers: headers);
            break;

          case HttpRequestMethod.DELETE:
            log('REQUEST --> $requestBody');
            response = await delete(url, body: json.encode(requestBody), headers: headers);
            break;

          case HttpRequestMethod.PUT:
            log('REQUEST --> $requestBody');
            response = await put(url, body: json.encode(requestBody), headers: headers);
            break;

          case HttpRequestMethod.PATCH:
            log('REQUEST API --> $requestBody');
            response = await patch(url, body: json.encode(requestBody), headers: headers);
            break;

          case HttpRequestMethod.UPLOAD:
            MultipartRequest request = MultipartRequest('POST', url);
            request.files.add(await MultipartFile.fromPath(uploadKey, uploadFilePath));
            request.headers.addAll(headers);
            streamedResponse = await request.send();
            break;

          case HttpRequestMethod.DOWNLOAD:
            log('please handle download request');
            return '';
        }

        return streamResponse(
          type,
          streamedResponse,
          requestAPIName,
          onStatusCodeError,
          response,
        );
      } on Exception catch (e) {
        throw e;
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
    required String requestAPIName,
    void Function(int)? onStatusCodeError,
  }) async {
    printResponse(requestAPIName, response);

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
    String requestAPIName,
    void Function(int)? onStatusCodeError,
    Response response,
  ) {
    if (type == HttpRequestMethod.UPLOAD || type == HttpRequestMethod.DOWNLOAD) {
      return handleStreamResponse(
        response: streamedResponse,
        requestAPIName: requestAPIName,
        onStatusCodeError: onStatusCodeError,
      );
    } else {
      return handleResponse(
        response: response,
        requestAPIName: requestAPIName,
        onStatusCodeError: onStatusCodeError,
      );
    }
  }
}

void printResponse(String requestAPIName, Response response) {
  log('\n____________________________________________________\n');
  log('REQUEST API --> $requestAPIName');
  log('REQUEST URL --> ${response.request?.url}');
  log('REQUEST METHOD --> ${response.request?.method}');
  log('REQUEST HEADERS --> ${response.request?.headers}');
  log('RESPONSE HEADERS --> ${response.headers}');
  log('RESPONSE STATUS CODE --> ${response.statusCode}');
  log('RESPONSE REASON PHRASE --> ${response.reasonPhrase}');
  log('RESPONSE BODY --> ${response.body}');
  log('____________________________________________________\n\n\n');
  setValue(requestAPIName, response.body);
}

void printLogMessage(String requestAPIName, StreamedResponse response) {
  log('\n____________________________________________________\n');
  log('REQUEST API --> $requestAPIName');
  log('REQUEST URL --> ${response.request?.url}');
  log('REQUEST METHOD --> ${response.request?.method}');
  log('REQUEST HEADERS --> ${response.request?.headers}');
  log('RESPONSE HEADERS --> ${response.headers}');
  log('RESPONSE STATUS CODE --> ${response.statusCode}');
  log('RESPONSE REASON PHRASE --> ${response.reasonPhrase}');
  log('____________________________________________________\n\n\n');
}
