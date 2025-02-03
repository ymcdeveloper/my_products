import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_products/ui/categories/cubit/categories_list_cubit.dart';
import 'package:my_products/ui/shared/loading_widget.dart';

class CategoriesListPage extends StatefulWidget {
  const CategoriesListPage({super.key});

  @override
  State<CategoriesListPage> createState() => _CategoriesListPageState();
}

class _CategoriesListPageState extends State<CategoriesListPage> {
  late final CategoriesListCubit _cubit;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    _cubit = context.read<CategoriesListCubit>();
    _cubit.getCategories();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
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
      body: BlocBuilder<CategoriesListCubit, CategoriesListState>(
        builder: (context, state) {
          if (state is CategoriesListLoading) {
            return Column(
              children: const [
                LoadingWidget(isProduct: false),
                LoadingWidget(isProduct: false),
                LoadingWidget(isProduct: false),
              ],
            );
          }

          if (state is CategoriesListFailure) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is CategoriesListSuccess) {
            final filteredCategories = state.categories
                .where(
                  (category) => category.name.toLowerCase().contains(_searchQuery),
                )
                .toList();

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                final item = filteredCategories[index];
                return GestureDetector(
                  onTap: () {
                    context.push('/product_list', extra: {'category': item});
                  },
                  child: Card(
                    child: Center(
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
