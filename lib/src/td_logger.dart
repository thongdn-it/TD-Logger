import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'level.dart';
import 'stack_trace_utils.dart';

enum LogType { short, full }

abstract class Logger {
  static String? name;

  /// Log a string message, you can also pass other objects (like List, Map or Set).
  static void log(Object? object,
      {Level level = Level.verbose,
      String? name,
      int stackTraceBeginIndex = 1,
      int stackTraceLines = 1,
      LogType type = LogType.full}) {
    if (kDebugMode) {
      String _message = '';
      switch (type) {
        case LogType.full:
          _message = _getFullLog(object,
              level: level,
              name: name,
              stackTraceBeginIndex: stackTraceBeginIndex,
              stackTraceLines: stackTraceLines);
          break;
        default:
          _message = _getShortLog(object, level: level, name: name);
          break;
      }

      debugPrint(_message);
    }
  }

  static String _getFullLog(Object? object,
      {Level level = Level.verbose,
      String? name,
      int stackTraceBeginIndex = 1,
      int stackTraceLines = 1}) {
    final _emoji = level.emoji;
    final _dateTime = DateTime.now().toString();
    final _headString =
        '------ ${name ?? Logger.name ?? 'TDLogger'}: ${_emoji.isNotEmpty == true ? '$_emoji ' : ''}$_dateTime ------';
    String _message = '┌$_headString\n';

    final _stackTraceString = StackTrace.current
        .format(maxLines: stackTraceLines, beginIndex: stackTraceBeginIndex);
    if (_stackTraceString?.isNotEmpty == true) {
      _message += '│${_stackTraceString!.replaceAll('\n', '\n│')}\n';
    }
    final int _number = (_headString.length - 5) ~/ 2;
    final _str = List.generate(_number, (index) => '-').join();
    _message += '├$_str Log $_str\n';
    if (object is String) {
      _message += '│${object.replaceAll('\n', '\n│')}';
    } else {
      _message += '│${jsonEncode(object).replaceAll('\n', '\n│')}';
    }
    _message += '\n└${_headString.replaceAll(RegExp('.'), '-')}';

    return _message;
  }

  static String _getShortLog(Object? object,
      {Level level = Level.verbose, String? name}) {
    final _emoji = level.emoji;
    String _message =
        '${_emoji.isNotEmpty == true ? '$_emoji ' : ''}${name ?? Logger.name ?? 'TDLogger'}: ';
    if (object is String) {
      _message += '$object';
    } else {
      _message += '${jsonEncode(object)}';
    }
    return _message;
  }

  /// Log a message at level [Level.verbose].
  static void verbose(Object? object,
      {String? name, LogType type = LogType.full}) {
    log(object,
        name: name, level: Level.verbose, stackTraceBeginIndex: 2, type: type);
  }

  /// Log a message at level [Level.debug].
  static void debug(Object? object,
      {String? name, LogType type = LogType.full}) {
    log(object,
        name: name, level: Level.debug, stackTraceBeginIndex: 2, type: type);
  }

  /// Log a message at level [Level.info].
  static void info(Object? object,
      {String? name, LogType type = LogType.full}) {
    log(object,
        name: name, level: Level.info, stackTraceBeginIndex: 2, type: type);
  }

  /// Log a message at level [Level.warning].
  static void warning(Object? object,
      {String? name, LogType type = LogType.full}) {
    log(object,
        name: name, level: Level.warning, stackTraceBeginIndex: 2, type: type);
  }

  /// Log a message at level [Level.error].
  static void error(Object? object,
      {String? name, LogType type = LogType.full}) {
    log(object,
        name: name, level: Level.error, stackTraceBeginIndex: 2, type: type);
  }
}
