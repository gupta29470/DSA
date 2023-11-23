void main() {
  List<int> nums = [89, 92, 99, 28, 30, 22, 86, 26, 82, 31, 65, 76, 59, 78, 69];

  int largest = largestElement(nums);

  print(largest);
}

int largestElement(List<int> nums) {
  return largestElement_1(nums);
}

/// Time: o(nLogn): Space: O(n)
int largestElement_1(List<int> nums) {
  nums.sort();
  return nums[nums.length - 1];
}

/// Time: O(n)  Space: O(1)
int largestElement_2(List<int> nums) {
  int largest = nums[0];

  for (int index = 1; index < nums.length; index++) {
    if (largest < nums[index]) {
      largest = nums[index];
    }
  }

  return largest;
}
