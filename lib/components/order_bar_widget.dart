import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart'; // Assuming this is your custom UI package

import 'order_bar_model.dart';
export 'order_bar_model.dart';

class OrderBarWidget extends StatefulWidget {
  final int orderId; // Unique identifier for the OrderBarWidget
  final String orderNumText;
  final String timePlacedText;
  final VoidCallback onDonePressed; // Callback function for when "Done" is pressed

  const OrderBarWidget({
    Key? key,
    required this.orderId,
    required this.orderNumText,
    required this.timePlacedText,
    required this.onDonePressed,
  }) : super(key: key);

  @override
  State<OrderBarWidget> createState() => _OrderBarWidgetState();
}

class _OrderBarWidgetState extends State<OrderBarWidget> {
  late OrderBarModel _model;
  bool _isExpanded = false; // Flag to track whether the extra content is expanded or not
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.greenAccent,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          child: Text(
                            widget.orderNumText,
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          child: Text(
                            'Time Placed: ${widget.timePlacedText}',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded; // Toggle the flag
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text(
                              '⌄',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        if (_isExpanded) // Display the expanded content if _isExpanded is true
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  height: 400, // Set the expanded container height to 400
                  child: Align(
                    alignment: Alignment.centerLeft, // Align text to the left
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Order Goes Here',
                        style: TextStyle(color: Colors.black), // Set text color
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: widget.onDonePressed,
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 80), // Set the size to 200x80
                        shape: RoundedRectangleBorder(
                          // Make the button not rounded
                          borderRadius: BorderRadius.zero,
                        ),
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white),
                    child: Text('Done'),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
