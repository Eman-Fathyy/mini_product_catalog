import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
final List<Map<String, dynamic>> products;
final void Function() onFavoritePressed;
final void Function(int index) onProductTap;

const ProductsListView({
super.key,
required this.products,
required this.onFavoritePressed,
required this.onProductTap,
});

@override
Widget build(BuildContext context) {
return ListView.builder(
itemCount: products.length,
padding: const EdgeInsets.all(10),
itemBuilder: (context, index) {
return ProductTile(
name: products[index]["name"],
price: products[index]["price"],
onFavoritePressed: onFavoritePressed,
onTap: () {
onProductTap(index);
},
);
},
);
}
}

class ProductsGridView extends StatelessWidget {
final List<Map<String, dynamic>> products;
final void Function() onFavoritePressed;
final void Function(int index) onProductTap;

const ProductsGridView({
super.key,
required this.products,
required this.onFavoritePressed,
required this.onProductTap,
});

@override
Widget build(BuildContext context) {
return GridView.builder(
padding: const EdgeInsets.all(10),
itemCount: products.length,
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
childAspectRatio: 4,
crossAxisSpacing: 8,
mainAxisSpacing: 8,
),
itemBuilder: (context, index) {
return ProductTile(
name: products[index]["name"],
price: products[index]["price"],
onFavoritePressed: onFavoritePressed,
onTap: () {
onProductTap(index);
},
);
},
);
}
}

class ProductTile extends StatelessWidget {
final String name;
final int price;
final void Function() onFavoritePressed;
final void Function() onTap;

const ProductTile({
super.key,
required this.name,
required this.price,
required this.onFavoritePressed,
required this.onTap,
});

@override
Widget build(BuildContext context) {
return Card(
elevation: 3,
color: const Color(0xFF252538),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16),
side: BorderSide(
color: Colors.white.withOpacity(0.08),
),
),
child: ListTile(
contentPadding: const EdgeInsets.symmetric(
horizontal: 14,
vertical: 2,
),

title: Text(
name,
style: const TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
),
),

subtitle: Text(
"\$$price",
style: const TextStyle(
color: Colors.amber,
fontSize: 14,
fontWeight: FontWeight.w600,
),
),

trailing: Container(
decoration: BoxDecoration(
color: Colors.redAccent.withOpacity(0.12),
shape: BoxShape.circle,
),
child: IconButton(
icon: const Icon(Icons.favorite_border),
color: Colors.redAccent,
tooltip: "Add to Favorites",
onPressed: onFavoritePressed,
),
),

onTap: onTap,
),
);
}
}

