void main() {
  List<int> nums = [64, 25, 12, 22, 11];
  insertionSort(nums);
  print(nums);
}

void insertionSort(List<int> nums) {
  for (int index1 = 0; index1 < nums.length; index1++) {
    int index2 = index1;

    while (index2 > 0 && nums[index2] < nums[index2 - 1]) {
      swap(nums, index2, index2 - 1);
      index2--;
    }
  }
}

void swap(List<int> nums, int index1, int index2) {
  int temp = nums[index1];
  nums[index1] = nums[index2];
  nums[index2] = temp;
}
