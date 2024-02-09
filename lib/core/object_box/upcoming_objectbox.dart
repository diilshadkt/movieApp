import 'package:movie_app/features/feature2/data/models/upcoming_entity_model.dart';
import 'package:movie_app/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class UpcomingObjectBoxStore {
  static UpcomingObjectBoxStore? _instance;
  late final Store store;
  late final Box<UpcomingEntityModel> box;

  UpcomingObjectBoxStore._create(this.store) {
    box = store.box<UpcomingEntityModel>();
  }
  static UpcomingObjectBoxStore get instance {
    return _instance!;
  }

  static Future<void> createMethod() async {
    if (_instance == null) {
      final docsDir = await getApplicationDocumentsDirectory();
      final store =
          await openStore(directory: join(docsDir.path, "upcoming movie"));
      _instance = UpcomingObjectBoxStore._create(store);
    }
  }
}
