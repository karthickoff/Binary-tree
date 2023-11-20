part of 'binaryarray_bloc.dart';

// @immutable
class BinaryarrayState {
  List binarArray = [1, 2];

  BinaryarrayState({required this.binarArray});
}

class BinaryarrayInitial extends BinaryarrayState {
  BinaryarrayInitial() : super(binarArray: [1, 2]);
}
