#include <stdio.h>

int sum(int xs[], int n) {
  int i;
  int s = 0;
  for (i = 0; i < n; ++i) {
    s += xs[i];
  }
  return s;
}

int main(void) {
  int xs[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
  int s;
  s = sum(xs, sizeof(xs) / sizeof(int));
  printf("sum = %d\n", s);
  return 0;
}
