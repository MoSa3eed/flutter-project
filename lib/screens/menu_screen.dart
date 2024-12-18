import 'package:flutter/material.dart';
import 'package:project_it/screens/details_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> coffeeTitle = [
      "Espresso",
      "Cappuccino",
      "Mocha",
      "Latte",
      "Macchiato"
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MENU",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 40,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.brown[50],
        toolbarHeight: 100,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.search,
              color: Colors.brown,
              size: 40,
            ),
          )
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(items: const [
      //   BottomNavigationBarItem(icon: Icon(Icons.menu), label: "menu"),
      //   BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
      // ]),
      body: SingleChildScrollView(child: content(coffeeTitle)),
    );
  }

  Widget content(List<String> coffeeTitle) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text.rich(
            TextSpan(
                text: "It's Great ",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.brown[900],
                ),
                children: const [
                  TextSpan(
                    text: "Day for Coffee.",
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 35,
                    ),
                  ),
                ]),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
            itemCount: coffeeTitle.length,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Image.asset('assets/images/coffee_cup.png'),
                  title: Text(
                    coffeeTitle[index],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: (() => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const DetailsScreen()),
                        )),
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                      size: 30,
                    ),
                  ),
                ),
              );
            }))
      ],
    );
  }
}
