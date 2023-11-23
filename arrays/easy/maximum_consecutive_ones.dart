void main() {
  List<int> nums = [1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1];

  print(maxConsecutiveOnes(nums));
}

// Time: O(n)
int maxConsecutiveOnes(List<int> nums) {
  int max = 0;

  for (int index = 0; index < nums.length; index++) {
    if (nums[index] == 1) {
      int currentMax = 1;
      index += 1;

      while (index < nums.length && nums[index] == 1) {
        currentMax++;
        index++;
      }

      if (max < currentMax) {
        max = currentMax;
      }
    }
  }

  return max;
}
