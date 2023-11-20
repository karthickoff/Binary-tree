import 'package:binarytree/binary_code_check.dart';
import 'package:binarytree/bloc/binaryarray_bloc.dart';
// import 'package:binarytree/shape_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BinaryTreeWidget extends StatelessWidget {
  final TextEditingController numController = TextEditingController();
  final BinaryarrayBloc binBloc = BinaryarrayBloc();
  BinaryTreeWidget({super.key});

  final BinarySearchTree tree = BinarySearchTree();

  List l = [];
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert!!"),
          content: const Text("Enter a number !"),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void incrementCounter(BuildContext context, arr) {
    if (numController.text.isEmpty) {
      _showDialog(context);
    } else {
      debugPrint(numController.text);
      l = arr;
      l.add(numController.text);
      binBloc.add(IncBinaryTree(l));
      tree.insertValue(int.parse(numController.text));
    }

    numController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Binary Search Tree')),
        body: BlocBuilder<BinaryarrayBloc, BinaryarrayState>(
            bloc: binBloc,
            builder: (context, state) {
              return Column(
                children: [
                  TextField(
                      controller: numController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Enter Number',
                      )),
                  ElevatedButton(
                    child: const Text('Darw BT'),
                    onPressed: () {
                      incrementCounter(context, state.binarArray);
                    },
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Binary Trees :',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            buildBinaryTreeWidget(tree.treeRoot),
                          ]),
                    ),
                  )
                ],
              );
            }));
  }

  Widget buildBinaryTreeWidget(TreeNode? node) {
    if (node == null) {
      return const SizedBox();
    }

    return Column(
      children: [
        buildCircleAvatar(node.treeValue),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (node.leftChildNode != null) buildVerticalLine('left'),
            const SizedBox(width: 32),
            if (node.rightChildNode != null) buildVerticalLine('right'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            if (node.leftChildNode != null)
              Expanded(child: buildBinaryTreeWidget(node.leftChildNode)),
            const SizedBox(width: 32),
            if (node.rightChildNode != null)
              Expanded(child: buildBinaryTreeWidget(node.rightChildNode)),
          ],
        ),
      ],
    );
  }

  Widget buildVerticalLine(String side) {
    return SizedBox(
      height: 40,
      width: 2,
      // color: Colors.grey,
      child: Transform(
        alignment: Alignment.topRight, //origin: Offset(200, 0)
        transform:
            side == 'left' ? Matrix4.rotationZ(0.3) : Matrix4.rotationZ(-0.3),
        child: Container(
          color: Colors.purpleAccent,
          height: 40,
          width: 2,
        ),
      ),
    );
  }

  Widget buildCircleAvatar(int value) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.yellow,
          child: Center(
            child: Text(
              value.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
