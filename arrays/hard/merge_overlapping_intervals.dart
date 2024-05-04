import 'dart:math';

void main() {
  List<List<int>> intervals = [
    [1, 2],
    [8, 10],
    [2, 6],
    [15, 18]
  ];

  mergeIntervals(intervals);
}

void mergeIntervals(List<List<int>> intervals) {
  mergeIntervals_1(intervals);
}

void mergeIntervals_1(List<List<int>> intervals) {
  List<List<int>> result = [];
  int index1 = 0;

  intervals.sort((a, b) => a[0].compareTo(b[0]));

  while (index1 < intervals.length) {
    int start = intervals[index1][0];
    int end = intervals[index1][1];
    int index2 = index1 + 1;
    while (index2 < intervals.length) {
      List<int> nextInterval = intervals[index2];
      if (nextInterval[0] <= end) {
        index1++;
        index2++;
        end = nextInterval[1];
      } else {
        break;
      }
    }
    result.add([start, end]);
    index1++;
  }

  print(result);
}

void mergeIntervals_2(List<List<int>> intervals) {
  intervals.sort((a, b) => a[0].compareTo(b[0]));

  List<List<int>> result = [];
  List<int> currentInterval = intervals[0];
  result.add(currentInterval);

  for (int index = 0; index < intervals.length; index++) {
    List<int> nextInterval = intervals[index];

    if (nextInterval[0] <= currentInterval[1]) {
      currentInterval[1] = max(currentInterval[1], nextInterval[1]);
    } else {
      currentInterval = nextInterval;
      result.add(currentInterval);
    }
  }

  print(result);
}
