import Foundation

extension Double {
  /// format a double base on objective-c formating
  /// - Parameter f: ".2" to return only the 2 number etc
  /// - Returns: a trimmed double in stringly typed
  func format(f: String) -> String {
    return String(format: "%\(f)f", self)
  }
}

extension Int {
  /// format a double base on objective-c formating
  /// - Parameter f: ".2" to return only the 2 number etc
  /// - Returns: a trimmed double in stringly typed
  func formatInt(f: String) -> String {
    return String(format: "%\(f)f", self)
  }
}
