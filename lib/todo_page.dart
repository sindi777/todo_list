// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class TodoPage extends StatefulWidget {
//   const TodoPage({super.key});

//   @override
//   State<TodoPage> createState() => _TodoPageState();
// }

// class _TodoPageState extends State<TodoPage> {
//   List<String> _todoList = [];
//   final TextEditingController _textController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _loadTodoList();
//   }

//   Future<void> _loadTodoList() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _todoList = prefs.getStringList('todos') ?? [];
//     });
//   }

//   Future<void> _saveTodoList() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setStringList('todos', _todoList);
//   }

//   void _showAddTodoDialog() {
//     _textController.clear();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add To-Do Item'),
//           content: TextField(
//             controller: _textController,
//             decoration: const InputDecoration(
//               labelText: 'New To-Do Item',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 if (_textController.text.isNotEmpty) {
//                   setState(() {
//                     _todoList.add(_textController.text);
//                     _saveTodoList();
//                   });
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: const Text('Add'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _removeTodoItem(int index) {
//     setState(() {
//       _todoList.removeAt(index);
//       _saveTodoList();
//     });
//   }

//   void _editTodoItem(int index) {
//     _textController.text = _todoList[index];
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Edit To-Do Item'),
//           content: TextField(
//             controller: _textController,
//             decoration: const InputDecoration(
//               labelText: 'Edit To-Do Item',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 if (_textController.text.isNotEmpty) {
//                   setState(() {
//                     _todoList[index] = _textController.text;
//                     _saveTodoList();
//                   });
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: const Text('Save'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   String capitalize(String text) {
//     if (text.isEmpty) {
//       return text;
//     }
//     return text[0].toUpperCase() + text.substring(1);
//   }

//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: const Color.fromARGB(255, 10, 124, 105),
//         child: SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'To-Do List',
//                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         color: Colors.white24,
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Text(
//                         '${_todoList.length}',
//                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 25),
//               Expanded(
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: ListView.builder(
//                     itemCount: _todoList.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 15),
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         decoration: BoxDecoration(
//                           border: Border(
//                             bottom: BorderSide(
//                               color: Colors.grey.shade300,
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               capitalize(_todoList[index]),
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyLarge
//                                   ?.copyWith(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                             ),
//                             Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(Icons.edit),
//                                   onPressed: () => _editTodoItem(index),
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(Icons.delete),
//                                   onPressed: () => _removeTodoItem(index),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddTodoDialog,
//         backgroundColor: Colors.black38,
//         child: const Icon(
//           Icons.add,
//           size: 40,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }


// coba dulu

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Map<String, dynamic>> _todoList = []; // Menyimpan teks dan status checklist
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodoList();
  }

  // Fungsi untuk memuat data To-Do dari SharedPreferences
  Future<void> _loadTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      List<String>? savedTodos = prefs.getStringList('todos');
      if (savedTodos != null) {
        _todoList = savedTodos.map((item) {
          var todo = item.split('||');
          return {'text': todo[0], 'done': todo[1] == 'true'};
        }).toList();
      }
    });
  }

  // Fungsi untuk menyimpan data To-Do ke SharedPreferences
  Future<void> _saveTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todos = _todoList
        .map((item) => '${item['text']}||${item['done']}')
        .toList();
    prefs.setStringList('todos', todos);
  }

  // Menampilkan dialog untuk menambahkan To-Do
  void _showAddTodoDialog() {
    _textController.clear();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add To-Do Item'),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'New To-Do Item',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  setState(() {
                    _todoList.add({'text': _textController.text, 'done': false});
                    _saveTodoList();
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Menghapus To-Do
  void _removeTodoItem(int index) {
    setState(() {
      _todoList.removeAt(index);
      _saveTodoList();
    });
  }

  // Mengedit To-Do
  void _editTodoItem(int index) {
    _textController.text = _todoList[index]['text'];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit To-Do Item'),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'Edit To-Do Item',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  setState(() {
                    _todoList[index]['text'] = _textController.text;
                    _saveTodoList();
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Mengubah status checklist To-Do
  void _toggleDone(int index) {
    setState(() {
      _todoList[index]['done'] = !_todoList[index]['done'];
      _saveTodoList();
    });
  }

  // Fungsi untuk kapitalisasi teks
  String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 10, 124, 105),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'To-Do List',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '${_todoList.length}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: _todoList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _todoList[index]['done'],
                                  onChanged: (bool? value) {
                                    _toggleDone(index);
                                  },
                                ),
                                Text(
                                  capitalize(_todoList[index]['text']),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        decoration: _todoList[index]['done']
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () => _editTodoItem(index),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => _removeTodoItem(index),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        backgroundColor: Colors.black38,
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
