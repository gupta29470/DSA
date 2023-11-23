void main() {
  List<int> nums = [64, 0, 42, 70, 0, 0, 0, 0, 56, 11, 1, 0, 37, 70, 0, 0];
  int value = 56;

  print(linearSearch(nums, value));
}

int linearSearch(List<int> nums, int value) {
  for (int index = 0; index < nums.length; index++) {
    if (nums[index] == value) {
      return index;
    }
  }

  return -1;
}
