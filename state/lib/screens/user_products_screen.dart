import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/providers/products.dart';
import 'package:state/screens/edit_product_screen.dart';
import 'package:state/widgets/app_drawer.dart';
import 'package:state/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: products.items.length,
            itemBuilder: (_, i) => Column(
              children: <Widget>[
                UserProductItem(
                  products.items[i].id,
                  products.items[i].title,
                  products.items[i].imageURL,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
