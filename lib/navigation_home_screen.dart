import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/custom_drawer/home_drawer.dart';
import 'package:best_flutter_ui_templates/feedback_screen.dart';
import 'package:best_flutter_ui_templates/help_screen.dart';
import 'package:best_flutter_ui_templates/screens/home_screen.dart';
import 'package:best_flutter_ui_templates/invite_friend_screen.dart';
import 'package:flutter/material.dart';

import 'widgets/listStudentBottombar.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget  screenView = MyHomePage();
  DrawerIndex drawerIndex = DrawerIndex.HOME; 

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const MyHomePage();
    super.initState();
  }

 void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListStudentBottomBar();
      },
    );
 }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
           bottomNavigationBar: BottomAppBar(
            height: MediaQuery.of(context).size.height*.08,
            
            color: AppTheme.darkerText,
            shape: CircularNotchedRectangle(),
            child: Container(
              padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rabie kwayder (Omar)",
                          style:
                              AppTheme.body2.copyWith(color: AppTheme.nearlyWhite),
                        ),
                        SizedBox(height: 3,),
                         Text(
                          "Grade 5(A)",
                          style:
                              AppTheme.caption.copyWith(color: AppTheme.notWhite),
                        ),
                      ],
                    )
                  ],
                ))),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.darkerText,
          tooltip: 'Change Student',
          onPressed: () {
            _showBottomSheet();
          },
          child: Icon(
            Icons.person,
            color: AppTheme.white,
          ),
        ),
       
          drawer:  HomeDrawer(
              screenIndex: drawerIndex,
              callBackIndex: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            ),
          backgroundColor: AppTheme.nearlyWhite,
          body:  Builder(
        builder: (context) =>
          Stack(children: [
            screenView,
           Padding(
                    
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top + 8,
                            left: 8),
                        child: SizedBox(
                          
                          width: AppBar().preferredSize.height - 8,
                          height: AppBar().preferredSize.height - 8,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: ()=>Scaffold.of(context).openDrawer(),
                              borderRadius: BorderRadius.circular(
                                  AppBar().preferredSize.height),
                              child: Center(
                                // if you use your own menu view UI you add form initialization
                                child:Icon(Icons.menu)
                              ),
                           
                            ),
                          ),
                        ),
                      ),
            
          ],))
      )));
      
    
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = const MyHomePage();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = HelpScreen();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = FeedbackScreen();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            screenView = InviteFriend();
          });
          break;
        default:
          break;
      }
    }
  }
}
