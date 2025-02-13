import 'package:nb_utils/nb_utils.dart';

///
Object handleErrorCode(
  final int responseCode,
  final void Function(int)? onStatusCodeError,
) {
  switch (responseCode) {
    case 300:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The request has more than one possible response.'
          ' The user agent or user should choose one of them.'
          ' (There is no standardized way of choosing one of the responses,'
          ' but HTML links to the possibilities are recommended'
          ' so the user can pick.)');
      throw Exception('Multiple Choices');
    case 301:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The URL of the requested resource has been changed permanently.'
          ' The new URL is given in the response.');
      throw Exception('Moved Permanently');
    case 302:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('This response code means that the URI of requested resource has'
          ' been changed temporarily. Further changes in the URI might be '
          'made in the future. Therefore, this same URI should be used by the '
          'client in future requests.');
      throw Exception('Found');
    case 303:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The server sent this response to direct the client to get the'
          ' requested resource at another URI with a GET request.');
      throw Exception('See Other');
    case 304:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('This is used for caching purposes. It tells the client that the'
          ' response has not been modified, so the client can continue to use'
          ' the same cached version of the response.');
      throw Exception('Not Modified');
    case 306:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('This response code is no longer used; it is just reserved.'
          ' It was used in a previous version of the HTTP/1.1 specification.');
      throw Exception('unused');
    case 307:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The server sends this response to direct the client to get the'
          ' requested resource at another URI with the same method that was'
          ' used in the prior request. This has the same semantics as the 302'
          ' Found HTTP response code, with the exceptions that the user agent'
          ' must not change the HTTP method used: if a POST was used in the'
          ' first request, a POST must be used in the second request.');
      throw Exception('Temporary Redirect');
    case 308:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('This means that the resource is now permanently '
          'located at another URI,'
          ' specified by the Location: HTTP Response header. This has the same '
          'semantics as the 301 Moved Permanently HTTP response code,'
          ' with the exceptions'
          ' that the user agent must not change the HTTP method used:'
          ' if a POST was used '
          'in the first request, a POST must be used in the second request.');
      throw Exception('Permanent Redirect');
    case 400:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The server cannot or will not process the request due to something '
          'that'
          ' is perceived to be a client error (e.g., malformed request syntax,'
          ' invalid request message framing, or deceptive request routing)');
      throw Exception('Bad Request');
    case 401:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('Although the HTTP standard specifies "unauthorized",'
          ' semantically this response means "unauthenticated".'
          ' That is, the client must authenticate itself to get the '
          'requested response.');
      throw Exception('Unauthorized');
    case 402:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('This response code is reserved for future use. '
          'The initial aim for creating this code was using it'
          ' for digital payment systems, however this status code '
          'is used very rarely and no standard convention exists.');
      throw Exception('Payment Required');
    case 403:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The client does not have access rights to the content; that is, '
          'it is unauthorized, '
          'so the server is refusing to give the requested resource.'
          " Unlike 401 Unauthorized, the client's identity is known "
          'to the server.');
      throw Exception('Forbidden');
    case 404:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The server cannot find the requested resource. In the browser,'
          ' this means the URL is not recognized. In an API, this can also'
          ' mean that the endpoint is valid but the resource itself does not'
          ' exist. Servers may also send this response instead of 403 Forbidden'
          ' to hide the existence of a resource from an unauthorized client.'
          ' This response code is probably the most well known due to its'
          ' frequent occurrence on the web.');
      throw Exception('Not Found');
    case 405:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The request method is known by the server but is not supported'
          ' by the target resource. For example, an API may not allow calling'
          ' DELETE to remove a resource.');
      throw Exception('Method Not Allowed');
    case 406:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }

      throw Exception('Not Acceptable');
    case 407:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('This is similar to 401 Unauthorized but authentication is needed '
          'to be done by a proxy.');
      throw Exception('Proxy Authentication Required');
    case 408:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('This response is sent on an idle connection by some servers,'
          ' even without any previous request by the client. It means that'
          ' the server would like to shut down this unused connection. This'
          ' response is used much more since some browsers, like Chrome, '
          'Firefox 27+,'
          ' or IE9, use HTTP pre-connection mechanisms to speed up surfing. '
          'Also note '
          'that some servers merely shut down the connection without '
          'sending this message.');
      throw Exception('Request Timeout');
    case 409:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('This response is sent when a request conflicts '
          'with the current state of the server.');
      throw Exception('Conflict');
    case 410:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }

      throw Exception('Gone');
    case 411:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('Server rejected the request because the Content-Length header field '
          'is not defined and the server requires it.');
      throw Exception('Length Required');
    case 412:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The client has indicated preconditions in its headers'
          ' which the server does not meet.');
      throw Exception('Precondition Failed');
    case 413:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('Request entity is larger than limits defined by server.'
          ' The server might close'
          ' the connection or throw an Retry-After header field.');
      throw Exception('Payload Too Large');
    case 414:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The URI requested by the client is longer than the '
          'server is willing to interpret.');
      throw Exception('URI Too Long');
    case 415:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The media format of the requested data is'
          ' not supported by the server, '
          'so the server is rejecting the request.');
      throw Exception('Unsupported Media Type');
    case 416:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }

      throw Exception('Range Not Satisfiable');
    case 417:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }

      throw Exception('Expectation Failed');
    case 418:
      log('The server refuses the attempt to brew coffee with a teapot.');
      throw Exception("I'm a teapot");
    case 421:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The request was directed at a server that is not able to produce'
          ' a response. This can be sent by a server that is not configured to'
          ' produce responses for the combination of scheme and '
          'authority that are included in the request URI.');
      throw Exception('Misdirected Request');
    case 422:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The request was well-formed but was unable to be followed'
          ' due to semantic errors.');
      throw Exception('Unprocessable Content');
    case 423:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The resource that is being accessed is locked.');
      throw Exception('Locked (WebDAV)');
    case 424:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The request failed due to failure of a previous request.');
      throw Exception('Failed Dependency (WebDAV)');
    case 425:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('Indicates that the server is unwilling to risk processing a request '
          'that might be replayed.');
      throw Exception('Too Early');
    case 426:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The server refuses to perform the request using the current protocol'
          ' but might be willing to do so after the client upgrades to '
          'a different'
          ' protocol. The server sends an Upgrade header in a 426 response to'
          ' indicate the required protocol(s).');
      throw Exception('Upgrade Required');
    case 428:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }

      throw Exception('Precondition Required');
    case 429:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The user has sent too many requests in a given amount of time '
          '("rate limiting").');
      throw Exception('Too Many Requests');
    case 431:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The server is unwilling to process the request because its header'
          ' fields are too large. The request '
          'may be resubmitted after reducing the size of the '
          'request header fields.');
      throw Exception('Request Header Fields Too Large');
    case 451:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The user agent requested a resource that cannot legally be '
          'provided, '
          'such as a web page censored by a government.');
      throw Exception('Unavailable For Legal Reasons');
    case 500:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The server has encountered a situation it does not know how to '
          'handle.');
      throw Exception('Internal Server Error');
    case 501:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The request method is not supported by the server and'
          ' cannot be handled. The only methods that servers are required '
          'to support (and therefore that must not return this code)'
          ' are GET and HEAD.');
      throw Exception('Not Implemented');
    case 502:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('This error response means that the server,'
          ' while working as a gateway to get a response'
          ' needed to handle the request, got an invalid'
          ' response.');
      throw Exception('Bad Gateway');
    case 503:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The server is not ready to handle the request. '
          'Common causes are a server that is down for maintenance'
          ' or that is overloaded. Note that together with this'
          ' response, a user-friendly page explaining the problem '
          'should be sent. This response should be used for temporary'
          ' conditions and the Retry-After HTTP header should,'
          ' if possible, contain the estimated time before the'
          ' recovery of the service. The webmaster must also take'
          ' care about the caching-related headers that are sent along'
          ' with this response, as these temporary condition'
          ' responses should usually not be cached.');
      throw Exception('Service Unavailable');
    case 504:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('This error response is given when the'
          ' server is acting as a gateway and'
          ' cannot get a response in time.');
      throw Exception('Gateway Timeout');
    case 505:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The HTTP version used in the request is not supported by the '
          'server.');
      throw Exception('HTTP Version Not Supported');
    case 506:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The server has an internal configuration error: the chosen'
          ' variant resource is configured to engage in transparent '
          'content negotiation itself, and is therefore not a proper '
          'end point in the negotiation process.');
      throw Exception('Variant Also Negotiates');
    case 507:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The method could not be performed on the resource '
          'because the server is unable to store the'
          ' representation needed to successfully complete'
          ' the request.');
      throw Exception('Insufficient Storage (WebDAV)');
    case 508:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('The server detected an infinite loop while processing the request.');
      throw Exception('Loop Detected (WebDAV)');
    case 510:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('Further extensions to the request are required for '
          'the server to fulfill it.');
      throw Exception('Not Extended');
    case 511:
      if (onStatusCodeError != null) {
        onStatusCodeError.call(responseCode);
      }
      log('Indicates that the client needs to authenticate to '
          'gain network access.');
      throw Exception('Network Authentication Required');

    default:
      throw Exception('Something went wrong');
  }
}
