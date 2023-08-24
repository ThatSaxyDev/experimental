// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:experimental/features/base_nav/base_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:experimental/utils.dart';

StateNotifierProvider<NavController, int> navControllerProvider =
    StateNotifierProvider((ref) {
  return NavController();
});

class NavController extends StateNotifier<int> {
  NavController() : super(0);

  void incrementState() {
    state++;
    state.log();
  }

  void initi() {
    state = 0;
  }

  void decrementState() {
    if (state == 0) {
      state = 0;
    } else {
      state--;
    }
    state.log();
  }
}

void moveDown(WidgetRef ref) {
  ref.read(navControllerProvider.notifier).incrementState();
}

void initi(WidgetRef ref) {
  ref.read(navControllerProvider.notifier).initi();
}

void moveUp(WidgetRef ref) {
  ref.read(navControllerProvider.notifier).decrementState();
}

//!
StateNotifierProvider<DeepStateController, DeepState> deepStateController =
    StateNotifierProvider((ref) {
  return DeepStateController();
});

class DeepStateController extends StateNotifier<DeepState> {
  DeepStateController() : super(DeepState(title: 'welcome', options: options));

  void changeDeepState({required DeepState newDeepState}) {
    state = newDeepState;
  }

  void backToWelcome() {
    state = DeepState(title: 'welcome', options: options);
  }
}

class DeepState {
  final String title;
  final List<String> options;
  const DeepState({
    required this.title,
    required this.options,
  });
}
