/// [Level]s to control logging output
enum Level { verbose, debug, info, warning, error }

extension Emoji on Level {
  /// Get emoji for [Level]. Default: ''
  /// - [Level.debug] : 'đ'
  /// - [Level.info] : 'âšī¸'
  /// - [Level.warning] : 'â ī¸'
  /// - [Level.error] : 'â'
  String get emoji {
    switch (this) {
      case Level.debug:
        return 'đ';
      case Level.info:
        return 'âšī¸';
      case Level.warning:
        return 'â ī¸';
      case Level.error:
        return 'â';
      default:
        return '';
    }
  }
}
