import 'package:flutter/material.dart';
import 'package:practice_4/components/item_note.dart';
import 'package:practice_4/model/coffee.dart';


class SecondPage extends StatelessWidget {
  final List<Coffee> favouriteCoffee;
  final Function(Coffee) onFavouriteToggle;

  const SecondPage(
      {super.key,
      required this.favouriteCoffee,
      required this.onFavouriteToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: favouriteCoffee.isNotEmpty
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: favouriteCoffee.length,
                itemBuilder: (BuildContext context, int index) {
                  final coffee = favouriteCoffee[index];
                  return ItemNote(
                    coffee: coffee,
                    isFavourite: true,
                    onFavouriteToggle: () {
                      onFavouriteToggle(coffee);
                    },
                  );
                },
              )
            : const Center(
                child: Text('Нет избранных напитков'),
              ),
      ),
    );
  }
}
