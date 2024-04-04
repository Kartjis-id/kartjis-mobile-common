import 'package:http/http.dart';
import 'package:kartjis_mobile_common/src/core/extensions/map_extensions.dart';

extension BaseRequestExtensions on BaseRequest {
  BaseRequest copy({
    String? method,
    Uri? url,
  }) {
    final request = this;
    if (request is Request) {
      return request.copy(method: method, url: url);
    } else if (request is MultipartRequest) {
      return request.copy(method: method, url: url);
    } else {
      throw Exception('Unknown request type: $runtimeType');
    }
  }

  String? get authHeader {
    final headers = this.headers.toIgnoreCase();
    final authHeader = headers['authorization'];
    return authHeader;
  }
}
