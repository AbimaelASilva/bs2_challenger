import 'package:get_storage/get_storage.dart';

abstract class LocalStorageService<T> {
  LocalStorageService({required this.storage, required this.key});

  final GetStorage storage;
  final String key;

  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T item);
  String getId(T item);

  Future<void> create(T item) async {
    final itemId = getId(item);
    final existingItem = await getById(itemId);

    await _saveItemById(item);

    if (existingItem == null) {
      final items = await getAll();
      if (!items.any((i) => getId(i) == itemId)) {
        items.add(item);
        await _saveItemsList(items);
      }
    }
  }

  Future<T?> getById(String id) async {
    final itemJson = storage.read<dynamic>('${key}_$id');
    if (itemJson == null) return null;
    return fromJson(itemJson as Map<String, dynamic>);
  }

  Future<List<T>> getAll() async {
    final itemsIds = storage.read<dynamic>(key);
    final List<dynamic> idsList = itemsIds is List ? itemsIds : [];
    final items = <T>[];

    for (final id in idsList) {
      final item = await getById(id.toString());
      if (item != null) {
        items.add(item);
      }
    }

    return items;
  }

  Future<void> update(T item) async {
    await _saveItemById(item);
    final items = await getAll();
    final index = items.indexWhere((i) => getId(i) == getId(item));
    if (index != -1) {
      items[index] = item;
      await _saveItemsList(items);
    }
  }

  Future<void> delete(String id) async {
    await storage.remove('${key}_$id');
    final itemsIds = storage.read<dynamic>(key);
    final List<dynamic> idsList = itemsIds is List ? itemsIds : [];
    idsList.remove(id);
    await storage.write(key, idsList);
  }

  Future<void> deleteAll() async {
    final itemsIds = storage.read<dynamic>(key);
    final List<dynamic> idsList = itemsIds is List ? itemsIds : [];
    for (final id in idsList) {
      await storage.remove('${key}_$id');
    }
    await storage.remove(key);
  }

  Future<void> _saveItemById(T item) async {
    await storage.write('${key}_${getId(item)}', toJson(item));
  }

  Future<void> _saveItemsList(List<T> items) async {
    final itemsIds = items.map((i) => getId(i)).toList();
    await storage.write(key, itemsIds);
  }
}
