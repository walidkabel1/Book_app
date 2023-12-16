import 'package:dio/dio.dart';

abstract class failure {
  final String errMessage;

  failure(this.errMessage);
}

class ServerFailure extends failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection timed out with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timed out with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timed out with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure("Unexpexted error , Please Try again!");
        }

      default:
        return ServerFailure("there was an error ,please Try again! ");
    }
  }
  factory ServerFailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statuscode == 400) {
      return ServerFailure("Your request not found ,please Try later!");
    } else if (statuscode == 500) {
      return ServerFailure("internel Server error ,please Try later!");
    } else {
      return ServerFailure('there was an error ,please Try again! ');
    }
  }
}
