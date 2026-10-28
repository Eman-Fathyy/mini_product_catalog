
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatefulWidget {
final String name;
final int price;

const DetailsPage({
super.key,
required this.name,
required this.price,
});

@override
State<DetailsPage> createState() {
return DetailsPageState();
}
}

class DetailsPageState extends State<DetailsPage> {
@override
void initState() {
super.initState();
print("DetailsPage: initState");
}

@override
void didChangeDependencies() {
super.didChangeDependencies();
print("DetailsPage: didChangeDependencies");
}

@override
Widget build(BuildContext context) {
print("DetailsPage: build");

return Scaffold(
appBar: AppBar(
title: const Text("Product Details"),
centerTitle: true,
leadingWidth: 65,
leading: GestureDetector(
onTap: () {
context.pop();
},
child: const Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.arrow_back,
size: 25,
),
Text(
"Back",
style: TextStyle(
fontSize: 11,
),
),
],
),
),
),
body: Center(
child: Padding(
padding: const EdgeInsets.all(24),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
// Shopping bag icon
Container(
width: 110,
height: 110,
decoration: BoxDecoration(
color: Colors.amber.withValues(alpha: 0.15),
shape: BoxShape.circle,
),
child: const Icon(
Icons.shopping_bag_outlined,
size: 65,
color: Colors.amber,
),
),

const SizedBox(height: 30),

// Product name
Text(
widget.name,
textAlign: TextAlign.center,
style: const TextStyle(
fontSize: 28,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 15),

// Product price
Text(
"\$${widget.price}",
style: const TextStyle(
fontSize: 24,
color: Colors.amber,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 40),

// Add to Cart button
SizedBox(
width: double.infinity,
height: 58,
child: ElevatedButton.icon(
onPressed: () {
// Navigator version:
// Navigator.pop(
//   context,
//   "${widget.name} added to cart",
// );

// go_router version:
context.pop("${widget.name} added to cart");
},
icon: const Icon(
Icons.shopping_cart_outlined,
size: 24,
),
label: const Text(
"Add to Cart",
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
style: ElevatedButton.styleFrom(
backgroundColor: Colors.deepPurpleAccent,
foregroundColor: Colors.white,
shape: const StadiumBorder(),
elevation: 5,
),
),
),
],
),
),
),
);
}

@override
void deactivate() {
print("DetailsPage: deactivate");
super.deactivate();
}

@override
void dispose() {
print("DetailsPage: dispose");
super.dispose();
}
}
