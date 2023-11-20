import 'dart:math';

import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/navigation_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  bool multiple = true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
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
    var mq = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    bool isLightMode = brightness == Brightness.light;
    return Scaffold(
        backgroundColor:
            isLightMode == true ? AppTheme.white : AppTheme.nearlyBlack,
        body: Container(
            decoration: BoxDecoration(
                  
                  image: DecorationImage(colorFilter: ColorFilter.mode(AppTheme.nearlyWhite, BlendMode.color), fit: BoxFit.cover, image: AssetImage('assets/images/back1.jpg'))),
            
          width: double.infinity,
          height: double.infinity,
          child: Row(children: [
            orientation.index == 1
                ? Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              
                              fit: BoxFit.cover,
                              
                              
                              scale: 20,
                              image: AssetImage(
                                  'assets/images/login-background (1).jpg'))),
                    ),
                  )
                : Container(),
            Expanded(
              child: Container(
              
                padding: EdgeInsets.symmetric(vertical: 60),
                  child: Container(
                  color: AppTheme.nearlyWhite.withOpacity(0.7),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/eschool-account-logo.png',
                          width: mq.width * .3,
                        ),
                      SizedBox(height: MediaQuery.of(context).size.height*.2,),
                        Container(
                               
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: mq.width * .1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height*.06,
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon:  Icon(Icons.person),
                                  labelText: 'Username',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        30.0), // Adjust the border radius
                                    borderSide: BorderSide(
                                        color: AppTheme
                                            .dark_grey), // Adjust the border color
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*.06,
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon:  Icon(Icons.person),
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        30.0), // Adjust the border radius
                                    borderSide: BorderSide(
                                        color: AppTheme
                                            .dark_grey), // Adjust the border color
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                             Center(
                        child: Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (bool? value) {
                  setState(() {
                              
                  });
                              },
                            ),
                            Text('Accept Terms and Conditions'),
                          ],
                        ),
                      ),
                SizedBox(height: 10,),
                            InkWell(
                              
                      
                              onTap: () {
                                Get.off(NavigationHomeScreen());
                              },
                              child: Container(
                               height: MediaQuery.of(context).size.height*.06,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppTheme.darkText,
                                  
                                  borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        width: 1, color: AppTheme.lightText)),
                            child: Text("Log In",style: TextStyle(color: AppTheme.white),),
                              ),
                            )
                          ]),
                        ),
                        SizedBox(height: mq.height*.08,),
                        Text('@copyright reserved 2023 ~softpro~',style: AppTheme.caption.copyWith(color: AppTheme.dark_grey),)
                      ]),
                ),
              ),
            )
          ]),
        ));
  }
}
