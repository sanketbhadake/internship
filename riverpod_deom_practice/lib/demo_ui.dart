import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_deom_practice/demo_controller.dart';

class DemoUi extends ConsumerStatefulWidget {
  const DemoUi({super.key});

  @override
  ConsumerState<DemoUi> createState() => _DemoUiState();
}

class _DemoUiState extends ConsumerState<DemoUi> {
  @override
  Widget build(BuildContext context) {
final control=ref.watch(controller);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              color: control.isClicked? Colors.red: Colors.blue,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              control.changeColorButtonOne();
            }, child: Text("Change Color")),
            SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}
