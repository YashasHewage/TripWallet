import 'package:app/Models/expence.dart';
import 'package:app/widgets/expence_tile.dart';
import 'package:flutter/material.dart';


class ExpenceList extends StatelessWidget {
  final List<ExpenceModel> expenceList;
  final Function(ExpenceModel expence) onDeletedExpence;
  const ExpenceList(
      {super.key, required this.expenceList, required this.onDeletedExpence});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenceList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Dismissible(
              key: ValueKey(expenceList[index]),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                onDeletedExpence(expenceList[index]);
              },
              child: ExpenceTile(
                expence: expenceList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
