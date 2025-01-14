import 'package:flutter/material.dart';
import 'package:practice_4/model/coffee.dart';
import 'package:practice_4/pages/home_page.dart';
import 'package:practice_4/pages/second_page.dart';
import 'package:practice_4/pages/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Coffee> _favouriteCoffee = [];

  void _toggleFavourite(Coffee coffee) {
    setState(() {
      if (_favouriteCoffee.contains(coffee)){
        _favouriteCoffee.remove(coffee);
      } else {
        _favouriteCoffee.add(coffee);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomePage(
        onFavouriteToggle: _toggleFavourite,
        favouriteCoffee: _favouriteCoffee,
      ),
      SecondPage(
        favouriteCoffee: _favouriteCoffee,
        onFavouriteToggle: _toggleFavourite,
      ),
      const ThirdPage(),
    ];
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 187, 164, 132),
        onTap: _onItemTapped,
      ),
    );
  }
}
