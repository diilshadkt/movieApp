import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/features/feature2/data/datasources/firebase_datasource.dart';
import 'package:movie_app/features/feature2/data/models/firestore_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_datasource_impl.g.dart';

class FireBaseDataSourceImpl implements FireBaseDataSource {
  final db = FirebaseFirestore.instance.collection("favourite").withConverter(
      fromFirestore: FireStoreModel.fromFirestore,
      toFirestore: (model, _) => model.toFirestore());

  @override
  Future<void> addToFireStore(FireStoreModel model) async {
    db.doc(model.id.toString()).set(model);
  }

  @override
  Future<void> deleteFromFireStore(String id) async {
    await db.doc(id).delete();
  }

  @override
  Stream<QuerySnapshot<FireStoreModel>> getFromFireStore() {
    final querySnapshot = db.snapshots();
    return querySnapshot;
  }
}

@riverpod
FireBaseDataSource fireBaseDataSource(FireBaseDataSourceRef ref) {
  return FireBaseDataSourceImpl();
}
