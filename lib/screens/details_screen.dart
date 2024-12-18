import 'package:flutter/material.dart';
 
import 'package:project_it/screens/summery_screen.dart';
import 'package:project_it/widgets/common_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Latte",
          style: TextStyle(color: Colors.brown, fontSize: 30),
        ),
        backgroundColor: Colors.brown[50],
        toolbarHeight: 100,
        elevation: 0,
      ),
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.brown[50],
              child: Image.asset('assets/images/coffee_cup.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Latte",
                        style: TextStyle(fontSize: 20, color: Colors.brown),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(Icons.remove),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                          Icon(Icons.add)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Size",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.brown,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Image.asset('assets/images/coffee_cup.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/coffee_cup.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Sugar",
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        "0%",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "25%",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "50%",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "100%",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            GestureDetector(
                onTap: (() => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SummeryScreen()),
                    )),
                child: submitButton("Add to cart"))
          ],
        ),
      ),
    );
  }
}
