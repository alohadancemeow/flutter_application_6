import 'package:flutter/material.dart';
import 'package:flutter_application_6/models/coffee.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
      name: 'Long Black',
      price: '4.10',
      imagePath: 'lib/images/coffee-cup.png',
    ),
    Coffee(
      name: 'Latte',
      price: '4.20',
      imagePath: 'lib/images/latte-art.png',
    ),
    Coffee(
      name: 'Espresso',
      price: '4.30',
      imagePath: 'lib/images/expresso.png',
    ),
    Coffee(
      name: 'Ice coffee',
      price: '4.40',
      imagePath: 'lib/images/iced-latte.png',
    ),
  ];

  // use cart
  List<Coffee> _userCart = [];

  // getter
  List<Coffee> get coffeeShop => _shop;
  List<Coffee> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
