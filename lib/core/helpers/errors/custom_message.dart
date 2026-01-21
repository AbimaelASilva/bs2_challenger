import 'dart:developer';

import '../../../core/http/response/rest_client_exception.dart';
import '../../../ui/core/components/atoms/snackbar/app_snackbar_service.dart';

void customMessageError({
  required String messageDefault,
  required Exception failure,
}) {
  String errorMessage = messageDefault;

  if (failure is RestClientException) {
    errorMessage = failure.message ?? errorMessage;
  }

  log("FALHA: $errorMessage");
  AppSnackbar().error(errorMessage);
}
