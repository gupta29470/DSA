void main() {
  List<int> nums = [100, 4, 200, 1, 3, 2, 5, 8, 9, 6, 10, 11, 12, 7, 13];

  print(longestSeq(nums));
}

int longestSeq(List<int> nums) {
  return longestSeq_2(nums);
}

// Time: O(nLogn) + O(n)
int longestSeq_1(List<int> nums) {
  nums.sort();
  int result = 1;
  int currentResult = 1;

  for (int index = 1; index < nums.length; index++) {
    if (nums[index - 1] == nums[index]) {
      continue;
    } else if (nums[index - 1] == (nums[index] - 1)) {
      currentResult++;

      if (result < currentResult) {
        result = currentResult;
      }
    } else {
      currentResult = 1;
    }
  }

  return result;
}

// Time: O(n)   Space: O(n)
int longestSeq_2(List<int> nums) {
  int result = 1;
  Set<int> numsSet = nums.toSet();

  for (int number in numsSet) {
    if (!numsSet.contains(number - 1)) {
      int currentNumber = number;
      int potentialResult = 1;

      while (numsSet.contains(currentNumber + 1)) {
        potentialResult++;
        currentNumber++;
      }

      if (result < potentialResult) {
        result = potentialResult;
      }
    }
  }
  return result;
}
