import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_decoration/services/products_firebase_services.dart';

class ProductsController with ChangeNotifier {
  final _productsFirebaseServices = ProductsFirebaseServices();

  Stream<QuerySnapshot> get list async* {
    yield* _productsFirebaseServices.getProducts();
  }
}
