import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plants/plants_cart_page.dart';
import 'package:plants/plants_favourite_page.dart';
import 'package:plants/plants_third_page.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  int currentIndex = 0;
  List<Widget> pages = [
    PlantsThirdPage(),
    PlantsFavouritePage(),
    const PlantsCartPage(),
    const PlantsFavouritePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: Color(0xFF4A6D49),
        backgroundColor: Color(0xFF4A6D49),
        unselectedItemColor: Color(0xFF4A6D49),
        unselectedLabelStyle: const TextStyle(color: Color(0xFF4A6D49)),
        selectedLabelStyle: const TextStyle(color: Color(0xFF4A6D49)),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: "Home",
          ),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Favorite"),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: "Cart",
          ),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
