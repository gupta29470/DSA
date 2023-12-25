void main() {
  List<int> nums = [12, 7, 11, 15, 3, 6, 20, 25, 8, 10, 1, 14, 5, 9, 18];
  int target = 21;

  ({bool exists, int number1, int number2}) result = twoSum(nums, target);

  print(
      "${result.exists} ========= ${result.number1} ======= ${result.number2}");
}

({bool exists, int number1, int number2}) twoSum(List<int> nums, int target) {
  return twoSum_2(nums, target);
}

// Time: O(n^2)
({bool exists, int number1, int number2}) twoSum_1(List<int> nums, int target) {
  for (int index1 = 0; index1 < nums.length - 1; index1++) {
    for (int index2 = index1 + 1; index2 < nums.length; index2++) {
      if (nums[index1] + nums[index2] == target) {
        return (exists: true, number1: nums[index1], number2: nums[index2]);
      }
    }
  }

  return (exists: false, number1: -1, number2: -1);
}

// Time: O(n)  Space: O(n)
({bool exists, int number1, int number2}) twoSum_2(List<int> nums, int target) {
  Map<int, int> numMap = {};

  for (int index = 0; index < nums.length; index++) {
    if (numMap.containsKey(target - nums[index])) {
      return (
        exists: true,
        number1: target - nums[index],
        number2: nums[index],
      );
    }

    numMap[nums[index]] = index;
  }
  return (exists: false, number1: -1, number2: -1);
}
