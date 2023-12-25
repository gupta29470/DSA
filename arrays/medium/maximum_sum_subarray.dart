void main() {
  List<int> nums = [-1, 3, -2, 5, -4, 2, 6, -2, -3, 4, 1, -5, 3, 1, -7];

  print(maximumSumSubarray(nums));
}

int maximumSumSubarray(List<int> nums) {
  return maximumSumSubarray_2(nums);
}

// Time: O(n^2)
int maximumSumSubarray_1(List<int> nums) {
  int max = nums[0];
  int startIndex = -1;
  int endIndex = -1;

  for (int index1 = 0; index1 < nums.length; index1++) {
    int sum = 0;

    for (int index2 = index1; index2 < nums.length; index2++) {
      sum += nums[index2];
      if (max < sum) {
        max = sum;
        startIndex = index1;
        endIndex = index2;
      }
    }
  }

  print(startIndex);
  print(endIndex);

  return max;
}

// Time: O(n)
int maximumSumSubarray_2(List<int> nums) {
  int max = nums[0];
  int currentSum = nums[0];
  int startIndex = 0;
  int endIndex = -1;

  for (int index = 1; index < nums.length; index++) {
    if (currentSum + nums[index] < nums[index]) {
      startIndex = index;
      currentSum = nums[index];
    } else {
      currentSum += nums[index];
    }

    if (max < currentSum) {
      max = currentSum;
      endIndex = index;
    }
  }

  print(startIndex);
  print(endIndex);

  return max;
}

int maxOf(int number1, int number2) {
  return number1 < number2 ? number2 : number1;
}
