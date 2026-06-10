import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Movies'),
    Tab(text: 'TV Series'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Results'),
          centerTitle: true,
          bottom: TabBar(tabs: myTabs),
        ),
        body: TabBarView(
          children: myTabs.map((Tab tab) {
            final String label = tab.text!;
            return Center(
              child: Text('$label tab', style: const TextStyle(fontSize: 36)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
