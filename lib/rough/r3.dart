import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // Example list
  final List<String> names = const [
    "Shayan",
    "Ali",
    "Sara",
    "Usman",
    "Taha",
    "Sadia",
    "Talha",
    "Areeb",
    "Sana",
    "Tariq",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // All, S, T
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tabs with Filter"),
          bottom: const TabBar(
            tabs: [Tab(text: "All"), Tab(text: "S"), Tab(text: "T")],
          ),
        ),
        body: TabBarView(
          children: [
            /// Tab 1: Show all names
            _buildList(names),

            /// Tab 2: Show only names starting with S or s
            _buildList(
              names
                  .where((name) => name.toLowerCase().startsWith("s"))
                  .toList(),
            ),

            /// Tab 3: Show only names starting with T or t
            _buildList(
              names
                  .where((name) => name.toLowerCase().startsWith("t"))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<String> data) {
    if (data.isEmpty) {
      return const Center(child: Text("No data available"));
    }
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.person),
          title: Text(data[index]),
        );
      },
    );
  }
}
