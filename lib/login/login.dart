import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'keypad.dart';
import '/home_page_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _pinController; // Define controller for PIN field

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController(); // Initialize controller
  }

  @override
  void dispose() {
    _pinController.dispose(); // Dispose controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss keyboard when tapped outside the text field
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                child: Container(
                                  width: 600,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: Color(0x943981EF),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 30),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: PinCodeTextField(
                                              controller:
                                                  _pinController, // Use controller
                                              autoDisposeControllers: false,
                                              appContext: context,
                                              length: 4,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              enableActiveFill: false,
                                              autoFocus: true,
                                              enablePinAutofill: false,
                                              errorTextSpace: 16,
                                              showCursor: true,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              obscureText: false,
                                              hintCharacter: '●',
                                              keyboardType:
                                                  TextInputType.number,
                                              pinTheme: PinTheme(
                                                fieldHeight: 44,
                                                fieldWidth: 44,
                                                borderWidth: 2,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12),
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                ),
                                                shape: PinCodeFieldShape.box,
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                inactiveColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                selectedColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                activeFillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                inactiveFillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                selectedFillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                              onChanged: (_) {},
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                            ),
                                          ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          if (_pinController.text.length == 4 &&
                                              _pinController.text == '1234') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePageWidget(),
                                              ),
                                            );
                                          } else {
                                            print("Invalid pin code");
                                          }
                                        },
                                        text: 'Login',
                                        options: FFButtonOptions(
                                          height: 40,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24, 0, 24, 0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          color: Color(0xFF09A433),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: NumericKeypad(
                                  controller: _pinController, // Pass controller
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
