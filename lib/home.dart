import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation1, animation2;

  AnimationController animationController1;

  Current_state _currentState;

  double _height;

  @override
  void initState() {
    super.initState();

    _height = 170.0;
    _currentState = Current_state.SHOW_BUTTON;

    animationController1 = AnimationController(
        duration: Duration(milliseconds: 1030), vsync: this);

    Tween<double> t1 = Tween(begin: 1.0, end: 0.0);

    animation1 = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController1,
      curve: Interval(
        0.0,
        0.1,
        curve: Curves.easeInOut,
      ),
    ));

    animation2 = ReverseTween<double>(t1).animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: animationController1,
    ));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              left: (_currentState == Current_state.SHOW_BUTTON) ? 0 : 120.0,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: (_currentState == Current_state.SHOW_BUTTON) ? 0 : 1.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 320.0, left: 100.0),
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      width: 50.0,
                      height: 50.0,
                      child: InkWell(
                        onTap: (){
                          //Make button do something
                        },
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 50.0,
                          width: 50.0,
                          child: Image(
                            image: AssetImage('assets/images/Group4.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              left: (_currentState == Current_state.SHOW_BUTTON) ? 0 : 60.0,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: (_currentState == Current_state.SHOW_BUTTON) ? 0 : 1.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 320.0, left: 100.0),
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      width: 50.0,
                      height: 50.0,
                      child: InkWell(
                        onTap: () {
                          //make button do something
                        },
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 50.0,
                          width: 50.0,
                          child: Image(
                            image: AssetImage('assets/images/Group3.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 320.0, left: 100.0),
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10.0),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  height: 50.0,
                  width: _height,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _height = (_height == 170.0) ? 50.0 : 170.0;

                        if (_currentState == Current_state.SHOW_BUTTON) {
                          _currentState = Current_state.SHOW_CANCEL;
                          animationController1.forward();
                        } else if (_currentState == Current_state.SHOW_CANCEL){
                          _currentState = Current_state.SHOW_BUTTON;
                          animationController1.reverse();
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 50.0,
                      child: IndexedStack(index: 0, children: <Widget>[
                        Stack(children: <Widget>[
                          Container(
                            child: FadeTransition(
                              opacity: animation2,
                              child: Center(
                                child: Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                  size: 22.0,
                                ),
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 1080),
                            curve: Curves.easeInOut,
                            height: 50.0,
                            width: _height,
                            child: FadeTransition(
                              opacity: animation1,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "Share",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: Colors.white,
                                    size: 22.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

enum Current_state {
  SHOW_BUTTON,
  SHOW_CANCEL,
}
