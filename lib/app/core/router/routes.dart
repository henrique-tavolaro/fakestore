import 'package:go_router/go_router.dart';

import '../../presentation/pages/home/home_page.dart';

final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomePage();
        }
      )
    ]
);
