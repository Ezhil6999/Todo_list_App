import 'package:bloc/bloc.dart';
import 'package:todo_list/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);
  
  

  void add_list(String title){
    final todo = Todo(
      name: title, 
      time: DateTime.now());
    emit([...state , todo]);
  }

  remove_list(String title){
    state.removeWhere((element) => element.name.contains(title));
    emit([...state]);
  }

}