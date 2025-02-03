import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_products/config/inject.dart';
import 'package:my_products/ui/categories/cubit/categories_list_cubit.dart';
import 'package:my_products/ui/categories/pages/categories_list_page.dart';
import 'package:my_products/ui/wishlist/cubit/wishlist_cubit.dart';
import 'package:my_products/ui/wishlist/pages/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => getIt<CategoriesListCubit>(),
      child: CategoriesListPage(),
    ),
    BlocProvider(
      create: (context) => getIt<WishlistCubit>(),
      child: WishlistPage(),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Lista de Desejos',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
