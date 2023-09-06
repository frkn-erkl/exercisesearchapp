

import 'package:caseapp/components/ListItem.dart';
import 'package:caseapp/components/drawerPanel.dart';
import 'package:caseapp/methods/contentget.dart';

import 'package:caseapp/s_management/ExerciseListProvider.dart';

import 'package:caseapp/screens/itemDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<dynamic, dynamic>> _filteredItems = [];
  var providerelement;

  setFilteredItems() async {
    _filteredItems = await fetchContent(null, null, context);
  }

  @override
  void initState() {
    super.initState();
    setFilteredItems();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    providerelement = Provider.of<ExerciseListProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DrawerPanel(),
      backgroundColor: Colors.grey.shade300,
      body: Consumer<ExerciseListProvider>(
        builder: (context, exerciseListProvider, child) {
          _filteredItems = exerciseListProvider.getItems!;

          return exerciseListProvider.getItems!.isNotEmpty
              ? CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.grey.shade300,
                      titleSpacing: 20,
                      //  expandedHeight: 0.0,
                      floating: true,
                      pinned: true,
                      actions: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width:
                                40.0, 
                            height: 40.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle, 
                              color: Colors.white,
                            ),
                            child: IconButton(
                              color: Colors.black,
                              icon: Icon(Icons.tune_rounded),
                              onPressed: () {
                                _scaffoldKey.currentState?.openEndDrawer();
                              },
                            ),
                          ),
                        ),
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding: EdgeInsets.only(left: 8),
                        centerTitle: false,
                        title: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width -
                                    60, 
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, bottom: 2, top: 2, right: 8),
                                  child: TextField(
                                  
                                    onChanged: (value) {
                                         setState(() {
                                        _filteredItems = exerciseListProvider
                                            .getItems!
                                            .where((item) {
                                          final String name = item["name"]
                                              .toString()
                                              .toLowerCase();
                                          return name
                                              .contains(value.toLowerCase());
                                        }).toList();
                                      });
                            
                       
                                    },
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      hintText: 'Search',
                                      hintStyle: TextStyle(color: Colors.black),
                                    ),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${_filteredItems.length} results found',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ListItem(
                              _filteredItems[index]["name"],
                              _filteredItems[index]["type"],
                              _filteredItems[index]["muscle"], () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ItemDetailPage(
                                  _filteredItems[index]["instructions"],
                                  _filteredItems[index]["name"]),
                            ));
                          });
                        },
                        childCount: _filteredItems.length,
                      ),
                    )
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
        },
      ),
    );
  }
}
