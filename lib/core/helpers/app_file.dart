import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

Future<File> convertUint8ListToFile(Uint8List data, String filename) async {
  // Obtém o diretório temporário do dispositivo
  final directory = await getTemporaryDirectory();

  // Cria o caminho completo do arquivo
  final filePath = '${directory.path}/$filename';

  // Cria o arquivo
  final file = File(filePath);

  // Escreve os bytes no arquivo
  return file.writeAsBytes(data);
}
