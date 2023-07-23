#include <stdio.h>
#define BUFF_SIZE 1024

void process(FILE *fin, FILE *fout) {
  if (fin) {
    char buff[BUFF_SIZE];
    int n = 0;
    while (!feof(fin)) {
      fgets(buff, BUFF_SIZE, fin);
      fprintf(fout, "%03d: %s", n, buff);
      ++n;
    }
  }
}

int main(int argc, const char *const *argv) {
  while (--argc > 0) {
    FILE *fin;
    ++argv;
    fin = fopen(*argv, "r");
    process(fin, stdout);
    fclose(fin);
  }
  return 0;
}
