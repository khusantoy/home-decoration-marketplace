import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_decoration/services/categories_firebase_services.dart';

class CategoriesController with ChangeNotifier {
  final _categoriesFirebaseServices = CategoriesFirebaseServices();

  Stream<QuerySnapshot> get list async* {
    yield* _categoriesFirebaseServices.getCategories();
  }
}
