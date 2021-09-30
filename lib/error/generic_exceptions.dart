import 'package:fm_music/error/base_exception.dart';

const int genericErrorCode = 1000;

class GenericException extends BaseException {
  GenericException() : super(genericErrorCode);

  @override
  String getErrorMessage() {
    return 'Something wrong is happened, please try again later';
  }
}
