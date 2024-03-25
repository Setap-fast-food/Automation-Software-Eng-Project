import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import 'side_bar_model.dart';
export 'side_bar_model.dart';

class SideBarWidget extends StatefulWidget {
  const SideBarWidget({Key? key}) : super(key: key);

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  late SideBarModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded( // Wrap the Column with Expanded
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildOption(0, 'Active Orders'),
                _buildOption(1, 'Completed Orders'),
                _buildOption(2, 'Edit Menu'),
              ],
            ),
          ),
        ],
      ),
    );
  }

Widget _buildOption(int index, String title) {
  return GestureDetector(
    onTap: () {
      setState(() {
        _model.setSelectedIndex(index);
        switch (index) {
          case 0:
            // RETRIEVE ORDERS THAT ARE ACTIVE AND LIST
            break;
          case 1:
            // RETRIEVE ORDERS THAT ARE COMPLETED AND LIST
            break;
          case 2:
            // MENU EDITING
            break;
        }
      });
    },
    child: Container(
      width: double.infinity,
      height: 85,
      decoration: BoxDecoration(
        color: _model.selectedIndex == index
            ? Colors.grey.withOpacity(0.6)
            : FlutterFlowTheme.of(context).secondaryBackground,
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryText,
        ),
      ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
        ),
      ),
    );
  }
}
