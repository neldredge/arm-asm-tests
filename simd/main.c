#include <stdio.h>

int add4i_c(const int *a) {
  return a[0] + a[1] + a[2] + a[3];
}

float add4f_c(const float *a) {
  return a[0] + a[1] + a[2] + a[3];
}

extern int add4i_asm(const int *a);
extern float add4f_asm(const float *a);

int main(void) {
  static int ai[] = {1, 20, 300, 4000};
  static float af[] = {80.0, 7.0, 0.6, 0.05};

  int aic = add4i_c(ai);
  int ais = add4i_asm(ai);

  float afc = add4f_c(af);
  float afs = add4f_asm(af);
  
  printf("int %s : c = %d, asm = %d\n",
	 (aic == ais) ? "OK" : "FAIL",
	 aic, ais);
  printf("float %s : c = %f, asm = %f\n",
	 (afc == afs) ? "OK" : "FAIL",
	 afc, afs);
  return 0;
}

