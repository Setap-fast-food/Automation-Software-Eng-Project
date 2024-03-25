import '/components/heading_panel_widget.dart';
import '/components/main_panel_widget.dart';
import '/components/side_bar_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'components/main_panel_model.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';


class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HeadingPanel component.
  late HeadingPanelModel headingPanelModel;
  // Model for SidePanel.P
  late SideBarModel sidePanelModel;
  // Model for MainPanel component.
  late MainPanelModel mainPanelModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    headingPanelModel = createModel(context, () => HeadingPanelModel());
    sidePanelModel = createModel(context, () => SideBarModel());
    mainPanelModel = createModel(context, () => MainPanelModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headingPanelModel.dispose();
    sidePanelModel.dispose();
    mainPanelModel.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
