void main() {
  List<int> nums = [89, 92, 99, 28, 30, 22, 86, 26, 82, 31, 65, 76, 59, 78, 69];

  (int, int) result = secondSmallestLargest(nums);

  print(result.$1);
  print(result.$2);
}

(int, int) secondSmallestLargest(List<int> nums) {
  return secondSmallestLarges_2(nums);
}

/// Time: O(nLogn)   /// Space: O(n)
(int, int) secondSmallestLarges_1(List<int> nums) {
  nums.sort();

  return (nums[1], nums[nums.length - 2]);
}

/// Time: O(n)
(int, int) secondSmallestLarges_2(List<int> nums) {
  int smallest = nums[0];
  int largest = nums[0];
  int secondSmallest = smallest;
  int secondLargest = largest;

  for (int index = 1; index < nums.length; index++) {
    if (nums[index] < smallest) {
      secondSmallest = smallest;
      smallest = nums[index];
    } else if (nums[index] < secondSmallest) {
      secondSmallest = nums[index];
    }

    if (largest < nums[index]) {
      secondLargest = largest;
      largest = nums[index];
    } else if (secondLargest < nums[index]) {
      secondLargest = nums[index];
    }
  }

  return (secondSmallest, secondLargest);
}
