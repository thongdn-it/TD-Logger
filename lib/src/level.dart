/// [Level]s to control logging output
enum Level { verbose, debug, info, warning, error }

extension Emoji on Level {
  /// Get emoji for [Level]. Default: ''
  /// - [Level.debug] : '🐞'
  /// - [Level.info] : 'ℹ️'
  /// - [Level.warning] : '⚠️'
  /// - [Level.error] : '⛔'
  String get emoji {
    switch (this) {
      case Level.debug:
        return '🐞';
      case Level.info:
        return 'ℹ️';
      case Level.warning:
        return '⚠️';
      case Level.error:
        return '⛔';
      default:
        return '';
    }
  }
}
