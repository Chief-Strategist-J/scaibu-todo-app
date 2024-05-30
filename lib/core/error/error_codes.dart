import 'package:nb_utils/nb_utils.dart';

Object handleErrorCode(int responseCode, void Function(int)? onStatusCodeError) {
  switch (responseCode) {
    case 300:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The request has more than one possible response.'
          ' The user agent or user should choose one of them.'
          ' (There is no standardized way of choosing one of the responses,'
          ' but HTML links to the possibilities are recommended'
          ' so the user can pick.)');
      throw "Multiple Choices";
    case 301:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The URL of the requested resource has been changed permanently.'
          ' The new URL is given in the response.');
      throw 'Moved Permanently';
    case 302:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('This response code means that the URI of requested resource has'
          ' been changed temporarily. Further changes in the URI might be '
          'made in the future. Therefore, this same URI should be used by the '
          'client in future requests.');
      throw 'Found';
    case 303:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The server sent this response to direct the client to get the'
          ' requested resource at another URI with a GET request.');
      throw 'See Other';
    case 304:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('This is used for caching purposes. It tells the client that the'
          ' response has not been modified, so the client can continue to use'
          ' the same cached version of the response.');
      throw 'Not Modified';
    case 306:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('This response code is no longer used; it is just reserved.'
          ' It was used in a previous version of the HTTP/1.1 specification.');
      throw 'unused';
    case 307:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The server sends this response to direct the client to get the'
          ' requested resource at another URI with the same method that was'
          ' used in the prior request. This has the same semantics as the 302'
          ' Found HTTP response code, with the exception that the user agent'
          ' must not change the HTTP method used: if a POST was used in the'
          ' first request, a POST must be used in the second request.');
      throw 'Temporary Redirect';
    case 308:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('This means that the resource is now permanently located at another URI,'
          ' specified by the Location: HTTP Response header. This has the same '
          'semantics as the 301 Moved Permanently HTTP response code, with the exception'
          ' that the user agent must not change the HTTP method used: if a POST was used '
          'in the first request, a POST must be used in the second request.');
      throw 'Permanent Redirect';
    case 400:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The server cannot or will not process the request due to something that'
          ' is perceived to be a client error (e.g., malformed request syntax,'
          ' invalid request message framing, or deceptive request routing)');
      throw 'Bad Request';
    case 401:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('Although the HTTP standard specifies "unauthorized",'
          ' semantically this response means "unauthenticated".'
          ' That is, the client must authenticate itself to get the '
          'requested response.');
      throw 'Unauthorized';
    case 402:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('This response code is reserved for future use. '
          'The initial aim for creating this code was using it'
          ' for digital payment systems, however this status code '
          'is used very rarely and no standard convention exists.');
      throw 'Payment Required';
    case 403:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The client does not have access rights to the content; that is, it is unauthorized, '
          'so the server is refusing to give the requested resource.'
          " Unlike 401 Unauthorized, the client's identity is known to the server.");
      throw 'Forbidden';
    case 404:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The server cannot find the requested resource. In the browser,'
          ' this means the URL is not recognized. In an API, this can also'
          ' mean that the endpoint is valid but the resource itself does not'
          ' exist. Servers may also send this response instead of 403 Forbidden'
          ' to hide the existence of a resource from an unauthorized client.'
          ' This response code is probably the most well known due to its'
          ' frequent occurrence on the web.');
      throw 'Not Found';
    case 405:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log("The request method is known by the server but is not supported"
          " by the target resource. For example, an API may not allow calling"
          " DELETE to remove a resource.");
      throw 'Method Not Allowed';
    case 406:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('This response is sent when the web server, after performing server-driven content negotiation'
          ", doesn't find any content that conforms to the criteria given by the user agent.");
      throw 'Not Acceptable';
    case 407:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('This is similar to 401 Unauthorized but authentication is needed to be done by a proxy.');
      throw 'Proxy Authentication Required';
    case 408:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('This response is sent on an idle connection by some servers,'
          ' even without any previous request by the client. It means that'
          ' the server would like to shut down this unused connection. This'
          ' response is used much more since some browsers, like Chrome, Firefox 27+,'
          ' or IE9, use HTTP pre-connection mechanisms to speed up surfing. Also note '
          'that some servers merely shut down the connection without '
          'sending this message.');
      throw 'Request Timeout';
    case 409:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('This response is sent when a request conflicts with the current state of the server.');
      throw 'Conflict';
    case 410:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('This response is sent when the requested content has been permanently deleted from server,'
          ' with no forwarding address. Clients are expected to remove their caches and links to the resource'
          '. The HTTP specification intends this status code to be used for "limited-time,'
          ' promotional services". APIs should not feel compelled to indicate resources that have'
          ' been deleted with this status code.');
      throw 'Gone';
    case 411:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('Server rejected the request because the Content-Length header field '
          'is not defined and the server requires it.');
      throw 'Length Required';
    case 412:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The client has indicated preconditions in its headers which the server does not meet.');
      throw 'Precondition Failed';
    case 413:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('Request entity is larger than limits defined by server. The server might close'
          ' the connection or throw an Retry-After header field.');
      throw 'Payload Too Large';
    case 414:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The URI requested by the client is longer than the server is willing to interpret.');
      throw 'URI Too Long';
    case 415:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The media format of the requested data is not supported by the server, '
          'so the server is rejecting the request.');
      throw 'Unsupported Media Type';
    case 416:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The range specified by the Range header field in the request cannot'
          "be fulfilled.It's possible that the range is outside the size"
          "of the target URI's data.");
      throw 'Range Not Satisfiable';
    case 417:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('This response code means the expectation indicated by the Expect '
          'request header field cannot be met by the server.');
      throw 'Expectation Failed';
    case 418:
      log('The server refuses the attempt to brew coffee with a teapot.');
      throw "I'm a teapot";
    case 421:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The request was directed at a server that is not able to produce'
          ' a response. This can be sent by a server that is not configured to'
          ' produce responses for the combination of scheme and '
          'authority that are included in the request URI.');
      throw 'Misdirected Request';
    case 422:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The request was well-formed but was unable to be followed due to semantic errors.');
      throw 'Unprocessable Content';
    case 423:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The resource that is being accessed is locked.');
      throw 'Locked (WebDAV)';
    case 424:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The request failed due to failure of a previous request.');
      throw 'Failed Dependency (WebDAV)';
    case 425:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('Indicates that the server is unwilling to risk processing a request that might be replayed.');
      throw 'Too Early';
    case 426:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The server refuses to perform the request using the current protocol'
          ' but might be willing to do so after the client upgrades to a different'
          ' protocol. The server sends an Upgrade header in a 426 response to'
          ' indicate the required protocol(s).');
      throw 'Upgrade Required';
    case 428:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The origin server requires the request to be conditional. '
          "This response is intended to prevent the 'lost update' problem, where a client GETs a resources"
          "state, modifies it and PUTs it back to the server, when meanwhile "
          "a third party has modified the state on the server, leading to a"
          "conflict.");
      throw 'Precondition Required';
    case 429:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The user has sent too many requests in a given amount of time ("rate limiting").');
      throw 'Too Many Requests';
    case 431:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The server is unwilling to process the request because its header fields are too large. The request '
          'may be resubmitted after reducing the size of the request header fields.');
      throw 'Request Header Fields Too Large';
    case 451:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The user agent requested a resource that cannot legally be provided, '
          'such as a web page censored by a government.');
      throw 'Unavailable For Legal Reasons';
    case 500:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The server has encountered a situation it does not know how to handle.');
      throw 'Internal Server Error';
    case 501:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The request method is not supported by the server and'
          ' cannot be handled. The only methods that servers are required '
          'to support (and therefore that must not return this code)'
          ' are GET and HEAD.');
      throw 'Not Implemented';
    case 502:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('This error response means that the server,'
          ' while working as a gateway to get a response'
          ' needed to handle the request, got an invalid'
          ' response.');
      throw 'Bad Gateway';
    case 503:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
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
      throw 'Service Unavailable';
    case 504:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('This error response is given when the'
          ' server is acting as a gateway and'
          ' cannot get a response in time.');
      throw 'Gateway Timeout';
    case 505:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The HTTP version used in the request is not supported by the server.');
      throw 'HTTP Version Not Supported';
    case 506:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The server has an internal configuration error: the chosen'
          ' variant resource is configured to engage in transparent '
          'content negotiation itself, and is therefore not a proper '
          'end point in the negotiation process.');
      throw 'Variant Also Negotiates';
    case 507:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The method could not be performed on the resource '
          'because the server is unable to store the'
          ' representation needed to successfully complete'
          ' the request.');
      throw 'Insufficient Storage (WebDAV)';
    case 508:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('The server detected an infinite loop while processing the request.');
      throw 'Loop Detected (WebDAV)';
    case 510:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('Further extensions to the request are required for the server to fulfill it.');
      throw 'Not Extended';
    case 511:
      if (onStatusCodeError != null) onStatusCodeError.call(responseCode);
      log('Indicates that the client needs to authenticate to gain network access.');
      throw 'Network Authentication Required';

    default:
      throw 'Something went wrong';
  }
}
