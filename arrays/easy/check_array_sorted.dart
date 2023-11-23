void main() {
  List<int> nums = [89, 92, 99, 28, 30, 22, 86, 26, 82, 31, 65, 76, 59, 78, 69];

  bool isSorted = checkArraySorted(nums);

  print(isSorted);
}

bool checkArraySorted(List<int> nums) {
  return checkArraySorted_1(nums);
}

// Time: O(n)
bool checkArraySorted_1(List<int> nums) {
  for (int index = 1; index < nums.length; index++) {
    if (nums[index - 1] > nums[index]) {
      return false;
    }
  }

  return true;
}
