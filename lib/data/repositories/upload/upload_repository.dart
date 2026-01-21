import 'dart:io';

import 'package:result_dart/result_dart.dart';

import '../../services/services.dart';

class UploadRepository {
  UploadRepository({
    required this.service,
  });

  final UploadService service;

  AsyncResult<void> upload({
    required File file,
    required String fileName,
  }) async {
    return service.upload(file: file, fileName: fileName);
  }
}
