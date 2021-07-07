import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/app_icons.dart';
import 'package:yuka/ecran_caracteristiques.dart';
import 'package:yuka/ecran_detail.dart';
import 'package:yuka/ecran_tableau.dart';

import '../app_colors.dart';
import 'ecran_nutrition.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    DetailsScreen(),
    CaracteristiquesScreen(),
    NutritionScreen(),
    TableauScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tabBarcode),
            label: 'Fiche',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tabFridge),
            label: 'Caractéristiques',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tabNutrition),
            label: 'Nutrition',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.tabArray),
            label: 'Tableau',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.blueDark,
        onTap: _onItemTapped,
        unselectedItemColor: AppColors.yellow,
      ),
    );
  }
}
