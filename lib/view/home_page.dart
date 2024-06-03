import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/todo_cubit.dart';
import 'package:todo_list/view/add_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black54, Colors.white70],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          title: const Text(
            "Ezhil Todo List",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocBuilder<TodoCubit, List>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(state[index].name),
                    leading: const Icon(Icons.label),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: (){
                            context.read<TodoCubit>().remove_list(state[index].name);
                          },),
                          IconButton(
                          icon: const Icon(Icons.forward),
                          onPressed: (){
                            
                          },)
                      ],
                    ) ,
                    
                    onTap: () {

                    },
                  ),
                );
              },
            );
          },
          
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
              child: const Icon(Icons.add),
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddTodo()));
              })
        ]));
  }
}
