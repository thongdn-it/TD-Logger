import 'package:td_logger/td_logger.dart';

void main() {
  Logger.name = 'ThongDN';
  Logger.log('TD Logger -> log');
  Logger.debug('TD Logger -> Debug');
  Logger.info('TD Logger -> Info');
  Logger.warning('TD Logger -> Warning');
  Logger.error('TD Logger -> Error');
}
