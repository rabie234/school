import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';

class SingleAgendaCard extends StatelessWidget {
  const SingleAgendaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: AppTheme.grey.withOpacity(0.2),
                  offset: Offset(1.1, 1.1),
                  blurRadius: 10.0),
            ],
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.inventory_outlined),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Francais',
                      textAlign: TextAlign.center,
                      style: AppTheme.title
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppTheme.chipBackground,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9, left: 16, right: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      
                        """A la fin des textes, un exercice sous forme de QCM permet de valider ses acquis. l'édition gratuite des textes sous forme de PDF est un vrai plus. Désormais la langue de Molière n'aura plus de secret pour vous.""".trim(),style: AppTheme.body2.copyWith(color: AppTheme.dark_grey),)
                  ],
                ),
              ),
            SizedBox(height: 10,),
              Container(
                color: AppTheme.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 8, bottom: 16),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(backgroundColor: AppTheme.grey,child: Icon(Icons.person,color: AppTheme.nearlyWhite,),),
                      SizedBox(width: 10,),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Mohamad Dhaybi",style: AppTheme.subtitle.copyWith(color: AppTheme.darkText),),
                           Text("created : 13 November 1:21 pm",style: AppTheme.caption.copyWith(color: AppTheme.lightText),)
                         ],
                       )
                        ],
                      )
                    
                    ],
                  )
                ),
              )
            ],
          ),
        ));
  }
}
