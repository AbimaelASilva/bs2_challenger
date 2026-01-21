import 'dart:convert';
import 'dart:io';

class FileModel {
  final String id;
  final String sendedByIdUser;
  final String url;
  final String type;
  final String createdAt;
  final File file;

  FileModel({
    required this.id,
    required this.sendedByIdUser,
    required this.url,
    required this.type,
    required this.createdAt,
    required this.file,
  });

  FileModel copyWith({
    String? id,
    String? sendedByIdUser,
    String? url,
    String? type,
    String? createdAt,
    File? file,
  }) {
    return FileModel(
      id: id ?? this.id,
      sendedByIdUser: sendedByIdUser ?? this.sendedByIdUser,
      url: url ?? this.url,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      file: file ?? this.file,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'sendedByIdUser': sendedByIdUser});
    result.addAll({'url': url});
    result.addAll({'type': type});
    result.addAll({'createdAt': createdAt});

    return result;
  }

  factory FileModel.fromMap(Map<String, dynamic> map) {
    return FileModel(
      id: map['id']?.toString() ?? '',
      sendedByIdUser: map['sendedByIdUser']?.toString() ?? '',
      url: map['url']?.toString() ?? '',
      type: map['type']?.toString() ?? '',
      createdAt: map['createdAt']?.toString() ?? '',
      // O arquivo deve ser fornecido separadamente, pois não pode ser
      // deserializado diretamente do JSON
      file: map['file'] as File? ?? File(''),
    );
  }

  factory FileModel.empty() {
    return FileModel(
      id: '',
      sendedByIdUser: '',
      url: '',
      type: '',
      createdAt: '',
      file: File(''),
    );
  }

  String toJson() => json.encode(toMap());

  factory FileModel.fromJson(String source) {
    final map = json.decode(source) as Map<String, dynamic>;
    return FileModel.fromMap(map);
  }

  @override
  String toString() {
    return 'FileModel(id: $id, sendedByIdUser: $sendedByIdUser, url: $url, type: $type, createdAt: $createdAt, file: $file)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FileModel &&
        other.id == id &&
        other.sendedByIdUser == sendedByIdUser &&
        other.url == url &&
        other.type == type &&
        other.createdAt == createdAt &&
        other.file.path == file.path;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        sendedByIdUser.hashCode ^
        url.hashCode ^
        type.hashCode ^
        createdAt.hashCode ^
        file.path.hashCode;
  }
}
