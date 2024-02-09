import 'package:movie_app/features/feature2/data/models/objectbox_entity.model.dart';
import 'package:movie_app/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBoxStore {
  static late ObjectBoxStore _instance;
  late final Store store;
  late final Box<ObjectBoxEntityModel> box;
  // late final Box<UpcomingEntityModel> upcomingBox;

  ObjectBoxStore._create(this.store) {
    box = store.box<ObjectBoxEntityModel>();
    // upcomingBox = store.box<UpcomingEntityModel>();
  }
  static ObjectBoxStore get instance {
    return _instance;
  }

  static Future<void> createMethod() async {
    // if (_instance == null) {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: join(docsDir.path, "movieapp"));
    _instance = ObjectBoxStore._create(store);
    // }
  }
}
