import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PullRefresh extends StatefulWidget {
  const PullRefresh({Key? key}) : super(key: key);

  @override
  State<PullRefresh> createState() => _PullRefreshState();
}

class _PullRefreshState extends State<PullRefresh> {
  // The initial todos
  List _todos = [];

  // Call this when the user pull down the screen
  Future<void> _loadData() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    try {
      final http.Response response = await http.get(Uri.parse(url));
      final loadedTodos = json.decode(response.body);
      setState(() {
        _todos = loadedTodos;
      });
    } catch (err) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pull down to refresh'),
      ),
      body: RefreshIndicator(
        // trigger the _loadData function when the user pulls down
        onRefresh: _loadData,
        // Render the todos
        child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: ListTile(
                      // Render each todo
                      leading: Text(_todos[index]['id'].toString()),
                      title: Text(_todos[index]["title"]),
                      trailing: _todos[index]["completed"]
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                            )
                          : const Icon(
                              Icons.circle,
                              color: Colors.yellow,
                            ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
