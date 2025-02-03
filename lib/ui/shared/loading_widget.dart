import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.isProduct});

  final bool isProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          isProduct
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.transparent,
                        child: Card(
                          child: SizedBox(
                            height: 100,
                            
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.transparent,
                        child: Card(
                          child: SizedBox(
                            height: 100,
                            
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.transparent,
                    child: Card(
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
