import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mgmt_provider/screens/cart_screen.dart';
import 'package:state_mgmt_provider/models/cart_model.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyCatalog'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => const CartScreen())),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: ((context, index) {
          return MyList(index: index);
        }),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  const MyList({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    String itemInfo = 'Item $index';
    var isInCart = context.select<CartModel, bool>(
      // Here, we are only interested whether [item] is inside the cart.
      (cart) => cart.items.contains(itemInfo),
    );
    return ListTile(
      title: Text(itemInfo),
      trailing: TextButton(
        onPressed: isInCart
            ? null
            : () {
                // If the item is not in cart, we let the user add it.
                // We are using context.read() here because the callback is executed whenever the user taps the button.
                var cart = context.read<CartModel>();
                cart.add(itemInfo);
              },
        child: isInCart ? const Icon(Icons.check) : const Text('ADD'),
      ),
    );
  }
}
