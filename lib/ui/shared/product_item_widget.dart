import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_products/config/inject.dart';
import 'package:my_products/domain/models/product.dart';
import 'package:my_products/utils/services/local_storage.dart';

class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({super.key, required this.product, required this.onWishlistTap});

  final Product product;
  final VoidCallback onWishlistTap;

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await context.push('/product_detail', extra: {'product': widget.product});

        if(result == true) {
          widget.onWishlistTap();
        }
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.product.image,
                    height: 100,
                    width: double.infinity,
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: widget.product.isWishlisted ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
                      onPressed: () {
                        if (widget.product.isWishlisted) {
                          getIt<LocalStorage>().removeWishlist(widget.product.id);
                        } else {
                          getIt<LocalStorage>().wishlistProduct(widget.product.id);
                        }
                        setState(() {
                          widget.product.isWishlisted = !widget.product.isWishlisted;
                        });
                        widget.onWishlistTap();
                      },
                    ),
                  ),
                ],
              ),
              Text(
                widget.product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.product.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Text(
                'R\$ ${widget.product.price}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
