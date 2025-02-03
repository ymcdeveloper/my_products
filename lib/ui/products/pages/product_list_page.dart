import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_products/config/inject.dart';
import 'package:my_products/domain/models/category.dart';
import 'package:my_products/domain/repositories/product_repository.dart';
import 'package:my_products/ui/products/cubit/product_list_cubit.dart';
import 'package:my_products/ui/shared/loading_widget.dart';
import 'package:my_products/ui/shared/product_item_widget.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key, required this.category});

  final Category category;

  static Widget fromParams(Map<String, dynamic> params) {
    Category selectedCategory = params['category'] ?? '';
    return BlocProvider(
      create: (context) => ProductListCubit(
        getIt<ProductRepository>(),
      ),
      child: ProductListPage(category: selectedCategory),
    );
  }

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late final ProductListCubit _cubit;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    _cubit = context.read<ProductListCubit>();

    _cubit.getProducts(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
              leading: const Icon(Icons.search),
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<ProductListCubit, ProductListState>(
        builder: (context, state) {
          if (state is ProductListLoading) {
            return Column(
              children: [
                LoadingWidget(isProduct: true),
                LoadingWidget(isProduct: true),
                LoadingWidget(isProduct: true),
              ],
            );
          }

          if (state is ProductListFailure) {
            return Center(
              child: Text(state.failure.message),
            );
          }

          if (state is ProductListSuccess) {
            final filteredProducts = state.products
                .where(
                  (category) => category.title.toLowerCase().contains(_searchQuery),
                )
                .toList();

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return ProductItemWidget(
                      product: product,
                      onWishlistTap: () {
                        setState(() {});
                      });
                },
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
