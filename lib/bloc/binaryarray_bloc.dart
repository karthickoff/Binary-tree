import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'binaryarray_event.dart';
part 'binaryarray_state.dart';

class BinaryarrayBloc extends Bloc<BinaryarrayEvent, BinaryarrayState> {
  BinaryarrayBloc() : super(BinaryarrayInitial()) {
    on<IncBinaryTree>((event, emit) {
      // debugPrint('hii');
      var dumArr = state.binarArray;
      // print(dumArr);
      return emit(BinaryarrayState(binarArray: dumArr));
    });
  }
}
