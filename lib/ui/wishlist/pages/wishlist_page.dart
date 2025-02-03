import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_products/ui/shared/loading_widget.dart';
import 'package:my_products/ui/shared/product_item_widget.dart';
import 'package:my_products/ui/wishlist/cubit/wishlist_cubit.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  late final WishlistCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<WishlistCubit>();

    _cubit.getWishlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Column(
              children: [
                LoadingWidget(isProduct: true,),
              ],
            );
          } else if (state is WishlistSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductItemWidget(product: product, onWishlistTap: () {
                  _cubit.getWishlist();
                },);
              },
            );
          } else if (state is WishlistFailure) {
            return Center(
              child: Text(state.message),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
