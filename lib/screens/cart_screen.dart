import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cart.items[index]),
                  trailing: IconButton(
                      onPressed: () {
                        cart.remove(cart.items[index]);
                      },
                      icon: const Icon(Icons.remove_circle_outline)),
                );
              },
            ),
          ),
          const Divider(height: 4, color: Colors.black),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Another way to listen to a model's change is to include the Consumer widget.
            // This widget will automatically listen to CartModel and rerun its builder on every change.
            //
            // The important thing is that it will not rebuild the rest of the widgets in this build method.
            Consumer<CartModel>(
                builder: (context, cart, child) =>
                    Text('Total Items: ${cart.total}')),
            const SizedBox(width: 24),
            TextButton(
              onPressed: () {},
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}
