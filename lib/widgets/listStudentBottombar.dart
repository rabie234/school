

import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';


class ListStudentBottomBar extends StatefulWidget {
  const ListStudentBottomBar({super.key});

  @override
  State<ListStudentBottomBar> createState() => _ListStudentBottomBarState();
}

class _ListStudentBottomBarState extends State<ListStudentBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          height: 300,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
               decoration: BoxDecoration( color:Colors.blue.withOpacity(0.5),borderRadius: BorderRadius.circular(10)),
                child: Row(children: [
                Icon(Icons.switch_account_outlined,color: AppTheme.lightText,),
                SizedBox(width: 10,),
                  Column(
                    
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rabie kwayder (Omar)",
                              style:
                                  AppTheme.body2.copyWith(color: AppTheme.darkText),
                            ),
                            SizedBox(height: 3,),
                             Text(
                              "Grade 5(A)",
                              style:
                                  AppTheme.caption.copyWith(color: AppTheme.lightText),
                            ),
                          ],
                        )
                ],),
              ),
                Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
               decoration: BoxDecoration( color: AppTheme.chipBackground,borderRadius: BorderRadius.circular(10)),
                child: Row(children: [
                Icon(Icons.switch_account_outlined,color: AppTheme.lightText,),
                SizedBox(width: 10,),
                  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rabie kwayder (Mohamad)",
                              style:
                                  AppTheme.body2.copyWith(color: AppTheme.darkText),
                            ),
                            SizedBox(height: 3,),
                             Text(
                              "Grade 3(B)",
                              style:
                                  AppTheme.caption.copyWith(color: AppTheme.lightText),
                            ),
                          ],
                        )
                ],),
              ),
                Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
               decoration: BoxDecoration( color: AppTheme.chipBackground,borderRadius: BorderRadius.circular(10)),
                child: Row(children: [
                Icon(Icons.switch_account_outlined,color: AppTheme.lightText,),
                SizedBox(width: 10,),
                  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rabie kwayder (Khadija)",
                              style:
                                  AppTheme.body2.copyWith(color: AppTheme.darkText),
                            ),
                            SizedBox(height: 3,),
                             Text(
                              "Grade 8(A)",
                              style:
                                  AppTheme.caption.copyWith(color: AppTheme.lightText),
                            ),
                          ],
                        )
                ],),
              )
            ],),
          )
        );;
  }
}