void main() {
  List<int> nums = [1, 8, 7, 8, 8, 6, 8, 9, 8, 10, 8, 2, 8, 3, 8];

  print(majorityElement(nums));
}

int majorityElement(List<int> nums) {
  return majorityElement_3(nums);
}

// Time: O(n^2)
int majorityElement_1(List<int> nums) {
  int resultCount = -1;
  int result = -1;

  for (int index1 = 0; index1 < nums.length - 1; index1++) {
    int currentElement = nums[index1];
    int currentCount = 1;
    for (int index2 = index1 + 1; index2 < nums.length; index2++) {
      if (currentElement == nums[index2]) {
        currentCount++;
      }
    }

    if (resultCount < currentCount) {
      result = currentElement;
      resultCount = currentCount;
    }
  }

  return result;
}

// Time: O(n)  Space: O(n)
int majorityElement_2(List<int> nums) {
  Map<int, int> numberMap = {};

  for (int number in nums) {
    numberMap[number] = (numberMap[number] ?? 0) + 1;
  }

  for (MapEntry<int, int> entry in numberMap.entries) {
    if (entry.value >= (nums.length ~/ 2)) {
      return entry.key;
    }
  }

  return -1;
}

// Time: O(n)
int majorityElement_3(List<int> nums) {
  int result = nums[0];
  int count = 1;

  // candidate selection
  for (int index = 1; index < nums.length; index++) {
    if (result == nums[index]) {
      count++;
    } else {
      count--;
      if (count <= 0) {
        result = nums[index];
        count = 1;
      }
    }
  }

  count = 0;

  //  verification step
  for (int index = 0; index < nums.length; index++) {
    if (nums[index] == result) {
      count++;
    }
  }

  return count >= (nums.length ~/ 2) ? result : -1;
}
