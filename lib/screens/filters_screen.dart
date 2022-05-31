import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Hello Tee, How are you?',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: const Text('Gluten Free'),
                  subtitle: const Text('Only include Gluten Free Meal'),
                  value: _glutenFree,
                  onChanged: (newvalue) {
                    setState(
                      () {
                        _glutenFree = newvalue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  title: const Text('Lactose Free'),
                  subtitle: const Text('Only include Lactose Free Meal'),
                  value: _lactoseFree,
                  onChanged: (newvalue) {
                    setState(
                      () {
                        _lactoseFree = newvalue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegetarian'),
                  subtitle: const Text('Only include Vegetarian Meal'),
                  value: _vegetarian,
                  onChanged: (newvalue) {
                    setState(
                      () {
                        _vegetarian = newvalue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegan'),
                  subtitle: const Text('Only include Vegan Free Meal'),
                  value: _vegan,
                  onChanged: (newvalue) {
                    setState(
                      () {
                        _vegan = newvalue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
