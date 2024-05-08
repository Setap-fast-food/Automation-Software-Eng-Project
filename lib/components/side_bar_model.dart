import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'side_bar_widget.dart';


class SideBarModel extends FlutterFlowModel<SideBarWidget> {
  late List<bool> _selectionStatus;
  late int _selectedIndex;

  int get selectedIndex => _selectedIndex;

  @override
  void initState(BuildContext context) {
    _selectionStatus = List.generate(3, (index) => false); // Assuming 3 options initially
    _selectedIndex = 0; // Default selection
  }

  void setSelectedIndex(int index) {
    for (int i = 0; i < _selectionStatus.length; i++) {
      _selectionStatus[i] = (i == index);
    }
    _selectedIndex = index;
    onUpdate(); // Notify widget to update UI
  }

  @override
  void dispose() {}
}
