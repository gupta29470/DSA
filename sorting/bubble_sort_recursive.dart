void main() {
  List<int> nums = [64, 25, 12, 22, 11];
  bubbleSort(nums);
  print(nums);
}

void bubbleSort(List<int> nums) {
  bubbleSortRecursive(nums, nums.length);
}

void bubbleSortRecursive(List<int> nums, int length) {
  if (length == 1) {
    return;
  }

  for (int index = 0; index < nums.length - 1; index++) {
    if (nums[index + 1] < nums[index]) {
      swap(nums, index, index + 1);
    }
  }

  bubbleSortRecursive(nums, length - 1);
}

void swap(List<int> nums, int index1, int index2) {
  int temp = nums[index1];
  nums[index1] = nums[index2];
  nums[index2] = temp;
}
