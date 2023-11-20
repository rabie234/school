

import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/widgets/agendaWidgets/single_agenda.dart';
import 'package:flutter/material.dart';

import 'package:grouped_list/grouped_list.dart';

class Agenda extends StatefulWidget {
  const Agenda({super.key});

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  
List _elements = [
  {'name': 'John', 'group': 'Thusday 20-09-2023'},
  {'name': 'Will', 'group': 'Wednsday 22-10-2023'},
  {'name': 'Beth', 'group': 'Thusday 20-09-2023'},
  {'name': 'Miranda', 'group': 'Wednsday 22-10-2023'},
  {'name': 'Mike', 'group': 'Friday 02-12-2023'},
  {'name': 'Danny', 'group': 'Friday 02-12-2023'},
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     
        backgroundColor: AppTheme.dark_grey,
        title: Text("Agenda")),
        body: GroupedListView<dynamic, String>(
          floatingHeader: true,
          scrollDirection: Axis.vertical,
          elements: _elements,
          groupBy: (element) => element['group'],
          groupComparator: (value1, value2) => value2.compareTo(value1),
          itemComparator: (item1, item2) =>
              item1['name'].compareTo(item2['name']),
          order: GroupedListOrder.DESC,
          useStickyGroupSeparators: true,
          groupSeparatorBuilder: (String value) => Padding(
            padding: const EdgeInsets.all(0),
            
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,
            color: AppTheme.dark_grey,
            ),
            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 10),
            child: Text(
              
              value,style: AppTheme.subtitle.copyWith(color: AppTheme.white),)),
          ),
          itemBuilder: (c, element) {
            return SingleAgendaCard();
          },
        ),
      
    

    );
  }
}