import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/components/shoe_tile.dart';
import 'package:shoe_app/models/cart.dart';
import 'package:shoe_app/models/shoe.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                //search bar
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Search"), Icon(Icons.search)],
                  ),
                ),

                //message
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                      "Everyone flies... But some fly higher than others."),
                ),

                //hot picks
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hot Picks 🔥",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        "See All...",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          Shoe shoe = Shoe("Air Jordan", "240",
                              "lib/images/shoe1.jpg", "Cool Shoe");
                          return ShoeTile(shoe: shoe);
                        })),

                const Padding(
                  padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                  child: Divider(
                    color: Colors.white,
                  ),
                )
              ],
            ));
  }
}
