void main() {
  List<int> nums = [22, 22, 28, 30, 30, 59, 65, 69, 69, 76, 78, 82, 86, 89, 99];

  int nonDuplicateLength = removeDuplicates(nums);

  print(nonDuplicateLength);
}

int removeDuplicates(List<int> nums) {
  return removeDuplicates_2(nums);
}

// Time: O(n)  Space: O(n)
int removeDuplicates_1(List<int> nums) {
  Set numSet = nums.toSet();
  print(numSet);

  return 0;
}

// Time: O(n)
int removeDuplicates_2(List<int> nums) {
  int fastIndex = 1, slowIndex = 0;

  while (fastIndex < nums.length) {
    if (nums[fastIndex] != nums[slowIndex]) {
      slowIndex++;
      nums[slowIndex] = nums[fastIndex];
    }
    fastIndex++;
  }

  return slowIndex + 1;
}
