import 'package:flutter/material.dart';
import '../provider/product_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/product_grid_item.dart';
import '../provider/products.dart';

class product_grid_create extends StatelessWidget {
  // const product_grid_create({
  //   Key? key,
  //   required this.loadedProducts,
  // }) : super(key: key);

  // final List<Product> loadedProducts;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (c) => products[i],
        child: ProductGridItem(
          // id: products[i].id,
          // title: products[i].title,
          // imageUrl: products[i].imageUrl,
        ),
      ),
    );
  }
}
