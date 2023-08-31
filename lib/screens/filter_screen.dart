import 'package:flutter/material.dart';
import 'package:tour_guide/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen(
      {Key? key, required this.saveFilter, required this.currentFilter})
      : super(key: key);
  static const filterRoute = '/filters';
  final Function saveFilter;
  final Map<String, bool> currentFilter;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isInSummer = false, _isInWinter = false, _isForFamily = false;

  @override
  void initState() {
    _isInSummer = widget.currentFilter['summer']!;
    _isInWinter = widget.currentFilter['winter']!;
    _isForFamily = widget.currentFilter['family']!;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.indigo[900],
            ),
            Text('  Filter Search',
                style: TextStyle(color: Colors.indigo[900])),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'summer': _isInSummer,
                'winter': _isInWinter,
                'family': _isForFamily,
              };
              widget.saveFilter(selectedFilters);
            },
          ),
        ],
        backgroundColor: Colors.blue[200],
      ),
      drawer: DrawerWidget(),
      body: Column(children: [
        Expanded(
          child: ListView(
            children: [
              buildSwitchListTile(
                'Summer Trips',
                'Choose summer Trips only',
                _isInSummer,
                (newValue) {
                  setState(() {
                    _isInSummer = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                'Winter Trips',
                'Choose Winter Trips only',
                _isInWinter,
                (newValue) {
                  setState(() {
                    _isInWinter = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                'Family Trips',
                'Choose Family Trips only',
                _isForFamily,
                (newValue) {
                  setState(() {
                    _isForFamily = newValue;
                  });
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }

  SwitchListTile buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    void Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
