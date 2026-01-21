import 'package:flutter/material.dart';

import '../../../../../../domain/domain.dart';
import '../../../../core.dart';

/* class AppSegmentedButton extends StatefulWidget {
  const AppSegmentedButton({
    super.key,
    required this.selected,
    required this.values,
    required this.onChanged,
  });
  final Set<SelectComponentModel> selected;
  final List<SelectComponentModel> values;
  final void Function(SelectComponentModel) onChanged;

  @override
  AppSegmentedButtonState createState() => AppSegmentedButtonState();
} */

class AppSegmentedButton extends StatelessWidget {
  const AppSegmentedButton({
    super.key,
    required this.selected,
    required this.values,
    required this.onChanged,
  });
  final Set<SelectComponentModel> selected;
  final List<SelectComponentModel> values;
  final void Function(SelectComponentModel) onChanged;

/*   @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }
 */
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: SegmentedButton<SelectComponentModel>(
        expandedInsets: EdgeInsets.zero,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return Theme.of(context).colorScheme.onSecondary;
            }
            return Theme.of(context).colorScheme.surface;
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: AppBorderRadius.pl,
            ),
          ),
        ),
        segments: values
            .map(
              (selectComponent) => ButtonSegment(
                value: selectComponent,
                label: Text(selectComponent.value),
              ),
            )
            .toList(),
        selected: selected,
        onSelectionChanged: (Set<SelectComponentModel> newSelection) {
          /*  setState(() {
            _selected = newSelection;
          }); 
           if (newSelection.isNotEmpty) {
            onChanged(newSelection.first);
          }
          */
          onChanged(newSelection.first);
        },
      ),
    );
  }
}
