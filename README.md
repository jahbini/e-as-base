# Irrational bases

I have been looking into the Geometry of 3D structures based on the two triangles with Fibonacci related side lengths.  This Geometrical system creates a six bladed system with intersections always on powers of Phi.

Since the system used the powers of Phi in a fashion similar to our base number representations of 2 or 10 or 16.  However, since Phi is not a rational number how might this work?  A CS grad student one day postulated that base E would make the most efficient numbering system. Is this true?

The included CoffeeScript code is an instructional starting point for  investigations on bases that are non-integers.  The main routine is base-convert.coffee and is used to explore two different aspects that point to possible uses for non-integer bases.

The questions we wanted to explore are:

   -      Space Efficiency:
   -	     Is E an efficient base?
   -	     How does it compare with other irrational numbers?
   -       Rational Numbers?
   -       What factors dictate space efficiency?

## Entropy
   -     Phi generates conversions with surprising regularities
   -     What are they?
   -    Other bases show surprisingly high entropy, and could be suitable for encryption/decryption since nearly any rational number can generate relatively high entropy.

## Geometric serendipity	
  In mathematical derivations, the quantities of (1+sqrt(N))/2 for N=2,3,5,6 are commonplace, especially in geometric computations.  Are there any patterns that arise in these bases?

## Efficiency:
 The space efficient coding of powers of Base 2, at least with integer coefficients, always beats any other base, because of the one to one mapping of integer coefficients into appropriate bit patterns.

While an irrational base seems to dictate huge entropy (except for Phi, a notable exception), even a rational, non-integer base seems to generate surprising entropy.

Those candidates that are just under an eight and can fit in three bits are good: While 7.9 and 7.3 have recurring sequences, and thus moderate entropy, irrationals near 7.9 have excellent entropy and use three bits.  The maximum integer that base 7.9 can be represented in 15 bits is 31160, just shy of the 32768 for base 8.  The result is that a loss of 5% space efficiency results in a vast increase of entropy in the external representation.

Irrationals just under 6.0  would also be a good candidate for high entropy, but allows for a specific bit pattern to indicate meta information.  000 through 110 would encode a digit in base near 6.9, but 111 would be assigned as a delimiter.  With a high value of 15866 in 15 bits, that represents a loss of space efficiency of about 50% (.5158).

Using a smaller base, irrationals near 5.9 give two meta digits, (6 and 7), but overflows 15 bits at 7270, thus losing about 77% of the space efficiency.  However, this is with a gain of a complete new bit pattern that can be inserted anywhere in a message, and simply thrown away upon decoding.  Its presence in the message is arbitrary.

## Observations:

As far as irrational number bases can be represented with integer coefficients, there is opportunity for possible encryption strategies, since base conversion is completely reversible, and can be pipelined.

In addition all these quantities can be computed in the integer domain as outlined in the paper: https://dl.acm.org/doi/pdf/10.1145/359997.360013 Division by constant divisors.

In the other direction,  The bases of Phi, (1+sqrt(N))/2 for N=2,3,5, and 7 see to show some patterns in their representations of simple integer inverses as well as quantities expressed in one of the other bases.   The geometric interpretation of this is unclear, but is likely related to the proportion of the Golden Ratio and a geometric, crystalline matrix based on these geometric constants.  This bears further investigation.







