void main() {
  List<int> nums = [-1, 0, 1, 2, -1, -4];

  threeSum(nums);
}

void threeSum(List<int> nums) {
  threeSum_3(nums);
}

// time: O(n^3)
void threeSum_1(List<int> nums) {
  Set<String> results = {}; // for storing unique
  List<List<int>> triplets = []; // actual result

  nums.sort();

  for (int index1 = 0; index1 < nums.length - 2; index1++) {
    for (int index2 = index1 + 1; index2 < nums.length - 1; index2++) {
      for (int index3 = index2 + 1; index3 < nums.length; index3++) {
        if (nums[index1] + nums[index2] + nums[index3] == 0) {
          List<int> triplets = [nums[index1], nums[index2], nums[index3]];
          results.add(triplets.toString());
        }
      }
    }
  }

  // Looping each string, remove brackets, splitting by ", " and
  // int parse and adding to list
  for (String triplet in results) {
    String substr = triplet.substring(1, triplet.length - 1);
    print(substr);
    List<String> splitted = substr.split(", ");
    List<int> currentTriplet = [];

    for (int index = 0; index < splitted.length; index++) {
      currentTriplet.add(int.parse(splitted[index]));
    }

    triplets.add(currentTriplet);
  }

  print(triplets);
}

// time: O(n^2)   Space: O(n)
void threeSum_2(List<int> nums) {
  List<List<int>> triplets = [];
  Set<String> strTriplets = {};

  for (int index1 = 0; index1 < nums.length; index1++) {
    Set<int> numsSet = {};
    for (int index2 = index1 + 1; index2 < nums.length; index2++) {
      int third = -(nums[index1] + nums[index2]);

      if (numsSet.contains(third)) {
        strTriplets.add("${[nums[index1], nums[index2], third]}");
      }
      numsSet.add(nums[index2]);
    }
  }

  print(strTriplets);

  for (String strTriplet in strTriplets) {
    String substr = strTriplet.substring(1, strTriplet.length - 1);
    List<String> splittedStr = substr.split(", ");
    List<int> triplet = [];

    for (int index = 0; index < splittedStr.length; index++) {
      triplet.add(int.parse(splittedStr[index]));
    }

    triplets.add(triplet);
  }

  print(triplets);
}

// time: O(n^2)
void threeSum_3(List<int> nums) {
  nums.sort();
  List<List<int>> triplets = [];

  for (int index = 0; index < nums.length; index++) {
    int left = index + 1, right = nums.length - 1;
    while (left < right) {
      int sum = nums[index] + nums[left] + nums[right];
      if (sum == 0) {
        triplets.add([nums[index], nums[left], nums[right]]);
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

  print(triplets);
}
