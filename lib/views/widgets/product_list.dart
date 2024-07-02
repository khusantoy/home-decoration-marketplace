import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decoration/controllers/categories_controller.dart';
import 'package:home_decoration/controllers/products_controller.dart';
import 'package:home_decoration/models/product.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = context.read<ProductsController>();
    final categoryController = context.read<CategoriesController>();

    return StreamBuilder(
        stream: productController.list,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null) {
            return const Center(
              child: Text("No available products"),
            );
          }

          final products = snapshot.data!.docs;

          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 40),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 50,
              crossAxisSpacing: 15,
              childAspectRatio: 3 / 3,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = Product.fromQuerySnapshot(products[index]);

              String category = '';



              return Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -50,
                      left: -18,
                      child: SizedBox(
                        width: 100,
                        child: CachedNetworkImage(
                          imageUrl: product.imageUrl,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            "(5.0)",
                            style: TextStyle(color: Colors.amber),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(product.title),
                    ),
                    Positioned(
                      top: 74.h,
                      child: const Text("Lamp"),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${product.price} sum"),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_outline),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}
