import 'package:fakestore/app/presentation/cubit/categories/categories_cubit.dart';
import 'package:fakestore/app/presentation/pages/home/components/categories_row.dart';
import 'package:fakestore/app/presentation/pages/home/components/product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/injection.dart';
import '../../cubit/store/store_cubit.dart';
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
          create: (_) => getIt<StoreCubit>()..getProducts(),
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
          BlocBuilder<StoreCubit, StoreState>(
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
