import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseStateNotifier<State> extends StateNotifier<State> {
  BaseStateNotifier(super.initialState) {
    onInit();
  }

  Future<void> onInit() async {}
}
