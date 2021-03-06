import 'package:flutter/material.dart';
import 'package:flutter_custom_paint_test/CustomSplash/SplashPainter.dart';

class CustomSplashWidget extends StatefulWidget{

  final String imageSrc;
  VoidCallback  onTapCustom;

  CustomSplashWidget({this.imageSrc, this.onTapCustom});

  @override
  State<StatefulWidget> createState() {
    
    return CustomSplashState();
  }

}

class CustomSplashState extends State<CustomSplashWidget> with SingleTickerProviderStateMixin{

  double _factionTime = 0.0;
  Animation<double> animation;
  int numberOfClickToJumpToNextScreen = 0;

  @override
  void initState() {
    
    super.initState();

    var animationController = AnimationController(
        duration: Duration(milliseconds: 5000), vsync: this);

    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animation.addListener(() {
        setState(() {
          _factionTime = animation.value;
        });
      });

    animation.addStatusListener((status){
      switch (status) {
        case AnimationStatus.completed:
          animationController.reverse();
          break;
        case AnimationStatus.dismissed:
          animationController.forward();
          break;
        default:
      }
    });
    animationController.forward();
    
  }

  @override
  Widget build(BuildContext context) {
    
    return CustomPaint(
      painter: SplashPainter(fractionTime: _factionTime),
      child: Center(
        child: Stack(
          children: <Widget>[
            Container(),
            //Text("_fractionTime: $_factionTime"),
            Positioned(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0,
              child: Center(child:
              GestureDetector(
                onTap: (){
                  numberOfClickToJumpToNextScreen++;
                  print("Numb to jump to next screen $numberOfClickToJumpToNextScreen");
                  if(numberOfClickToJumpToNextScreen == 10){
                      widget.onTapCustom();
                  }
                },
                child: Container(
                height: 250.0 * (1.3 - _factionTime) * (0.9 + 0.1 * numberOfClickToJumpToNextScreen),
                width: 250.0 * (1.3 - _factionTime) * (0.9 + 0.1 * numberOfClickToJumpToNextScreen),
                child: Image.asset(widget.imageSrc))),
              ),
            )
          ],
        ),
      ),
    );
  }

}