import 'package:bloc/bloc.dart';
import 'package:bma/module/counter/statecounter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<StateCounter>{
  CounterCubit() : super(InitialState());


  static CounterCubit get(context)=>BlocProvider.of(context);

  int counter=1;
  void min(){
    counter--;

    emit(MinusState());
  }
  void plus(){
    counter++;
    emit(PlusState());
  }



}