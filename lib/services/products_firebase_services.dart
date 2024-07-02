import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsFirebaseServices {
  final _productCollection = FirebaseFirestore.instance.collection("products");

  Stream<QuerySnapshot> getProducts() async* {
    yield* _productCollection.snapshots();
  }

}
