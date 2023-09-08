import 'package:caseapp/methods/contentget.dart';
import 'package:caseapp/methods/generateItems.dart';
import 'package:caseapp/models/ExpandableListItem.dart';

import 'package:flutter/material.dart';

class DrawerPanel extends StatefulWidget {
  BuildContext ctx;
  DrawerPanel({required this.ctx});
  @override
  State createState() => DrawerPanelState();
}

class DrawerPanelState extends State<DrawerPanel> {
  List<ExpandableListItem> _data = generateItems();
  String? exercisetype, muscletype;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final item = _data[index];
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    child: ExpansionPanelList(
                      elevation: 1,
                      expandedHeaderPadding: EdgeInsets.all(0),
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          item.isExpanded = !isExpanded;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(item.headerValue),
                            );
                          },
                          body: Column(
                            children: item.subItems
                                .asMap()
                                .entries
                                .map<Widget>((entry) {
                              final index = entry.key;
                              final subItem = entry.value;
                              return ListTile(
                                leading: Radio(
                                  value: index,
                                  groupValue: item.selectedItemIndex,
                                  onChanged: (value) {
                                    setState(() {
                                      item.selectedItemIndex = value as int;
                                      
                                    });
                                    print(
                                      "Clicked: ${item.headerValue} - $subItem");

                                  if (item.headerValue ==
                                      _data[0].headerValue) {
                                    setState(() {
                                      exercisetype = subItem;
                                    });
                                  } else if (item.headerValue ==
                                      _data[1].headerValue) {
                                    setState(() {
                                      muscletype = subItem;
                                    });
                                  }
                                  },
                                ),
                                title: Text(subItem),
                            
                              );
                            }).toList(),
                          ),
                          isExpanded: item.isExpanded,
                        ),
                      ],
                    ),
                  );
                },
                childCount: _data.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        print("egzersiz tipi" + exercisetype.toString());
                        print("kas tipi " + muscletype.toString());
                        fetchContent(exercisetype, muscletype, widget.ctx);
                        Navigator.of(context).pop();
                      },
                      child: Text('Apply'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        fetchContent("", "", widget.ctx);
                        Navigator.of(context).pop();
                      },
                      child: Text('Clear'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
