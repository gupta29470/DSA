void main() {
  List<int> nums = [89, 92, 99, 28, 30, 22, 86, 26, 82, 31, 65, 76, 59, 78, 69];

  leftRotate(nums);

  print(nums);
}

void leftRotate(List<int> nums) {
  leftRotate_2(nums);
}

// Time: O(n)
void leftRotate_1(List<int> nums) {
  int element = nums[0];
  nums.removeAt(0);
  nums.add(element);
}

// Time: O(n)   Space: O(n)
void leftRotate_2(List<int> nums) {
  List<int> tempNums = [];

  for (int index = 1; index < nums.length; index++) {
    tempNums.add(nums[index]);
  }

  tempNums.add(nums[0]);
  nums.clear();
  nums.addAll(tempNums);
}

// Time: O(n)
void leftRotate_3(List<int> nums) {
  int element = nums[0];

  for (int index = 1; index < nums.length; index++) {
    nums[index - 1] = nums[index];
  }

  nums[nums.length - 1] = element;
}
