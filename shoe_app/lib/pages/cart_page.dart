import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/components/cart_item.dart';
import 'package:shoe_app/models/cart.dart';
import 'package:shoe_app/models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            //heading
            const Text(
              "My Cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            const SizedBox(
              height: 10,
            ),

            Expanded(
                child: ListView.builder(
              itemCount: value.getCartList().length,
              itemBuilder: (context, index) {
                //get individual shoe
                Shoe individualShoe = value.getCartList()[index];

                return CartItem(shoe: individualShoe);
              },
            ))
          ],
        ),
      ),
    );
  }
}
