class TextUtils {
  static bool isEmpty(String value) {
    return value == null || value == "";
  }
  /// 为空的替换字符
  static String getNonStr(String value, {String ifNonReplace}) {
    return isEmpty(value) ? (ifNonReplace == null ? "" : ifNonReplace) : value;
  }
}
