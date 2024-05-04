void main() {
  List<int> nums = [2, 2, 3, 3, 3, 3, 3, 3, 5, 5, 5, 5, 5, 5, 1];

  majorityElement(nums);
}

void majorityElement(List<int> nums) {
  majorityElement_3(nums);
}

// Time: O(n^2)
void majorityElement_1(List<int> nums) {
  int greaterThan = nums.length ~/ 3;
  int resultCount = 0;
  List<int> results = [];

  for (int index1 = 0; index1 < nums.length; index1++) {
    int count = 1;
    int currentNum = nums[index1];
    for (int index2 = index1 + 1; index2 < nums.length; index2++) {
      if (nums[index2] == currentNum) {
        count++;
      }
    }

    if (resultCount < count && greaterThan < count) {
      results.add(nums[index1]);
    }
  }

  print(results);
}

// Time: O(n)    Space:O(n)
void majorityElement_2(List<int> nums) {
  int greaterThan = nums.length ~/ 3;
  Map<int, int> occurenceMap = {};
  List<int> results = [];

  for (int number in nums) {
    occurenceMap[number] = (occurenceMap[number] ?? 0) + 1;
  }

  for (MapEntry<int, int> entry in occurenceMap.entries) {
    if (entry.value > greaterThan) {
      results.add(entry.key);
    }
  }

  print(results);
}

// Time: O(n)
void majorityElement_3(List<int> nums) {
  int greaterThan = nums.length ~/ 3;
  int count1 = 0, count2 = 0;
  int? number1, number2;
  List<int> result = [];

  for (int number in nums) {
    if (number1 == number) {
      count1++;
    } else if (number2 == number) {
      count2++;
    } else if (count1 == 0) {
      count1 = 1;
      number1 = number;
    } else if (count2 == 0) {
      count2 = 1;
      number2 = number;
    } else {
      count1--;
      count2--;
    }
  }

  count1 = 0;
  count2 = 0;

  for (int number in nums) {
    if (number == number1) {
      count1++;
    } else if (number == number2) {
      count2++;
    }
  }

  if (greaterThan < count1) {
    result.add(number1 ?? 0);
  }
  if (greaterThan < count2) {
    result.add(number2 ?? 0);
  }

  print(result);
}
