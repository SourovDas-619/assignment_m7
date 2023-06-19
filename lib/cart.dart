
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
 CartScreen({super.key, model});


  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart',style: TextStyle(fontSize: 24),),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' Total products 5 ',style: TextStyle(fontSize: 24),)
            ],
          ),
      ),
    );
  }
}
