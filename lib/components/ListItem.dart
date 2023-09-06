import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String exercisename;
  final String exercisetype;
  final String muscletype;
  final Function func;

  ListItem(this.exercisename, this.exercisetype, this.muscletype, this.func);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:12.0, right: 12.0, top: 6.0, bottom: 6.0),
      child: GestureDetector(
        onTap: () {
          func.call();
        },
        child: Container(
      
          width: double.infinity,
          height: 110,
          decoration: BoxDecoration(
                color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exercisename),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0, right: 8.0, top:4.0, bottom: 4.0),
                        child: Text(exercisetype,),
                      ),
                    )
                  ],
                ),
                Text(muscletype)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
