import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:best_flutter_ui_templates/widgets/homeWidgets/cardView.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController? animationController;
  bool multiple = true;
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Scaffold(
      
        backgroundColor:
            isLightMode == true ? AppTheme.white : AppTheme.nearlyBlack,
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              appBar(),
              Expanded(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                       
                  child: Column(children: [
                      CardView(titleCard: 'Agenda',),
                       CardView(titleCard: 'Upcoming Exam',),
                       CardView(titleCard: 'Weekly Exercises',)
                  ]),
                ),
              )
            
            ],
          ),
        ));
  }

  Widget appBar() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(AppTheme.nearlyWhite, BlendMode.color),
              opacity: 0.7,
              fit: BoxFit.cover,
              image: AssetImage("assets/images/back1.jpg"))),
      child: AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
            child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white.withOpacity(topBarOpacity),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppTheme.darkerText
                            .withOpacity(0.4 * topBarOpacity),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16 - 8.0 * topBarOpacity,
                      bottom: 12 - 8.0 * topBarOpacity),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Training',
                              textAlign: TextAlign.left,
                              style: AppTheme.headline
                                  .copyWith(color: AppTheme.darkText)),
                        ),
                      ),
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(32.0)),
                          onTap: () {},
                          child: Center(
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: AppTheme.darkerText,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(
                                Icons.calendar_today,
                                color: AppTheme.darkerText,
                                size: 18,
                              ),
                            ),
                            Text(
                              '15 May',
                              textAlign: TextAlign.left,
                              style: AppTheme.subtitle.copyWith(color: AppTheme.darkerText,fontWeight: FontWeight.bold)
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(32.0)),
                          onTap: () {},
                          child: Center(
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: AppTheme.darkerText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }


  

Widget smallCardView(){
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(
            left: 24, right: 24, top: 0, bottom: 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppTheme.darkerText.withOpacity(0.4),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(8.0)),
                      child: SizedBox(
                        height: 74,
                        child: AspectRatio(
                          aspectRatio: 1.714,
                          child: Image.asset(
                              "assets/fitness_app/back.png"),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 100,
                                      right: 16,
                                      top: 16,
                                    ),
                                    child: Text(
                                      "You're doing great!",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily:
                                            AppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        letterSpacing: 0.0,
                                        color:
                                            AppTheme.darkerText,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 100,
                                  bottom: 12,
                                  top: 4,
                                  right: 16,
                                ),
                                child: Text(
                                  "Keep it up\nand stick to your plan!",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    letterSpacing: 0.0,
                                    color: AppTheme.darkerText
                                        .withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Icon(Icons.arrow_circle_right_outlined),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -16,
              left: 0,
              child: SizedBox(
                width: 110,
                height: 110,
                child: Image.asset("assets/fitness_app/runner.png"),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
}
