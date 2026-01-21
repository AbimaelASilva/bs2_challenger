import 'package:flutter/material.dart';

import '../../../../../domain/domain.dart';

class AppSelectableChips extends StatefulWidget {
  final List<SelectComponentModel> items;
  final void Function(SelectComponentModel) onSelectionChanged;
  final SelectComponentModel selected;

  const AppSelectableChips({
    super.key,
    required this.items,
    required this.onSelectionChanged,
    required this.selected,
  });

  @override
  State<AppSelectableChips> createState() => _AppSelectableChipsState();
}

class _AppSelectableChipsState extends State<AppSelectableChips> {
  late SelectComponentModel _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.items.map((item) {
          final isSelected = _selected == item;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(item.value),
              elevation: 0.5,
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selected = item;
                  widget.onSelectionChanged(_selected);
                });
              },
              selectedColor: Theme.of(context).colorScheme.onSecondary,
              backgroundColor: Theme.of(context).colorScheme.surface,
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
