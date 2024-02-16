import 'package:flutter/material.dart';
import 'package:flutter_application_6/components/coffee_tile.dart';
import 'package:flutter_application_6/models/coffee.dart';
import 'package:flutter_application_6/models/coffee_shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
// add to cart
  void addToCart(Coffee coffee) {
    // Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    final shop = context.read<CoffeeShop>();
    shop.addItemToCart(coffee);

    // showDialog(
    //   context: context,
    //   builder: (context) => const AlertDialog(
    //     title: Text('Successfully added to cart'),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                'How would you like your coffee?',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    Coffee coffee = value.coffeeShop[index];

                    return CoffeeTile(
                      coffee: coffee,
                      icon: const Icon(Icons.add),
                      onPressed: () => addToCart(coffee),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
