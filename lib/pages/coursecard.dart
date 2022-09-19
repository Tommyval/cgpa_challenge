import 'package:cgpa_challenge/Services/provider.dart';
import 'package:cgpa_challenge/Utils/Utils.dart';
import 'package:cgpa_challenge/models/gpa_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseCard extends StatelessWidget {
  final Entry? entry;
  const CourseCard({Key? key, this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<Entries>(
        builder: (context, value, child) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'SUBJECT:',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Utils.textColor),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      entry!.title!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(entry!.credit!),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Grade And Unit:',
                        style: TextStyle(
                            color: Utils.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${entry!.grade!} (${entry!.gpa})',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 130,
                    ),
                    IconButton(
                        onPressed: () {
                          value.removeFromCard(entry!);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
