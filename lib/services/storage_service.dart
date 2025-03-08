import 'package:get_storage/get_storage.dart';
import 'package:theadsclone/utils/storage_key.dart';

class StorageService {
  static final session = GetStorage();
  static dynamic userSession = session.read(StorageKey.userSession);
}
