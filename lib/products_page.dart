import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'product_widgets.dart';
import 'products_data.dart';
import 'details_page.dart';

class ProductsPage extends StatefulWidget {
final String username;

const ProductsPage({
super.key,
required this.username,
});

@override
State<ProductsPage> createState() {
return ProductsPageState();
}
}

class ProductsPageState extends State<ProductsPage> {
int favorites = 0;

String cartMessage = "";

late Size screenSize;

@override
void initState() {
super.initState();
print("ProductsPage: initState");
}

@override
void didChangeDependencies() {
super.didChangeDependencies();

screenSize = MediaQuery.sizeOf(context);

print(
"ProductsPage: didChangeDependencies -> "
"width: ${screenSize.width}, "
"height: ${screenSize.height}",
);
}

@override
void deactivate() {
print("ProductsPage: deactivate");
super.deactivate();
}

@override
void dispose() {
print("ProductsPage: dispose");
super.dispose();
}

@override
Widget build(BuildContext context) {
print("ProductsPage: build");

return Scaffold(
appBar: AppBar(
title: const Text("Products"),
centerTitle: true,
),
body: Column(
children: [
const SizedBox(height: 10),

Text(
"Welcome, ${widget.username}",
style: const TextStyle(
fontSize: 22,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 10),

Text("Favorites: $favorites"),

const SizedBox(height: 10),

Text("Screen width: ${screenSize.width}"),

if (cartMessage.isNotEmpty)
Container(
width: double.infinity,
margin: const EdgeInsets.symmetric(
horizontal: 16,
vertical: 10,
),
padding: const EdgeInsets.all(16),
decoration: BoxDecoration(
color: Colors.green.withOpacity(0.15),
borderRadius: BorderRadius.circular(16),
border: Border.all(
color: Colors.greenAccent,
width: 1.2,
),
),
child: Row(
children: [
const Icon(
Icons.check_circle,
color: Colors.greenAccent,
size: 28,
),

const SizedBox(width: 12),

Expanded(
child: Text(
cartMessage,
style: const TextStyle(
color: Colors.greenAccent,
fontSize: 16,
fontWeight: FontWeight.bold,
),
),
),
],
),
),

Expanded(
child: screenSize.width < 600
? ProductsListView(
products: products,

onFavoritePressed: () {
setState(() {
favorites++;
});
},

onProductTap: (index) async {
// Navigator version - Part 2:
// final result = await Navigator.push<String>(
//   context,
//   MaterialPageRoute(
//     builder: (context) => ProductDetailsPage(
//       name: products[index]['name'] as String,
//       price: products[index]['price'] as int,
//     ),
//   ),
// );
//
// if (result != null) {
//   setState(() {
//     cartMessage = result;
//   });
// }

final result = await context.pushNamed<String>(
'details',
pathParameters: {
'name': products[index]['name'],
'price': products[index]['price'].toString(),
},
);

if (result != null) {
setState(() {
cartMessage = result;
});
}
},
)
    : ProductsGridView(
products: products,

onFavoritePressed: () {
setState(() {
favorites++;
});
},

onProductTap: (index) async {
final result = await context.pushNamed<String>(
'details',
pathParameters: {
'name': products[index]['name'],
'price': products[index]['price'].toString(),
},
);

if (result != null) {
setState(() {
cartMessage = result;
});
}
},
),
),
],
),
);
}
}
