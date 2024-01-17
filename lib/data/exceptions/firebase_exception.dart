
import 'basic_app_exception.dart';

class InternetException extends AppExceptions{
  InternetException([String? message]) : super(message,"No Internet");
}

class RequestTimeOut extends AppExceptions{
  RequestTimeOut([String? message]) : super(message,"Request Time Out");
}

class ServerException extends AppExceptions{
  ServerException([String? message]) : super(message,"Server time Out");
}

class FetchDataException extends AppExceptions{
  FetchDataException([String? message]) : super(message,"Error while Communication");
}