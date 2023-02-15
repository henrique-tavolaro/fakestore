import 'package:fakestore/app/presentation/cubit/categories/categories_cubit.dart';
import 'package:fakestore/app/presentation/cubit/products/products_cubit.dart';
import 'package:fakestore/app/presentation/pages/home/components/categories_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/config/injection.dart';
import 'components/products_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CategoriesCubit>()..getCategories(),
        ),
        BlocProvider(
          create: (_) => getIt<ProductsCubit>()..getProducts(),
        ),
      ],
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
      ),
      body: Column(
        children: [
          BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
            return state.when(
              initial: () => SizedBox.shrink(),
              loaded: (categories) => CategoriesRow(
                categoryList: categories,
              ),
              failed: (error) => Text(error),
            );
          }),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              return state.when(
                initial: () => SizedBox.shrink(),
                loading: () => Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                loaded: (products) => ProductsGrid(
                  products: products,
                ),
                failed: (error) => Text(error),
              );
            },
          ),
        ],
      ),
    );
  }
}
