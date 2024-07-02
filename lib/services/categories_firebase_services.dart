import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesFirebaseServices {
  final _categoryCollection =
      FirebaseFirestore.instance.collection("categories");

  Stream<QuerySnapshot> getCategories() async* {
    yield*  _categoryCollection.snapshots();
  }
}
