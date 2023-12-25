void main() {
  List<int> nums = [17, 4, 5, 2, 9, 15, 8, 6, 3, 12, 10, 7, 1, 11, 5];

  print(leaders(nums));
}

List<int> leaders(List<int> nums) {
  return leaders_2(nums);
}

// Time: O(n^2)
List<int> leaders_1(List<int> nums) {
  List<int> result = [];

  for (int index1 = 0; index1 < nums.length; index1++) {
    bool isLeader = true;
    for (int index2 = index1 + 1; index2 < nums.length; index2++) {
      if (nums[index1] < nums[index2]) {
        isLeader = false;
        break;
      }
    }

    if (isLeader) {
      result.add(index1);
    }
  }
  return result;
}

// Time: O(n)
List<int> leaders_2(List<int> nums) {
  List<int> result = [];
  int length = nums.length;
  result.add(length - 1);
  int currentLeader = nums[length - 1];

  for (int index = length - 2; index >= 0; index--) {
    if (currentLeader < nums[index]) {
      result.add(index);
      currentLeader = nums[index];
    }
  }
  return result.reversed.toList();
}
