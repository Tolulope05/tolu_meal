import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = (widget.currentFilters['gluten'])!;
    _vegetarian = (widget.currentFilters['vegetarian'])!;
    _vegan = (widget.currentFilters['vegan'])!;
    _lactoseFree = (widget.currentFilters['lactose'])!;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your Meal Selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  activeColor: Theme.of(context).colorScheme.primary,
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
                  activeColor: Theme.of(context).colorScheme.primary,
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
                  activeColor: Theme.of(context).colorScheme.primary,
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
                  activeColor: Theme.of(context).colorScheme.primary,
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
