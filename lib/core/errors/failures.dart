import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout With Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout With Api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout With Api Server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate With Api Server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request With Api Server Was Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error With Api Server');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Iternet Connection');
        }
        return ServerFailure('UnExpected Error, Please Try Again!');
      default:
        return ServerFailure('Opps There Was an Error, Please Try Again...');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request Not Found , Please Try Later....');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error , Please Try Later...');
    } else {
      return ServerFailure('Opps There Was an Error, Please Try Again...');
    }
  }
}
