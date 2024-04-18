import 'dart:io';

class Env {
  static final Map<String, String> _env = {};

  static Future<void> load() async {
    final envLines = await File('.env').readAsLines();
    for (final line in envLines) {
      final index = line.indexOf('=');
      if (index != -1) {
        final name = line.substring(0, index);
        final value = line.substring(index + 1);
        _env[name] = value;
      }
    }
  }

  static String getValue(String name) => _env[name] ?? '';
}
