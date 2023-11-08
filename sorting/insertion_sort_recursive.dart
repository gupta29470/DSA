void main() {
  List<int> nums = [64, 25, 12, 22, 11];
  insertionSort(nums);
  print(nums);
}

void insertionSort(List<int> nums) {
  insertionSortRecursive(nums, 0);
}

void insertionSortRecursive(List<int> nums, int startIndex) {
  if (startIndex > nums.length - 1) {
    return;
  }

  for (int index = startIndex; index > 0; index--) {
    if (nums[index] < nums[index - 1]) {
      swap(nums, index, index - 1);
    }
  }

  insertionSortRecursive(nums, startIndex + 1);
}

void swap(List<int> nums, int index1, int index2) {
  int temp = nums[index1];
  nums[index1] = nums[index2];
  nums[index2] = temp;
}
