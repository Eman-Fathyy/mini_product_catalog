import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'login_page.dart';
import 'products_page.dart';
import 'details_page.dart';

/*
Lifecycle Questions

1. When the page first opens:
initState(), didChangeDependencies(), and build() run in order.

2. After pressing the heart button:
setState() updates the favorites counter and build() runs again.

3. When leaving the page and going back:
deactivate() and dispose() run when a page is permanently removed.
When returning from Details to Products, the Products page usually remains in the stack.

4. When resizing the browser:
didChangeDependencies() runs when the screen size dependency changes,
and build() updates the layout using MediaQuery.sizeOf(context).
A width below 600 uses ListView; a width of 600 or more uses GridView.

go_router Questions

1. context.go() navigates to a destination, while context.push()
adds a page to the navigation stack.

2. We use go for Login to Products and push for Products to Details
because we want to return from Details and receive a result.

3. A path parameter is part of the path, for example /details/Shoes/40.
A query parameter follows ?, for example /products?user=Guest.
*/

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const LoginPage();
      },
    ),

    GoRoute(
      name: 'products',
      path: '/products',
      builder: (context, state) {
        final username =
            state.uri.queryParameters['user'] ?? 'Guest';

        return ProductsPage(username: username);
      },
    ),

    GoRoute(
      name: 'details',
      path: '/details/:name/:price',
      builder: (context, state) {
        final name = state.pathParameters['name'] ?? 'Unknown';

        final price = int.tryParse(
          state.pathParameters['price'] ?? '',
        ) ??
            0;

        return DetailsPage(
          name: name,
          price: price,
        );
      },
    ),
  ],
);


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Mini Product Catalog',
      routerConfig: router,
    );
  }
}