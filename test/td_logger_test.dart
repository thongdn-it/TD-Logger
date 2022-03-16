import 'package:td_logger/td_logger.dart';

void main() {
  Logger.name = 'ThongDN';

  Logger.log('TD Logger -> Log', type: LogType.short);
  Logger.info('TD Logger -> Info', type: LogType.short);
  Logger.warning('TD Logger -> Warning', type: LogType.short);

  Logger.debug('TD Logger -> Debug');
  Logger.error('TD Logger -> Error');
}
