import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.primaryColor).make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl4.color(context.theme.primaryColor).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying is under development.".text.make()));
            }, 
            style: ButtonStyle(
                backgroundColor: Theme.of(context).elevatedButtonTheme.style!.backgroundColor,
              ),
            child: const Text(
              "Buy",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ).w32(context),
        ],
      ),
    );
  }
}


class _CartList extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty ? "Nothing to show.".text.xl3.makeCentered() : ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          onPressed: () {
            _cart.remove(_cart.items[index]);
          }, 
          icon: const Icon(Icons.remove_circle_outline),
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}