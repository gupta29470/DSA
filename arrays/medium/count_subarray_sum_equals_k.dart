void main() {
  List<int> nums = [1, 2, -1, 3, 4, -2, 5, -1, 6, -3, 2, 1, 1, -1, 3];
  int k = 5;

  countSum(nums, k);
}

void countSum(List<int> nums, int k) {
  countSum_2(nums, k);
}

void countSum_1(List<int> nums, int k) {
  int count = 0;

  for (int index1 = 0; index1 < nums.length; index1++) {
    int sum = nums[index1];
    if (sum == k) {
      count++;
    }
    for (int index2 = index1 + 1; index2 < nums.length; index2++) {
      sum += nums[index2];
      if (sum == k) {
        count++;
      }
    }
  }

  print(count);
}

void countSum_2(List<int> nums, int k) {
  int count = 0;
  // 0:1 because sum = 0 and this count is 1
  Map<int, int> sumMap = {0: 1};
  int sum = 0;

  for (int number in nums) {
    sum += number;
    count += sumMap[sum - k] ?? 0;
    sumMap[sum] = (sumMap[sum] ?? 0) + 1;
  }

  print(count);
}
