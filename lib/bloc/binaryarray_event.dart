part of 'binaryarray_bloc.dart';

// @immutable
class BinaryarrayEvent {}

class IncBinaryTree extends BinaryarrayEvent {
  List binarArray;
  IncBinaryTree(this.binarArray);
}
