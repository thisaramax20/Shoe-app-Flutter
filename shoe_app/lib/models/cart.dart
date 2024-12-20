import 'package:flutter/material.dart';
import 'package:shoe_app/models/shoe.dart';

class Cart extends ChangeNotifier {
  //list of items
  List<Shoe> itemList = [
    Shoe("Air jordan", "230", "lib/images/shoe1/jpg", "Cool Shoe"),
    Shoe("Nike Air Zoom", "120", "lib/images/shoe2/jpg", "Great Shoe"),
    Shoe("Adidas Ultraboost", "180", "lib/images/shoe3/jpg", "Super Shoe"),
    Shoe("Puma Boost", "150", "lib/images/shoe4/jpg", "Fantastic Shoe"),
  ];

  //list of cart
  List<Shoe> userCart = [];

  //get list of shoes
  List<Shoe> getShoeList() {
    return itemList;
  }

  //get cart list
  List<Shoe> getCartList() {
    return userCart;
  }

  //add to cart
  void addToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
