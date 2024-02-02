import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/features/feature2/data/models/firestore_model.dart';

abstract class FireBaseDataSource {
  Future<void> addToFireStore(FireStoreModel model);
  Stream<QuerySnapshot<FireStoreModel>> getFromFireStore();
  Future<void> deleteFromFireStore(String id);
}
