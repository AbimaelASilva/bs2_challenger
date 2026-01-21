import 'package:image_picker/image_picker.dart';
import '../../ui/core/core.dart';

export 'app_image_picker.dart';

class AppImagePicker {
  final picker = ImagePicker();

  // Constantes para mensagens de erro
  static const String _singleFileError = "Erro ao selecionar arquivo";
  static const String _multipleFilesError = "Erro ao selecionar arquivos";

  // Método auxiliar para tratamento de erros
  void _handleError(String message) {
    AppSnackbar().error(message);
  }

  // Método auxiliar para executar operações de pick com tratamento de erro
  Future<T?> _executePickOperation<T>({
    required Future<T?> Function() operation,
    required String errorMessage,
  }) async {
    try {
      return await operation();
    } catch (e) {
      _handleError(errorMessage);
      return null;
    }
  }

  Future<XFile?> pickImage({ImageSource? source}) async {
    return _executePickOperation<XFile>(
      operation: () => picker.pickImage(
        source: source ?? ImageSource.gallery,
        imageQuality: 80,
      ),
      errorMessage: _singleFileError,
    );
  }

  Future<XFile?> pickMedia() async {
    return _executePickOperation<XFile>(
      operation: picker.pickMedia,
      errorMessage: _singleFileError,
    );
  }

  Future<XFile?> pickVideo({ImageSource? source}) async {
    return _executePickOperation<XFile>(
      operation: () => picker.pickVideo(source: source ?? ImageSource.gallery),
      errorMessage: _singleFileError,
    );
  }

  Future<List<XFile>?> pickMultiImage() async {
    return _executePickOperation<List<XFile>>(
      operation: () => picker.pickMultiImage(limit: 10),
      errorMessage: _multipleFilesError,
    );
  }

  Future<List<XFile>?> pickMultipleMedia() async {
    return _executePickOperation<List<XFile>>(
      operation: picker.pickMultipleMedia,
      errorMessage: _multipleFilesError,
    );
  }
}
