import 'package:assignment_m7/cart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  Map<double, String> products = {
    10.00: 'Product 1',
    15.00: 'Product 2',
    20.00: 'Product 3',
    25.00: 'Product 4',
    5.00: 'Product 5',
    30.00: 'Product 6',
    35.00: 'Product 7',
    21.00: 'Product 8',
    22.00: 'Product 9',
    16.00: 'Product 10',
    50.00: 'Product 11',
    60.00: 'Product 12',
    70.00: 'Product 13',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product List',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CartScreen(),
              ),
            );
          },
          child: const Icon(Icons.add_shopping_cart)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Scrollbar(
                child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title:
                              Text(products.values.elementAt(index).toString()),
                          subtitle:
                              Text("\$ ${products.keys.elementAt(index).toString()}"),
                          trailing: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text("Count : ${counter}"),
                                ElevatedButton(
                                    onPressed: () {
                                      counter = counter + 1;
                                      setState(() {});
                                      if (counter == 5) {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Congratulation!'),
                                                content: Text(
                                                    'You have bought 5 of ${products.values.elementAt(index).toString()}'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        counter = 0;
                                                      },
                                                      child: Text('Ok'))
                                                ],
                                              );
                                            });
                                      }
                                    },
                                    child: Text('Buy now'))
                              ],
                            ),
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        color: Colors.black,
                      );
                    },
                    itemCount: products.length)),
          ],
        ),
      ),
    );
  }
}
