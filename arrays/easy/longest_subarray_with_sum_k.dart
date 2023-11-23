void main() {
  List<int> nums = [3, 1, 0, 1, 8, 2, 3, 6];
  int k = 5;

  print(longestSubarrayLength(nums, k));
}

int longestSubarrayLength(List<int> nums, int k) {
  return longestSubarrayLength_2(nums, k);
}

// Time: O(n^2)
int longestSubarrayLength_1(List<int> nums, int k) {
  int result = 0;

  for (int index1 = 0; index1 < nums.length; index1++) {
    int currentSum = nums[index1];
    if (currentSum == k) {
      result = max(result, 1);
    }
    for (int index2 = index1 + 1; index2 < nums.length; index2++) {
      currentSum += nums[index2];
      if (currentSum == k) {
        result = max(result, ((index2 - index1) + 1));
      } else if (currentSum > k) {
        break;
      }
    }
  }
  return result;
}

int max(int number1, int number2) {
  return number1 > number2 ? number1 : number2;
}

// Time: O(n)   Space O(n)
int longestSubarrayLength_2(List<int> nums, int k) {
  int result = 0;
  Map<int, int> sumMap = {};
  int sum = 0;

  for (int index = 0; index < nums.length; index++) {
    sum += nums[index];

    if (sum == k) {
      result = index + 1;
    }

    sumMap[sum] = index;

    if (sumMap.containsKey(sum - k)) {
      int sumIndex = sumMap[sum - k] ?? 0;
      result = max(result, ((index - sumIndex) + 1));
    }
  }

  return result;
}

// Time: O(n)
int longestSubarrayLength_3(List<int> nums, int k) {
  int result = 0;
  int fastIndex = 0, slowIndex = 0;
  int sum = 0;

  while (fastIndex < nums.length) {
    sum += nums[fastIndex];

    while (sum > k) {
      sum -= nums[slowIndex];
      slowIndex++;
    }

    if (sum == k) {
      result = max(result, ((fastIndex - slowIndex) + 1));
    }

    fastIndex++;
  }

  return result;
}
