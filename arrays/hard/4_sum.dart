void main() {
  List<int> nums = [1, 0, -1, 0, -2, 2];
  fourSum(nums);
}

void fourSum(List<int> nums) {
  fourSum_1(nums);
}

// time: O(n^4)
void fourSum_1(List<int> nums) {
  Set<String> resultSet = {};
  List<List<int>> results = [];

  for (int index1 = 0; index1 < nums.length - 3; index1++) {
    for (int index2 = index1 + 1; index2 < nums.length - 2; index2++) {
      for (int index3 = index2 + 1; index3 < nums.length - 1; index3++) {
        for (int index4 = index3 + 1; index4 < nums.length; index4++) {
          int sum = nums[index1] + nums[index2] + nums[index3] + nums[index4];
          if (sum == 0) {
            resultSet.add(
                "${[nums[index1], nums[index2], nums[index3], nums[index4]]}");
          }
        }
      }
    }
  }

  for (String quadStr in resultSet) {
    String substr = quadStr.substring(1, quadStr.length - 1);
    List<String> splitted = substr.split(", ");
    List<int> quad = [];

    for (String split in splitted) {
      quad.add(int.parse(split));
    }

    results.add(quad);
  }

  print(results);
}

// time: O(n^3)   space: O(n)
void fourSum_2(List<int> nums) {
  Set<String> resultSet = {};
  List<List<int>> results = [];
  nums.sort();

  for (int index1 = 0; index1 < nums.length - 3; index1++) {
    for (int index2 = index1 + 1; index2 < nums.length - 2; index2++) {
      Set<int> numSet = {};
      for (int index3 = index2 + 1; index3 < nums.length; index3++) {
        int fourth = -(nums[index1] + nums[index2] + nums[index3]);

        if (numSet.contains(fourth)) {
          resultSet
              .add("${[nums[index1], nums[index2], nums[index3], fourth]}");
        }
        numSet.add(nums[index3]);
      }
    }
  }

  for (String quadStr in resultSet) {
    String substr = quadStr.substring(1, quadStr.length - 1);
    List<String> splitted = substr.split(", ");
    List<int> quad = [];

    for (String split in splitted) {
      quad.add(int.parse(split));
    }

    results.add(quad);
  }

  print(results);
}

void fourSum_3(List<int> nums) {
  Set<String> resultSet = {};
  List<List<int>> results = [];
  nums.sort();

  for (int index1 = 0; index1 < nums.length - 3; index1++) {
    for (int index2 = index1 + 1; index2 < nums.length - 2; index2++) {
      int left = index2 + 1, right = nums.length - 1;

      while (left < right) {
        int sum = nums[index1] + nums[index2] + nums[left] + nums[right];

        if (sum == 0) {
          resultSet
              .add("${[nums[index1], nums[index2], nums[left], nums[right]]}");

          while (left < right && nums[left] == nums[left + 1]) {
            left++;
          }

          while (left < right && nums[right] == nums[right - 1]) {
            right--;
          }

          left++;
          right--;
        }
        if (sum < 0) {
          left++;
        } else {
          right--;
        }
      }
    }
  }

  for (String quadStr in resultSet) {
    String substr = quadStr.substring(1, quadStr.length - 1);
    List<String> splitted = substr.split(", ");
    List<int> quad = [];

    for (String split in splitted) {
      quad.add(int.parse(split));
    }

    results.add(quad);
  }

  print(results);
}
