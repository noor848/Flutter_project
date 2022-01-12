import 'package:bloc/bloc.dart';
import 'package:bma/module/square_rotate/state_square.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SquareCubit extends Cubit<squareState>{
  SquareCubit() : super(InitialState());

  double value=0.0;

  static SquareCubit get(context)=>BlocProvider.of(context);


  void getVlaue(double value){

    this.value=value;
    emit(Rotate());

  }





}