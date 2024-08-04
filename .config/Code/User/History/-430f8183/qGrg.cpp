#include "VectorIterator.h"
#include <gtest/gtest.h>

TEST(TestVectorIterator, TestIteration) {
  double referenceValue1 = 4.0;
  double referenceValue2 = 5.0;
  Vector vec(5, referenceValue1);

  for (auto it = begin(vec); it != end(vec); ++it) {
    EXPECT_EQ(*it, referenceValue1);
    *it = referenceValue2;
  }

  for (auto it = cbegin(vec); it != cend(vec); ++it) {
    EXPECT_EQ(*it, referenceValue2);
//    *it = referenceValue1; should not compile
  }
}


int main() {
  testing::InitGoogleTest();
  return RUN_ALL_TESTS();
}