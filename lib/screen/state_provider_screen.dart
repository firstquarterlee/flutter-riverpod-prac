import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_prac/layout/default_layout.dart';
import 'package:flutter_riverpod_prac/riverpod/state_provider_screen.dart'; //컨슈머위젯도 여기서 불러옴

class StateProviderScreen extends ConsumerWidget {
  //리버팟쓰려면 컨슈머위젯으로 바꿔야됨
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //less위젯이랑 다른건 이곳! //ref로 접근할수있음
    final provider = ref.watch(numberProvider); //리드,리슨,와치 이3가지!!!!

    return DefaultLayout(
      title: 'StateProviderscreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width, //너비 최대로
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(numberProvider.notifier)
                    .update((state) => state + 1); //여기서 state는 지금 상태다!!!!
                //버튼을 눌렀을때 실행되는 경우는 read고
                //빌드함수에서 직접적으로 ui반영을 하기 위해서 가져오는 건 watch다.
              },
              child: Text(
                'UP',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).state =
                    ref.read(numberProvider.notifier).state - 1;
              },
              child: Text(
                'DOWN',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'StateProviderscreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width, //너비 최대로
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => _NextScreen(),
                  ),
                );
              },
              child: Text(
                'Next Screen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
