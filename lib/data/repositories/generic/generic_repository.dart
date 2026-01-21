import 'package:result_dart/result_dart.dart';
import '../../../ui/core/core.dart';

import '../../services/services.dart';

class GenericRepository {
  GenericRepository({
    required this.service,
  });

  final GenericService service;

  AsyncResult<bool> demoRequest(String text) async {
    try {
      final response = await service.isContentToxic(text);

      return response.fold(
        (data) async {
          return const Success(true);
        },
        (failure) {
          AppSnackbar().error(
            "Não foi possível verificar o conteúdo",
          );
          return const Success(true);
        },
      );
    } catch (e) {
      AppSnackbar().error(
        "Não foi possível verificar o conteúdo",
      );
      rethrow;
    }
  }
}
