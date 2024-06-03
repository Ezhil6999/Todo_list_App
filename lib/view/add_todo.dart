import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/todo_cubit.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TodoCubit, List>(
        builder: (context, state) {
          return Center(
            widthFactor: double.infinity,
            heightFactor: double.infinity,
            child: Column(
              children: [
                TextField(
                  controller: todoController,
                  decoration: const InputDecoration(
                    hintText: "enter you text",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black87,
                        width: 40,  
                      ),
                    borderRadius: BorderRadius.all(Radius.circular(40))
                    )
                  ),
                ),
                ElevatedButton(onPressed: () {
                  context.read<TodoCubit>().add_list(todoController.text.trim());
                  Navigator.pop(context);
                }, child: const Text("add"))
              ],
            ),
          );
        },
      ),
    );
  }
}
