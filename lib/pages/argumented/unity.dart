import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';



class Vuforia extends StatefulWidget {
  @override
  _VuforiaState createState() => _VuforiaState();
}

class _VuforiaState extends State<Vuforia> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  UnityWidgetController _unityWidgetController;
  bool paused = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Unity Flutter Demo'),
        ),
        body: Container(
            child: Stack(
          children: <Widget>[
            UnityWidget(
              onUnityViewCreated: onUnityCreated,
              isARScene: true,
            ),
            // Positioned(
            //   bottom: 40.0,
            //   left: 80.0,
            //   right: 80.0,
            //   // child: MaterialButton(
            //   //   onPressed: () {

            //   //     if(paused) {
            //   //       _unityWidgetController.resume();
            //   //       setState(() {
            //   //         paused = false;
            //   //       });
            //   //     } else {
            //   //       _unityWidgetController.pause();
            //   //       setState(() {
            //   //         paused = true;
            //   //       });
            //   //     }
            //   //   },
            //   //   color: Colors.blue[500],
            //   //   child: Text(paused ? 'Start Game' : 'Pause Game'),
            //   // ),
            // ),
          ],
        )),
      ),
    );
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }
}
