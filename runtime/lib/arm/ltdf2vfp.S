//===-- ltdf2vfp.S - Implement ltdf2vfp -----------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "../assembly.h"

//
// extern double __ltdf2vfp(double a, double b);
//
// Returns one iff a < b and neither is NaN.
// Uses Darwin calling convention where double precision arguments are passsed 
// like in GPR pairs.
//
DEFINE_COMPILERRT_FUNCTION(__ltdf2vfp)
	fmdrr	d6, r0, r1	// load r0/r1 pair in double register
	fmdrr	d7, r2, r3	// load r2/r3 pair in double register
	fcmpd	d6, d7		
	fmstat
	movmi	r0, #1		// set result register to 1 if equal
	movpl	r0, #0
	bx	lr
