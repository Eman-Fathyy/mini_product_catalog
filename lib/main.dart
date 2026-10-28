import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'login_page.dart';
import 'products_page.dart';
import 'details_page.dart';

/*
PART 1: LIFECYCLE QUESTIONS

a) When opening a page for the first time:
   initState()
   didChangeDependencies()
   build()

b) After pressing the favorite button:
   setState() triggers build() again.

c) When leaving a page:
   deactivate() is called when the page leaves the widget tree.
   dispose() is called when the page is permanently removed.

d) When resizing the browser:
   didChangeDependencies() runs again because MediaQuery changes.
   build() runs again to update the responsive layout.


PART 4: GO_ROUTER QUESTIONS

1) context.go() vs context.push():

   context.go() navigates to a new location and updates the
   route stack. Example: Login -> Products.

   context.push() pushes a new page onto the navigation stack
   and can return a result. Example: Products -> Details.

2) Why use go for Login -> Products?

   Because we do not want to return to Login using the Back button.

   Why use push for Products -> Details?

   Because we want to return to Products and receive the result
   from the Details page.

3) Path parameters vs Query parameters:

   Path parameter:
   /details/Laptop/1200

   Query parameter:
   /products?user=Guest

   Path parameters are part of the route path.
   Query parameters are added after ? in the URL.
*/


// ============================================================
// PART 2: NAVIGATOR VERSION
// This version is kept as comments as required by the assignment.
// ============================================================

/*

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),

        '/products': (context) {
          final username =
              ModalRoute.of(context)!.settings.arguments as String? ?? "Guest";

          return ProductsPage(username: username);
        },
      },
    ),
  );
}

*/

// ============================================================
// PART 3: GO_ROUTER VERSION
// This is the active version.
// ============================================================

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