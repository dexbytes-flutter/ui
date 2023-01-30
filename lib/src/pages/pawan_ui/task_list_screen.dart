import 'package:base_flutter_app/src/pages/pawan_ui/pagination_screen.dart';
import 'package:base_flutter_app/src/pages/pawan_ui/product_screen.dart';
import 'package:base_flutter_app/src/pages/pawan_ui/pull_refresh.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Text('L'),
                ),
                title: const Text('List view pagination'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PaginationScreen()));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Text('P'),
                ),
                title: const Text('Pull down to refresh'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PullRefresh()));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Text('B'),
                ),
                title: const Text('Bottom navigation'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavScreen()));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Text('A'),
                ),
                title: const Text('Add to card'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
