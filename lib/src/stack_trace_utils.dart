extension StringUtils on StackTrace {
  String? format({int maxLines = 2, int beginIndex = 0}) {
    List<String> _lines = toString().split('\n');
    if (beginIndex > 0 && beginIndex < _lines.length - 1) {
      _lines = _lines.sublist(beginIndex);
    }
    final List<String> _formatted = [];
    int _count = 0;
    for (String line in _lines) {
      if (_discardDeviceStacktraceLine(line) ||
          _discardWebStacktraceLine(line) ||
          _discardBrowserStacktraceLine(line) ||
          line.isEmpty) {
        continue;
      }
      _formatted.add('#$_count ${line.replaceFirst(RegExp(r'#\d+\s+'), '')}');
      if (++_count == maxLines) {
        break;
      }
    }

    if (_formatted.isEmpty) {
      return null;
    } else {
      return _formatted.join('\n');
    }
  }

  static final _deviceStackTraceRegex =
      RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');

  /// Matches a stacktrace line as generated by Flutter web.
  /// For example:
  /// packages/logger/src/printers/pretty_printer.dart 91:37
  static final _webStackTraceRegex =
      RegExp(r'^((packages|dart-sdk)\/[^\s]+\/)');

  /// Matches a stacktrace line as generated by browser Dart.
  /// For example:
  /// dart:sdk_internal
  /// ../../src/logger.dart
  static final _browserStackTraceRegex =
      RegExp(r'^(?:package:)?(dart:[^\s]+|[^\s]+)');

  static bool _discardDeviceStacktraceLine(String line) {
    var match = _deviceStackTraceRegex.matchAsPrefix(line);
    if (match == null) {
      return false;
    }
    return match.group(2)!.startsWith('../..');
  }

  static bool _discardWebStacktraceLine(String line) {
    var match = _webStackTraceRegex.matchAsPrefix(line);
    if (match == null) {
      return false;
    }
    return match.group(1)!.startsWith('packages/logger') ||
        match.group(1)!.startsWith('dart-sdk/lib');
  }

  static bool _discardBrowserStacktraceLine(String line) {
    var match = _browserStackTraceRegex.matchAsPrefix(line);
    if (match == null) {
      return false;
    }
    return match.group(1)!.startsWith('../..') ||
        match.group(1)!.startsWith('dart:');
  }
}
