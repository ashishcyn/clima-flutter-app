void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
  task4();
  task5();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  String result;
  Duration threeSeconds = Duration(seconds: 3);
  //Sync
  //sleep(threeSeconds);

  //ASync
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}

void task4() {
  String result = 'task 4 data';
  print('Task 4 complete');
}

void task5() {
  String result = 'task 5 data';
  print('Task 5 complete');
}
