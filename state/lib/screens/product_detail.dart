import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;

  // ProductDetailScreen(this.title);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context).settings.arguments as String;
    // ... get all product data for ID
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findByID(productID);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
