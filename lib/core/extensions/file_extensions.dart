import 'dart:io';

extension FileExtension on File {
  /// Retorna a extensão do arquivo, como 'png', 'jpg', 'mp4'
  String get fileType {
    final fileName = path.split('/').last;
    final extension =
        fileName.contains('.') ? fileName.split('.').last.toLowerCase() : '';
    return extension;
  }

  bool get isVideo =>
      path.toLowerCase().endsWith('.mp4') ||
      path.toLowerCase().endsWith('.mov');
}
