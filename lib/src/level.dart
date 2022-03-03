enum Level { verbose, debug, info, warning, error }

extension Emoji on Level {
  String get emoji {
    switch (this) {
      case Level.debug:
        return '🐞 ';
      case Level.info:
        return 'ℹ️ ';
      case Level.warning:
        return '⚠️ ';
      case Level.error:
        return '⛔ ';
      default:
        return '';
    }
  }
}
