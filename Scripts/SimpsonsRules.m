%[text] %[text:anchor:T_49B1F781] # Simpson's Rules
%[text] **Author**: Dr. Matthew Leineweber, San Jose State University
%%
%[text:tableOfContents]{"heading":"Table of Contents"}
%%
%[text] %[text:anchor:H_3E7E2D5A] ## Introduction
%[text] In the previous lectures, the trapezoid rule was introduced as a means of numerically integrating either a known function $f(x)${"altText":"f(x)"} or a set of tabulated $(x\_i,y\_i)${"altText":"(x\_i,y\_i)"} data representing some unknown $f(x)${"altText":"f(x)"}. This technique is part of a wider group of integration methods, called *numerical quadrature*, that simplify the integral of $f(x)${"altText":"f(x)"} by approximating $f${"altText":"f"} with a polynomial:
%[text]{"align":"center"} $f\_n(x)  = a\_0 + a\_1x + a\_2x^2 + \\dots + a\_{n-1}x^{n-1} + a\_nx^n${"altText":"f\_n(x) = a\_0 + a\_1x + a\_2x^2 + ... + a\_(n-1)\*x^(n-1) + a\_nx^n"}
%[text] So that the integral of  $f\_n(x)${"altText":"f\_n(x)"} approximates the integral of $f${"altText":"f"}:
%[text]{"align":"center"} $\\int\_a^b{f(x)dx} \\approx \\int\_a^b{f\_n(x) dx}${"altText":"integral from a to b of (f(x)\*dx) approximately equals integral from a to b of (f\_n(x) dx)"}
%[text] For the trapezoid rule, we used a first-order polynomial representation to define $f\_1(x) = a\_0 + a\_1x${"altText":"f\_1(x) = a\_0 + a\_1x"}, where $a\_1${"altText":"a\_1"} is defined as the slope of the line between $a${"altText":"a"} and $b${"altText":"b"}, and is equal to:
%[text]{"align":"center"} $a\_1 =\\frac{f(b)-f(a)}{b-a}${"altText":"a\_1 =(f(b)-f(a))\/(b-a)"}
%[text] Using the point-slope formulation of the first-order polynomial produced the equation:
%[text]{"align":"center"} $f\_1(x)-f(a) = a\_1(x-a)\\ \\rightarrow\\ \\ f\_1(x) = \\frac{f(b)-f(a)}{b-a}(x-a)+f(a)${"altText":"f\_1(x)-f(a) = a\_1(x-a) implies f\_1(x) = (f(b)-f(a))\/(b-a)\*(x-a)+f(a)"}
%[text] We might note that this formulation of $f\_1(x)${"altText":"f\_1(x)"} is equivalent to the first-degree *Lagrange interpolating polynomial*
%[text]{"align":"center"} $f\_n(x) = \\sum\\limits\_{i=0}^n{L\_i(x)f(x\_i)${"altText":"f\_n(x) = sum from i=0 to n of L\_i(x)\*f(x\_i)"}  where  $L\_i(x) = \\prod\\limits\_{\\begin{array}{c} j=0 \\\\ j\\neq i\\end{array}}^n{\\frac{x-x\_j}{x\_i-x\_j}}${"altText":"L\_i(x) = product over j from 0 to n, excluding j=i, of (x-x\_j)\/(x\_i-x\_j)"}
%[text] Letting $n=1${"altText":"n=1"} produces the expression:
%[text]{"align":"center"} $f\_1(x) = \\frac{x-x\_1}{x\_0-x\_1}f(x\_0) + \\frac{x-x\_0}{x\_1-x\_0}f(x\_1)${"altText":"f\_1(x) = (x-x\_1)\/(x\_0-x\_1)\*f(x\_0) + (x-x\_0)\/(x\_1-x\_0)\*f(x\_1)"}
%[text] Letting $x\_0 = a${"altText":"x\_0 = a"} and $x\_1=b${"altText":"x\_1=b"} simplifies our equation to the familiar form:
%[text]{"align":"center"} $\\begin{array}{rcl} f\_1(x) & = & \\frac{x-b}{a-b}f(a) + \\frac{x-a}{b-a}f(b) \n\\\\ & = & \\frac{x-a}{b-a}f(b)  - \\frac{x-b}{b-a}f(a) \n\\\\ & = & \\frac{x\\left(f(b)-f(a)\\right) -  af(b) + bf(a)}{b-a} \\\\ & = & \\frac{f(b)-f(a)}{b-a}(x-a) +f(a) \\end{array}${"altText":"f\_1(x) = (x-b)\/(a-b)\*f(a) + (x-a)\/(b-a)\*f(b); = (x-a)\/(b-a)\*f(b) - (x-b)\/(b-a)\*f(a); = (x\*(f(b)-f(a)) - a\*f(b) + b\*f(a))\/(b-a); = (f(b)-f(a))\/(b-a)\*(x-a) + f(a)"}
%[text] Therefore, our familiar integral approximation becomes:
%[text]{"align":"center"} $\\begin{array}{rcl} \\int\_a^b{f(x)dx} & \\approx & \\int\_a^b{\\left(\\frac{f(b)-f(a)}{b-a}(x-a)+f(a)\\right)dx \n\\\\ & = & \\frac{f(b)-f(a)}{b-a}\\int\_a^b{(x-a)dx} + \\int\_a^b{f(a)dx}\n\\\\ & = & \\frac{f(b)-f(a)}{b-a}\\left.\\left(\\frac{x^2}{2}-ax\\right)\\right|\_a^b + \\left. f(a) x\\right|\_a^b \n\\\\ & = & \\frac{(b-a)(f(b)-f(a))}{2} + f(a)(b-a) \n\\\\ & = & \\left(b-a\\right)\\frac{f(a)+f(b)}{2}\\end{array}${"altText":"Integral from a to b of f(x) dx approximately equals integral from a to b of ((f(b)-f(a))\/(b-a)\*(x-a) + f(a)) dx; = (f(b)-f(a))\/(b-a)\*(integral from a to b of (x-a) dx) + integral from a to b of f(a) dx; = (f(b)-f(a))\/(b-a)\*(x^2\/2 - a\*x) evaluated from a to b + f(a)\*x evaluated from a to b; = (b-a)\*(f(b)-f(a))\/2 + f(a)\*(b-a); = (b-a)\*(f(a)+f(b))\/2"}
%[text] We recognize this final expression as being equivalent to the area of a trapezoid of sides with length $f(a)${"altText":"f(a)"} and $f(b)${"altText":"f(b)"} and width $b-a${"altText":"b-a"}.
%[text] While the trapezoid rule provides a convenient approximation for estimating the area under sections of $f(x)${"altText":"f(x)"} with little curvature, we saw that its accuracy drastically decreases as $(b-a)${"altText":"(b-a)"} increases, and/or when $f(x)${"altText":"f(x)"} has a high degree of curvature on the interval $\[a,b\]${"altText":"\[a,b\]"}. We overcame this limitation by separating the interval $\[a,b\]${"altText":"\[a,b\]"} into many sub-intervals and successively performing the trapezoid rule on each of these smaller segments, but this iterative process required many rounds of calculation.
%[text] An alternate approach to this multiple trapezoid rule is to use higher degree polynomials in our approximation of $f(x)${"altText":"f(x)"}. That is, for our original approximation:
%[text]{"align":"center"} $\\int\_a^b{f(x)dx} \\approx \\int\_a^b{f\_n(x) dx}${"altText":"integral from a to b of (f(x)\*dx) approximately equals integral from a to b of (f\_n(x) dx)"}
%[text] We can choose polynomials of degree $n\>1${"altText":"n\>1"}. In this module, we will explore two such polynomials: (1) a quadratic (second-order) polynomial, and (2) a cubic (third-order) polynomial. The resulting approximations are referred to as the Simpson's 1/3 rule and Simpson's 3/8 rule, respectively.
%%
%[text] %[text:anchor:H_6E67FEB8] ## Simpson's 1/3 rule
%[text] Following a parallel approach, we can let $f(x)\\approx f\_2(x)${"altText":"f(x) approximately equals f\_2(x)"}, where $f\_2(x)${"altText":"f\_2(x)"} is the second-degree Lagrange Interpolating Polynomial for $f(x)${"altText":"f(x)"}:
%[text]{"align":"center"} $f\_2(x) = \\frac{(x-x\_1)(x-x\_2)}{(x\_0-x\_1)(x\_0-x\_2)}f(x\_0) + \\frac{(x-x\_0)(x-x\_2)}{(x\_1-x\_0)(x\_1-x\_2)}f(x\_1) + \\frac{(x-x\_0)(x-x\_1)}{(x\_2-x\_0)(x\_2-x\_1)}f(x\_2)${"altText":"f\_2(x) = ((x-x\_1)\*(x-x\_2))\/((x\_0-x\_1)\*(x\_0-x\_2))\*f(x\_0) + ((x-x\_0)\*(x-x\_2))\/((x\_1-x\_0)\*(x\_1-x\_2))\*f(x\_1) + ((x-x\_0)\*(x-x\_1))\/((x\_2-x\_0)\*(x\_2-x\_1))\*f(x\_2)"}
%[text] Assuming that $x\_1${"altText":"x\_1"} is at the midpoint between $x\_0${"altText":"x\_0"} and $x\_2${"altText":"x\_2"} and integrating this expression over the interval $\[x\_0,x\_2\]${"altText":"\[x\_0,x\_2\]"} produces the approximation:
%[text]{"align":"center"} $I \\approx \\int\_a^b{f\_2(x)dx} = \\frac{h}{3}\\left\[f(x\_0)+4f(x\_1) + f(x\_2)\\right\]${"altText":"I approximately equals integral from a to b of (f\_2(x)\*dx) = (h)\/(3)\[f(x\_0)+4f(x\_1) + f(x\_2)\]"}
%[text] where $h=\\frac{x\_2-x\_0}{2}${"altText":"h=(x\_2-x\_0)\/(2)"}, the distance between neighboring points. For a single application of the Simpson's 1/3 rule, we can see that our integral approximation can be written as $I = \\frac{h}{3}\\left\[f(a) + 4f(a+h)+f(b)\\right\]${"altText":"I = (h)\/(3)\[f(a) + 4f(a+h)+f(b)\]"}. Comparing this formulation to our trapezoid rule approximation, we can immediately see that the Simpson's 1/3 rule requires evaluation of an additional point, $(x\_1,f(x\_1))${"altText":"(x\_1,f(x\_1))"}, on the interval $\[a,b\]${"altText":"\[a,b\]"}.
%%
%[text] %[text:anchor:H_E6E636FA] #### Activity 1: Visualizing Simpson's 1/3 rule
%[text] Play with the sliders below to select an interval $\[a,b\]${"altText":"\[a,b\]"} over which to define the second-degree interpolating polynomial for $f(x)${"altText":"f(x)"}. When selecting values for $a${"altText":"a"} and $b${"altText":"b"}, consider the following:
%[text] 1. How does the accuracy of our interpolating polynomials change as $\[a,b\]${"altText":"\[a,b\]"} increases? Decreases?
%[text] 2. How does the curvature of $f(x)${"altText":"f(x)"} over the interval $\[a,b\]${"altText":"\[a,b\]"} affect the accuracy of the interpolating polynomial? \
a = 0; %[control:slider:98d9]{"position":[5,6]}
b = 3; %[control:slider:17a6]{"position":[5,6]}
Activity1(a,b)
%%
%[text] %[text:anchor:H_3B9BF732] ### Multiple applications of Simpson's 1/3 rule
%[text] Like the trapezoid rule, we can increase the accuracy of our Simpson's 1/3 rule integration by dividing our $\[a,b\]${"altText":"\[a,b\]"} interval into $n${"altText":"n"} sub-intervals of width
%[text]{"align":"center"} $h = \\frac{b-a}{n}${"altText":"h = (b-a)\/(n)"}
%[text] The total integral then becomes:
%[text]{"align":"center"} $I = \\int\_{x\_0}^{x\_2}{f(x)dx} + \\int\_{x\_2}^{x\_4}{f(x)dx} + \\dots + \\int\_{x\_{n-2}}^{x\_n}{f(x)dx}${"altText":"I = integral from x\_0 to x\_2 of (f(x)\*dx) + integral from x\_2 to x\_4 of (f(x)\*dx) + ... + integral from x\_(n-2) to x\_n of (f(x)\*dx)"}
%[text] Notice that each integral is computed over an interval of width $2h${"altText":"2h"}. Substituting the Simpson's 1/3 rule formula for each of these integrals produces:
%[text]{"align":"center"} $I \\approx 2h\\frac{f(x\_0)+4f(x\_1)+f(x\_2)}{6} +  2h\\frac{f(x\_2)+4f(x\_3)+f(x\_4)}{6} + \\dots +  2h\\frac{f(x\_{n-2})+4f(x\_{n-1})+f(x\_n)}{6}${"altText":"I approximately equals 2h(f(x\_0)+4f(x\_1)+f(x\_2))\/(6) + 2h(f(x\_2)+4f(x\_3)+f(x\_4))\/(6) + ... + 2h(f(x\_(n-2))+4f(x\_(n-1))+f(x\_n))\/(6)"}
%[text] Combining terms and substituting our definition of $h${"altText":"h"} produces:
%[text]{"align":"center"} $I \\approx \\left(b-a\\right)\\frac{f(x\_0) + 4\\sum\\limits\_{i=1,3,5\\dots}^{n-1}{f(x\_i)} + 2\\sum\\limits\_{j=2,4,6\\dots}^{n-2}{f(x\_j)} + f(x\_n)}{3n}${"altText":"I approximately equals ((b-a)\/(3\*n))\*\[f(x\_0) + 4\*(sum over i=1,3,5,...,n-1 of f(x\_i)) + 2\*(sum over j=2,4,6,...,n-2 of f(x\_j)) + f(x\_n)\]"}
%[text] where $x\_0=a${"altText":"x\_0=a"} and $x\_n=b${"altText":"x\_n=b"}. Notice that the first factor $(b-a)${"altText":"(b-a)"} represents the width of the interval over which the integral is to be computed, and the fraction represents the average height of all the $f(x\_k)${"altText":"f(x\_k)"} points over that interval, for $k = 1,2,3,\\dots,n${"altText":"k = 1,2,3,...,n"}.
%[text] As with the trapezoid rule, we can see that formulating an algorithm to integrate with Simpson's 1/3 rule requires 5 steps:
%[text] 1. Defining an expression for $f(x)${"altText":"f(x)"}
%[text] 2. Selecting the limits of integration, $a${"altText":"a"} and $b${"altText":"b"}
%[text] 3. Selecting the number of intervals, $n${"altText":"n"}, and define $h = \\frac{b-a}{n}${"altText":"h = (b-a)\/(n)"}
%[text] 4. Summing the $f(x\_i)${"altText":"f(x\_i)"} values for even $i${"altText":"i"} and the $f(x\_j)${"altText":"f(x\_j)"} values for odd $j${"altText":"j"}
%[text] 5. Calculate $I${"altText":"I"} using the formula. \
%[text] Steps 1-3 are all defined by the user, while steps 4 and 5 must be completed by the algorithm. While this process is very similar to the trapezoid rule, we see one major difference introduced by step 3. Namely, we must use a different summation depending on whether our current value $x\_k${"altText":"x\_k"} is even or odd.
%%
%[text] %[text:anchor:H_B77832AD] ### Developing an algorithm for multiple applications of Simpson's 1/3 rule
%[text] We can convert our five-step process into pseudocode steps:
%[text] ```
%[text] f(x) = Anonymous function containing the function to be integrated
%[text] a = lower limit
%[text] b = upper limit
%[text] n = number of intervals
%[text] h = (b-a)/n
%[text] I = f(a)
%[text] for k starting at 1 and counting to n-2 by intervals of 2
%[text]     I = I + 4*f(k*h) + 2*f((k+1)*h);
%[text] end
%[text] I = I + 4*f((n-1)*h) + 2*f(n*h);
%[text] I = (b-a)*I/3
%[text] ```
%[text] Consider the loop in the pseudocode. We can see that the values of $k${"altText":"k"} will be:
%[text]{"align":"center"} $k = 1,3,5,\\dots,n-2${"altText":"k = 1,3,5,...,n-2"}
%[text] Therefore, recalling that our points $x\_1, x\_2, \\dots, x\_n${"altText":"x\_1, x\_2, ..., x\_n"} are defined as:
%[text]{"align":"center"} $x\_1 = a+h \\\\ x\_2 = a+2h \\\\ \\vdots \\\\ x\_n = a+nh${"altText":"x\_1 = a+h; x\_2 = a+2h; ...; x\_n = a+n\*h"}
%[text] The expression `k*h` will return $h,3h,5h,\\dots,(n-3)h${"altText":"h,3h,5h,...,(n-3)\*h"}, which contains the $x\_k${"altText":"x\_k"} terms for odd $k${"altText":"k"}. Similarly, the `(k+1)*h` expression will return the $x\_k${"altText":"x\_k"} for even $k${"altText":"k"}: $2h,4h,\\dots,(n-2)h${"altText":"2h,4h,...,(n-2)\*h"}. Let's take a look at how these terms are affected by our selection of $n${"altText":"n"}.
n = 3 %[control:slider:9641]{"position":[5,6]}
T = Activity2(n)
disp(T)
%[text] Notice that when $n${"altText":"n"} is even, the final term in the x\_(k+1) column always corresponds to $x\_{n-2}${"altText":"x\_(n-2)"}. However, when $n${"altText":"n"} is odd, this final term corresponds to $x\_{n-1}${"altText":"x\_(n-1)"}, which means that our algorithm will no longer work, since we end up adding contributions from the $x\_{n-1}${"altText":"x\_(n-1)"} term twice. **Therefore, we can conclude that our algorithm for the Simpson's 1/3 rule will only work when** $n${"altText":"n"} **is an even number of intervals.**
%%
%[text] %[text:anchor:H_B725BCBC] #### Activity 2: Algorithm for multiple applications of Simpson's 1/3 rule
%[text] In this activity, we will walk through the steps of using multiple applications of Simpson's 1/3 rule to integrate the expression:
%[text]{"align":"center"} $f(x)=5\\sin{\\left(\\frac{\\pi}{10}x\\right)}${"altText":"f(x) = 5\*sin((pi\/10)\*x)"}
%[text] over the interval $0\\leq x \\leq 10${"altText":"0 \<= x \<= 10"}. As a starting point, let's use $n=6${"altText":"n=6"} intervals to visualize our approximation.
%[text] **Step 1:** Define an expression for $f(x)${"altText":"f(x)"} as an anonymous function named `fx`:

%[text] **Step 2:** Define the limits of integration

%[text] **Step 3:** Define the number of intervals $n${"altText":"n"} and the interval width $h${"altText":"h"}

%[text] Now that this user-defined information has been established, let's convert our pseudocode into actual MATLAB commands
% Define the first point in the integral f(a) [replace the expression for I]
I = NaN;

% Loop through the points corresponding to x_1 to x_(n-2)
for k = 1:2:(n-2)
    % Add the new terms in the denominator

end

% Add 4*f(x_(n-1)) and 2*f(n)


% Multiply the numerator by h/3


% Display the result
fprintf("I = %2.4f",I)
%[text] We can compare this result to the analytical solution:
%[text]{"align":"center"} $I = \\int\_0^{10}{5\\sin\\left({\\frac{\\pi}{10}x}\\right)dx} = \\left.-\\frac{50}{\\pi}\\cos{\\left(\\frac{\\pi}{10}x\\right)}\\right|\_0^{10} = \\frac{100}{\\pi}\\approx 31.83${"altText":"I = integral from 0 to 10 of 5\*sin((pi\/10)\*x) dx = -(50\/pi)\*cos((pi\/10)\*x) evaluated from 0 to 10 = 100\/pi, approximately 31.83"}
%[text] We see that our estimate is very accurate, even with a relatively small number of intervals.
%%
%[text] %[text:anchor:H_8A5251D3] #### Activity 3: Creating a function for Simpson's 1/3 rule
%[text] Now that we have an algorithm for the Simpson's 1/3 rule, it is fairly straightforward to convert this algorithm into a function. As an exercise, look through the definition of the `Simpsons13` function at the end of this live script and compare it to the algorithm we developed in the previous section.
%[text] Let's see how our function compares to our previous algorithm.
%[text] **Task.** Uncomment the code below by removing the % and then run this section.
%I = Simpsons13(fx,0,10,6)
%%
%[text] %[text:anchor:H_C7C59C8E] ### Simpson's 1/3 rule with discrete data
%[text] So far, we have always had a mathematical expression defining $f(x)${"altText":"f(x)"}. However, it is often the case that we instead have tabulated $(x\_i,y\_i)${"altText":"(x\_i,y\_i)"} data, where the underlying mathematical function is unknown. In this case, we have to make slight modifications to our algorithm. As long as our tabulated data has an odd number of evenly spaced $x\_i${"altText":"x\_i"} points, we can simply let each $y\_i${"altText":"y\_i"} point be equivalent to $f(x\_i)${"altText":"f(x\_i)"}, so our equation becomes:
%[text]{"align":"center"} $I\\approx\\left(b-a\\right)\\frac{y\_0 + 4\\sum\\limits\_{i=1,3,5\\dots}^{n-1}{y\_i} + 2\\sum\\limits\_{j=2,4,6\\dots}^{n-2}{y\_j} + y\_n}{3n}${"altText":"I approximately equals ((b-a)\/(3\*n))\*\[y\_0 + 4\*(sum over i=1,3,5,...,n-1 of y\_i) + 2\*(sum over j=2,4,6,...,n-2 of y\_j) + y\_n\]"}
%[text] where $n = N-1${"altText":"n = N-1"} is equal to the number of intervals in the $(x\_i,y\_i)${"altText":"(x\_i,y\_i)"} dataset, and $N${"altText":"N"} is the number of points in the dataset. Refer to the `Simps13` function at the end of this module to see how the algorithm changed. Notice that we were able to get rid of the loop entirely by using indexing methods to directly select every other element in the $x${"altText":"x"} and $y${"altText":"y"} vectors.
x = 0:10;
y = [0 1.5451 2.9389 4.0451 4.7553 5.0000 4.7553 4.0451 2.9389 1.5451 0];

I = Simps13(x,y)
%[text] Looking at the `Simps13` function below, we can see that it operates much the same as `Simpsons13`, but rather than evaluating the $y${"altText":"y"}-points from a known $f(x)${"altText":"f(x)"} function, they are simply selected from the `y` input argument. Therefore, the algorithm used to perform this integration is identical to what would be used when calculating the integral by hand from a set of tabulated data.
%[text] While multiple applications of Simpson's 1/3 rule generally produces a more accurate estimate than the trapezoid rule, we can see that it still is limited by a few key assumptions. Namely, the intervals must be equispaced, and an odd number of points must be used. While the equispaced data requirement must remain in place for now, we combine an additional technique, called the Simpson's 3/8 rule, with the Simpson's 1/3 rule to enable evaluation of integrals with an odd number of intervals and an even number of points.
%%
%[text] %[text:anchor:H_68D9DF34] ### Simpson's 3/8 rule
%[text] So far, we have seen the application of first-order (trapezoid rule) and second-order (Simpson's 1/3 rule) Lagrange polynomials to derive our numerical integration formulas. Recall that an $n^{th}${"altText":"nth"}-order polynomial requires at least $n+1${"altText":"n+1"} points to be fully defined, which is why the trapezoid rule requires at least two points, and the Simpson's 1/3 rule requires at least three points. It follows, therefore, that application of a third-order Lagrange polynomial would require at least $3+1 =4${"altText":"3+1 =4"} points. The derivation of this formula is much the same as for the Simpson's 1/3 rule, and follows from:
%[text]{"align":"center"} $I = \\int\_a^b{f(x) dx} \\approx \\int\_a^b{f\_3(x) dx}${"altText":"I = integral from a to b of (f(x) dx) approximately equals integral from a to b of (f\_3(x) dx)"}
%[text] where $f\_3(x)${"altText":"f\_3(x)"} is the third-order Lagrange polynomial representing $f(x)${"altText":"f(x)"} over the $\[a,b\]${"altText":"\[a,b\]"} interval. Performing this integration produces the Simpson's 3/8 rule:
%[text]{"align":"center"} $\\begin{array}{rcl} I & \\approx & \\frac{3h}{8}\\left\[f(a) + 3f(x\_1) + 3f(x\_2) + f(b)\\right\] \\\\ &= & \\left(b-a\\right)\\frac{f(a) + 3f(x\_{1}) + 3f(x\_{2}) + f(b)}{8} \\end{array}${"altText":"I approximately equals (3\*h\/8)\*\[f(a) + 3\*f(x\_1) + 3\*f(x\_2) + f(b)\]; = (b-a)\*(f(a) + 3\*f(x\_1) + 3\*f(x\_2) + f(b))\/8"}
%[text] where $x\_1${"altText":"x\_1"} and $x\_2${"altText":"x\_2"} are interior points separated by equal distance $h = (b-a)/3${"altText":"h = (b-a)\/3"}. The Simpson's 3/8 rule is somewhat more accurate than the Simpson's 1/3 rule, but it requires an additional point in the calculation, which increases the time required to compute the integral. However, the primary advantage of the Simpson's 3/8 rule is that it allows for integration over an odd number of segments (i.e. an even number of points). For example, consider the case where $N = 12${"altText":"N = 12"} points are used. Since $N=12${"altText":"N=12"} can be easily separated into three groups of four points, the Simpson's 3/8 rule can be easily applied three times using points $\\left\[x\_1, x\_2, x\_3, x\_4\\right\]${"altText":"\[x\_1, x\_2, x\_3, x\_4\]"}, $\\left\[x\_5,x\_6,x\_7,x\_8\\right\]${"altText":"\[x\_5,x\_6,x\_7,x\_8\]"}, and $\\left\[x\_9, x\_{10}, x\_{11}, x\_{12}\\right\]${"altText":"\[x\_9, x\_10, x\_11, x\_12\]"}. Suppose, however, only $N = 10${"altText":"N = 10"} points were used, so that the interval was divided into nine segments. In this case, the Simpson's 1/3 rule could be used for the first two segments, followed by the Simpson's 3/8 rule for the remaining seven segments.
%%
%[text] %[text:anchor:H_F62F9037] #### Activity 4: Visualizing Simpson's 3/8 rule
%[text] Choose the number of intervals to approximate the integral of the function and see how changing the number of intervals affects the integral approximation.
% Select the number of intervals, n
n = 1; %[control:slider:84b6]{"position":[5,6]}

% Select the function to be integrated
fx = @(x) 5-(x-2.5).^2 -cos(pi*x); %[control:dropdown:719e]{"position":[6,34]}
Activity4(fx,n)
%[text] Notice how using an even number of intervals enables the Simpson's 1/3 rule (red) to be used for the entire integral approximation. Conversely, using an odd number of intervals allows us to use the Simpson's 3/8 rule (blue) for all but two of the intervals.
%[text] %[text:anchor:H_56EB1050] #### Concept question
%[text] Notice that using a single interval enables the Simpson's 3/8 rule to provide a very accurate approximation of the integral for some functions but not others. Looking at the definition of the Simpson's 3/8 rule:
%[text]{"align":"center"} $I \\approx \\left(b-a\\right)\\frac{f(a) + 3f(x\_{1}) + 3f(x\_{2}) + f(b)}{8}${"altText":"I approximately equals (b-a)\*(f(a) + 3f(x\_1) + 3f(x\_2) + f(b))\/(8)"}
%[text] Explain why this is the case. Under what conditions will performing the Simpson's 3/8 rule with a single interval provide a good approximation of the true integral?
%%
%[text] %[text:anchor:H_4BCFDC29] ### Algorithm for Simpson's 3/8 rule
%[text] The following pseudocode can be used to develop an algorithm for multiple applications of the Simpson's 3/8 rule:
%[text] ```
%[text] n = number of intervals
%[text] a = lower bound of integral
%[text] b = upper bound of integral
%[text] fx = function f(x)
%[text] function Simps38(fx,n,a,b)
%[text]    I = 0
%[text]    dx = (b-a)/n
%[text]    x = a:dx:b
%[text]    for i = 1:n
%[text]        h = (x(i+1)-x(i))/3;
%[text]        I = I + (3/8)*h*(fx(x(i)) + 3*fx(x(i)+h) + 3*fx(x(i)+2*h) + fx(x(i+1)));
%[text]    end
%[text] end
%[text] ```
%[text] Note that in this pseudocode, each interval $\[x\_i,x\_{i+1}\]${"altText":"\[x\_i,x\_(i+1)\]"} is subdivided into 3 smaller intervals. This implies that any input $n${"altText":"n"} can be used.
%%
%[text] %[text:anchor:H_DB540F6D] #### Activity 5: Simpson's 3/8 rule function
%[text] Use the pseudocode provided above to define a function called `Simps38` that performs the Simpson's 3/8 rule. Define the function under the **Function definitions** header below, then use your code to approximate the following integrals:
%[text] 1. $f(x) = e^{-0.5x} - e^{-0.25x}${"altText":"f(x) = e^(-0.5x) - e^(-0.25x)"} for $0\\leq x \\leq 20${"altText":"0 \<= x \<= 20"} using $n = 2, \\ n = 4, \\ n=10${"altText":"n = 2, n = 4, n=10"}
%[text] 2. $g(x) = e^{-0.1x}\\cos{\\frac{\\pi}{2} x}${"altText":"g(x) = e^(-0.1\*x)\*cos((pi\/2)\*x)"} for $0\\leq x \\leq 20${"altText":"0 \<= x \<= 20"} using $n = 2, \\ n = 4, \\ n=10${"altText":"n = 2, n = 4, n=10"} \
% Call your function to compute the integrals here

%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] %[text:anchor:H_B3AFCDC1] ## Function definitions
%[text] %[text:anchor:H_5075AEA7] #### Simpson's 1/3 rule when f(x) is known
function I = Simpsons13(fun,a,b,n)
%Function to estimate the integral of the expression contained in fun over the interval [a,b]
%divided into n sub-intervals

% Check if n is odd
if rem(n,2) ~= 0
    error("Error: n must be an even number of intervals")
end

% Define step size h
h = (b-a)/n;

% Perform Integration
I = fun(a);
for k = 1:2:(n-2)
    % Add the new terms in the denominator
    I = I + 4*fun(k*h) + 2*fun((k+1)*h);
end
I = (h/3)*(I + 4*fun((n-1)*h) + fun(n*h));
end
%[text] %[text:anchor:H_C09749AA] #### Simpson's 1/3 rule for discrete data
function I = Simps13(x,y)
%Function to estimate the intergral of the discrete (x,y) data points.
%x should be a vector of independent variable, and y is a vector
%representing f(x) at each x coordinate

N = numel(x);

% Check if n is odd
if rem(N,2) == 0
    error("Error: The dataset must contain an odd number of data points")
end

% Check that the data is evenly spaced
if mean(diff(x,2)) ~=0
    error("Error: The dataset must contain evenly-spaced points")
end

% Points for f(x1), f(x3), ... f(x_n-1)
yOdd = y(2:2:N-1);

% Points for f(x2), f(x4), ... f(x_(n-2))
yEven = y(3:2:N-2);
numerator = y(1) + 4*sum(yOdd) + 2*sum(yEven) + y(N);
I = (x(N)-x(1))/(3*(N-1)) * numerator;

end
%[text] **Simpson's 3/8 rule**
% Write your function for the Simpson's 3/8 rule here


%[text] **Activity helper functions**
function Activity1(a,b)

% range of x
x = linspace(0,5,1000);

% Function to be integrated
fx = @(x) 5-(x-2.5).^2 - cos(pi*x);

% Plot Function
plot(x,fx(x),LineWidth=1,SeriesIndex="none")
grid on
xlabel("x",Interpreter="latex")
ylabel("f(x)",Interpreter="latex")
title("Activity 1")

% Perform Simpson's Rule
h = (b-a)/2;
x1 = a+h;

xInt = a:h/100:b;

% Brute Force Lagrange Polynomial
f2 = ((xInt-x1).*(xInt-b))./((a-x1)*(a-b))*fx(a) + ...
    ((xInt-a).*(xInt-b))./((x1-a)*(x1-b))*fx(x1) + ...
    ((xInt-a).*(xInt-x1))./((b-a)*(b-x1))*fx(b);

% Plot Result
hold on
plot(xInt,f2,LineWidth=1.5,SeriesIndex=1)
cmap = colororder;
plot(x1,fx(x1),"o",SeriesIndex=2,MarkerFaceColor=cmap(2,:))
plot([a,b],[fx(a),fx(b)],"o",MarkerFaceColor=cmap(1,:),SeriesIndex=1)
area(xInt,f2,FaceAlpha=0.15,SeriesIndex=1)
hold off

legend("$f(x)$","$f_2(x)$","$x_1$ = " + num2str(round(x1,2)),"Interpreter","latex")

ax = gca;
ax.XAxisLocation = "origin";
ax.XTick = unique(sort([0:10,a,b],"ascend"));
ax.XTickLabel{ax.XTick == a} = "a";
ax.XTickLabel{ax.XTick == b} = "b";

end

function T = Activity2(n)
%ACTIVITY2 Defines table of k, x_k, and x_(k+1) to illustrate the
%effects of the number of intervals on the Simpson's 1/3 Rule

% Counter
k = 1:2:(n-2);

xk = string.empty(numel(k),0);
xk1 = xk;

for i = 1:numel(k)
    % Define xk
    xk(i,1) = "x_" + num2str(k(i));
    % define x_(k_1)
    xk1(i,1) = "x_" + num2str(k(i)+1);
end

k = k(:);
T = table(k,xk,xk1);
%    T.Properties.VariableNames = {'k','x_k','x_(k+1)'};
T.Properties.VariableNames = ["k" "x_k" "x_(k+1)"];
end

function Activity4(fx,n)

% range of x
x = linspace(0,5,1000);

% Plot Function
plot(x,fx(x),LineWidth=1,SeriesIndex="none")
grid on
xlabel("x",Interpreter="latex")
ylabel("f(x)",Interpreter="latex")
title("Activity 4")
hold on

% Define Data Points
h = (x(end)-x(1))/n;
x = x(1):h:x(end);

% Determine Which Method to Use
if n == 1
    h = (x(end) - x(1))/3;
    x0 = x(1);
    x3 = x(end);
    x1 = x0 + h;
    x2 = x0 + 2*h;

    p = polyfit([x0 x1 x2 x3],fx([x0 x1 x2 x3]),3);
    xint = linspace(x(1),x(end),100);
    f38 = polyval(p,xint);

    plot(xint,f38,LineWidth=1.5,SeriesIndex=1)
    plot([x0 x1 x2 x3],fx([x0 x1 x2 x3]),"o",LineWidth=1.5,SeriesIndex=1)
    area(xint,f38,FaceAlpha=0.15,SeriesIndex=1,EdgeColor="none")

    I = (3/8)*h*(fx(x0) + 3*fx(x1) + 3*fx(x2) + fx(x3));
elseif rem(n,2) == 1
    I = 0;
    % Odd number of intervals: Use 1/3 Rule for first 3 points
    for i = 1:2
        h = (x(i+1) - x(i))/2;
        x0 = x(i);
        x2 = x(i+1);
        x1 = x0 + h;

        p = polyfit([x0 x1 x2],fx([x0 x1 x2]),2);
        xint = linspace(x0,x2,100);
        f2 = polyval(p,xint);

        plot(xint,f2,LineWidth=1.5,SeriesIndex=2)
        plot([x0 x1 x2],fx([x0 x1 x2]),"o",LineWidth=1.5,SeriesIndex=2)
        area(xint,f2,FaceAlpha=0.15,SeriesIndex=2,EdgeColor="none")
        I = I + h/3*(fx(x0) + 4*fx(x1) + fx(x2));
    end
    % Now use 3/8 rule for remaining points
    for i = 3:(numel(x)-1)
        h = (x(i+1) - x(i))/3;
        x0 = x(i);
        x3 = x(i+1);
        x1 = x0 + h;
        x2 = x0 + 2*h;

        p = polyfit([x0 x1 x2 x3],fx([x0 x1 x2 x3]),3);
        xint = linspace(x(i),x(i+1),100);
        f38 = polyval(p,xint);

        plot(xint,f38,LineWidth=1.5,SeriesIndex=1)
        plot([x0 x1 x2 x3],fx([x0 x1 x2 x3]),"o",LineWidth=1.5,SeriesIndex=1)
        area(xint,f38,FaceAlpha=0.15,SeriesIndex=1,EdgeColor="none")

        I = I + (3/8)*h*(fx(x0) + 3*fx(x1) + 3*fx(x2) + fx(x3));
    end
else
    I = 0;
    % Even number of Intervals: Use 1/3 Rule
    for i = 1:(numel(x)-1)
        h = (x(i+1) - x(i))/2;
        x0 = x(i);
        x2 = x(i+1);
        x1 = x0 + h;

        p = polyfit([x0 x1 x2],fx([x0 x1 x2]),2);
        xint = linspace(x0,x2,100);
        f2 = polyval(p,xint);

        plot(xint,f2,LineWidth=1.5,SeriesIndex=2)
        plot([x0 x1 x2],fx([x0 x1 x2]),"o",LineWidth=1.5,SeriesIndex=2)
        area(xint,f2,FaceAlpha=0.15,SeriesIndex=2,EdgeColor="none")

        I = I + h/3*(fx(x0) + 4*fx(x1) + fx(x2));
    end
end
hold off

Itrue = integral(fx,0,5);

fprintf("True Integral: %2.4f \n",Itrue)
fprintf("Approximate Integral:  %2.4f \n",I)
fprintf("Error: %2.3f%% \n",abs(Itrue - I)/Itrue*100)

end

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":40}
%---
%[control:slider:98d9]
%   data: {"defaultValue":0,"label":"a","max":2.9,"min":0,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:17a6]
%   data: {"defaultValue":3,"label":"b","max":5,"min":3,"run":"Section","runOn":"ValueChanging","step":0.1}
%---
%[control:slider:9641]
%   data: {"defaultValue":3,"label":"n","max":20,"min":3,"run":"Section","runOn":"ValueChanging","step":1}
%---
%[control:slider:84b6]
%   data: {"defaultValue":1,"label":"n","max":10,"min":1,"run":"Section","runOn":"ValueChanging","step":1}
%---
%[control:dropdown:719e]
%   data: {"defaultValue":"@(x) 5-(x-2.5).^2 -cos(pi*x)","itemLabels":["Function 1","Function 2","Function 3"],"items":["@(x) 5-(x-2.5).^2 -cos(pi*x)","@(x) 5-(x-2.5).^2","@(x) (x-2.5).^2.*sin(pi*x)"],"label":"Drop down","run":"Section"}
%---
