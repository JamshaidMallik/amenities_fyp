import 'package:amenities_app/constant.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Now"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          children: [
            Card(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal.shade300,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                  child: ListTile(
                    leading: Container(
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        "https://i.pinimg.com/564x/ee/55/08/ee5508020993c264524edce53aeb3636.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: const Text("Replace Your Order"),
                    subtitle: const Text("Pending"),
                  ),
                ),
              ),
            ),
            10.0.height,
            Card(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal.shade300,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                  child: ListTile(
                    leading: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        "https://i.pinimg.com/564x/ee/55/08/ee5508020993c264524edce53aeb3636.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: const Text("Replace Your Order"),
                    subtitle: const Text("complete"),
                  ),
                ),
              ),
            ),
            10.0.height,
            Card(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal.shade300,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                  child: ListTile(
                    leading: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        "https://i.pinimg.com/564x/ee/55/08/ee5508020993c264524edce53aeb3636.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: const Text("Replace Your Order"),
                    subtitle: const Text("Pending"),
                  ),
                ),
              ),
            ),
            10.0.height,
            Card(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal.shade300,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                  child: ListTile(
                    leading: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        "https://i.pinimg.com/564x/c3/6b/f5/c36bf56ef27f06b96964bd7d93da635f.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: const Text("Replace Your Order"),
                    subtitle: const Text("Complete"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
