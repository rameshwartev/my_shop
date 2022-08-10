import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';
import '../widgets/product_grid_item.dart';
import '../widgets/product_grid_create.dart';
import '../provider/product_provider.dart';

enum FilterOption {
  favorite,
  all,
}

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<ProductProvider>(context,listen:false);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectValue) {
              if (selectValue == FilterOption.favorite) {
               productContainer.showFavoritesOnly();
              } else {}
              productContainer.showAll();
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Only Favorite'),
                value: FilterOption.favorite,
              ),
              const PopupMenuItem(
                child: Text('Show all'),
                value: FilterOption.all,
              ),
            ],
          ),
        ],
      ),
      body: product_grid_create(),
    );
  }
}
