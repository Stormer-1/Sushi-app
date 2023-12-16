import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/themes/colors.dart';

class FoodDetailsPage extends StatefulWidget {
  const FoodDetailsPage({
    super.key,
    required this.food,
  });
  final Food food;

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // quantity
  int quantityCount = 0;

  // decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  // increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    // only add to cart if something's in
    if (quantityCount > 0) {
      // get access to shop
      final shop = context.read<Shop>();

      // add to cart
      shop.addToCart(widget.food, quantityCount);

      // let the user know it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Successfully added to cart",
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            // okay button
            IconButton(
              onPressed: () {
                // pop once to remove the dialog box
                Navigator.pop(context);

                // pop again to go to previous screen
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // listview
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: ListView(
                children: [
                  // image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),

                  // rating
                  Row(
                    children: [
                      // star icon
                      const Icon(
                        Icons.star,
                      ),

                      const SizedBox(width: 10),

                      // rating number
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  Text(
                    "Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // price + quantity + add to cart button
          Container(
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [

                  // price + quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // price
                      Text(
                        "\$${widget.food.price}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(width: 10),

                      // quantity
                      Row(
                        children: [
                          // minus button

                          Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: decrementQuantity,
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          // quantity count
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantityCount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),

                          // plus button
                          Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: incrementQuantity,
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  // add to cart button

                  MyButton(
                    text: "Add To Cart",
                    onTap: addToCart,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
