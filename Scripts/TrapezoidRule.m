%[text] %[text:anchor:T_03C55E74] # The Trapezoid Rule
%[text] **Author**: Dr. Matthew Leineweber, San Jose State University
%%
%[text:tableOfContents]{"heading":"Table of Contents"}
%%
%[text] %[text:anchor:H_633AAAD3] ## Introduction
%[text] In calculus, you were introduced to the concept of integration. Specifically, the *definite integral* of a function $f(x)${"altText":"f(x)"} over the range $a \\leq x \\leq b${"altText":"a \<= x \<= b"} is denoted:
%[text]{"align":"center"} $I = \\int\_a^bf(x)dx${"altText":"I = integral from a to b of f(x) dx"}
%[text] The integral $I${"altText":"I"} can be represented graphically as shown in Figure 1.
%[text]{"align":"center"} ![A shaded region I bounded above by a curvy function labeled f(x), on the left by x=a, on the bottom by the x-axis, and on the right by x=b](text:image:9ad5)
%[text]{"align":"center"} **Figure 1:** The definite integral of $f(x)${"altText":"f(x)"} over the range $a\\leq x \\leq b${"altText":"a \<= x \<= b"} is equal to the area under the curve defined by $f(x)${"altText":"f(x)"} over that range.
%[text] While this integral can sometimes be computed analytically, so long as the anti-derivative $F(x)${"altText":"F(x)"} of $f(x)${"altText":"f(x)"} is known, there are often cases where the anti-derivative is either impossible or very difficult to obtain. In these situations, it becomes necessary to approximate the value of the definite integral using other means. By realizing that the value computed by the definite integral, $I${"altText":"I"}, simply represents the area under $f(x)${"altText":"f(x)"}, we might see that we could estimate $I${"altText":"I"} by separating the shaded region in Figure 1 into smaller sub-regions whose areas can be easily calculated, and then summing these areas. This technique is called *numerical quadrature* and uses interpolating polynomials to approximate $f\_n(x)${"altText":"f\_n(x)"} over each sub-region. Specifically, numerical quadrature equations state:
%[text]{"align":"center"} $I = \\int\_a^b{f(x) dx} \\approx \\int\_a^b{f\_n(x) dx}${"altText":"I = integral from a to b of (f(x) dx) approximately equals integral from a to b of (f\_n(x) dx)"}
%[text] where $f\_n(x)${"altText":"f\_n(x)"} is an $n^{th}${"altText":"nth"}-degree polynomial of the form:
%[text]{"align":"center"} $f\_n(x) = a\_0 + a\_1x + \\dots + a\_{n-1}x^{n-1}+a\_nx^n${"altText":"f\_n(x) = a\_0 + a\_1x + ... + a\_(n-1)\*x^(n-1)+a\_nx^n"}
%[text] that approximates the function $f(x)${"altText":"f(x)"} over the region $a\\leq x \\leq b${"altText":"a \<= x \<= b"}. In the activity below, use the slider-bars to select the values for $a${"altText":"a"} and $b${"altText":"b"}, as well as the degree of polynomial $n${"altText":"n"} to visualize how the integral approximation is affected by each term.
%%
%[text] %[text:anchor:H_01B80514] #### Activity 1: Visualizing numerical quadrature
%[text] Use the sliders below to select the left bound of integration $a${"altText":"a"}, right bound of integration $b${"altText":"b"}, and the order of the polynomial to be used to represent $f(x)${"altText":"f(x)"} over the $\[a,b\]${"altText":"\[a,b\]"} interval.
a =1; %[control:slider:34e5]{"position":[4,5]}
b =6; %[control:slider:64a3]{"position":[4,5]}
n =1; %[control:slider:61e8]{"position":[4,5]}

PolyExample(a,b,n)
%[text] %[text:anchor:H_3F43151C] #### Question set 1
%[text] 1. Change the limits of integration so that you are evaluating the integral over the interval $\[3,6\]${"altText":"\[3,6\]"}. Explore the effect of changing $n${"altText":"n"} on this interval. Which degree polynomial best approximates the function?
%[text] 2. Now change the interval to $\[4,6\]${"altText":"\[4,6\]"}. How much does changing $n${"altText":"n"} affect the estimate of the integral?
%[text] 3. Finally, select the interval $\[6,6.5\]${"altText":"\[6,6.5\]"}. How does changing $n${"altText":"n"} affect the estimate of the integral?
%[text] 4. Based on your observations in questions 1, 2, and 3, what effects do your choice of $a${"altText":"a"}, $b${"altText":"b"}, and $n${"altText":"n"} have on the accuracy of your integral approximations? \
%%
%[text] %[text:anchor:H_D08274B7] ## Trapezoid rule
%[text] In the previous activity, you probably saw that higher-degree polynomials provided the best approximation of $f(x)${"altText":"f(x)"}, and that the closer $a${"altText":"a"} and $b${"altText":"b"} were to each other, the better the polynomial $f\_n(x)${"altText":"f\_n(x)"} approximated the function $f(x)${"altText":"f(x)"}. However, these higher-order polynomials can be difficult to integrate and choosing a different polynomial for each $f(x)${"altText":"f(x)"} can be time-consuming and impractical.
%[text] In the previous activity, you probably saw that first-degree polynomials (i.e. lines) provided a good approximation of $f(x)${"altText":"f(x)"} when  $\[a,b\]${"altText":"\[a,b\]"} was small. Indeed, for small intervals, any function $f(x)${"altText":"f(x)"} can be approximated with a first-order polynomial:
%[text]{"align":"center"} $f\_1(x) = a\_0 + a\_1x${"altText":"f\_1(x) = a\_0 + a\_1x"}
%[text] where $a\_0 = f(a)${"altText":"a\_0 = f(a)"} and $a\_1 = \\frac{f(b)-f(a)}{b-a}${"altText":"a\_1 = (f(b)-f(a))\/(b-a)"}. Substituting these terms into our numerical quadrature approximation produces:
%[text]{"align":"center"} $I \\approx \\int\_a^b{f\_1(x) dx} = \\int\_a^b{\\left\[f(a) + \\frac{f(b)-f(a)}{b-a} (x-a) \\right\]} dx${"altText":"I approximately equals integral from a to b of (f\_1(x) dx) = integral from a to b of (\[f(a) + (f(b)-f(a))\/(b-a) (x-a) \]) dx"}
%[text] Evaluating the integral produces:
%[text]{"align":"center"} $I\\approx \\left(b-a\\right)\\frac{f(a)+f(b)}{2}${"altText":"I approximately equals (b-a)\*(f(a)+f(b))\/(2)"}
%[text] This approximation is called the *trapezoid rule*. But what if we want to use this approximation for larger intervals $\[a,b\]${"altText":"\[a,b\]"}? We already saw that this linear approximation is not always a good fit. However, what if we broke the interval into smaller sub-intervals? Recall that an integral can be calculated piecewise:
%[text]{"align":"center"} $I = \\int\_a^b{f(x) dx} = \\int\_a^{x\_1}{f(x) dx} + \\int\_{x\_1}^{x\_2}{f(x) dx} + \\dots + \\int\_{x\_{n-1}}^b{f(x) dx}${"altText":"I = integral from a to b of (f(x) dx) = integral from a to x\_1 of (f(x) dx) + integral from x\_1 to x\_2 of (f(x) dx) + ... + integral from x\_(n-1) to b of (f(x) dx)"}
%[text] where $x\_1, x\_2, \\dots x\_{n-1}${"altText":"x\_1, x\_2, ... x\_(n-1)"} lie on the $\[a,b\]${"altText":"\[a,b\]"} interval. Using this sub-interval approximation, we can rewrite the integral as
%[text]{"align":"center"} $I = I\_0 + I\_1 + I\_2 + \\dots + I\_{n-1}${"altText":"I = I\_0 + I\_1 + I\_2 + ... + I\_(n-1)"}
%[text] and define:
%[text]{"align":"center"} $I\_i = \\int\_{x\_i}^{x\_{i+1}}{f(x) dx}${"altText":"I\_i = integral from x\_i to x\_(i+1) of (f(x) dx)"}
%[text] So, if we let $f(x) \\approx f\_1(x) = f(x\_i) + \\frac{f(x\_{i+1})-f(x\_i)}{x\_{i+1}-x\_i}(x-x\_0)${"altText":"f(x) approximately equals f\_1(x) = f(x\_i) + (f(x\_(i+1))-f(x\_i))\/(x\_(i+1)-x\_i)\*(x-x\_0)"}, we see that
%[text]{"align":"center"} $I\_i \\approx \\left(x\_{i+1}-x\_i\\right)\\frac{f(x\_i)+f(x\_{i+1})}{2}${"altText":"I\_i approximately equals (x\_(i+1)-x\_i)\*(f(x\_i)+f(x\_(i+1)))\/(2)"}
%[text] So, our integral becomes:
%[text]{"align":"center"} $I \\approx \\left(x\_{1}-x\_0\\right)\\frac{f(x\_0)+f(x\_{1})}{2} + \\left(x\_{2}-x\_1\\right)\\frac{f(x\_1)+f(x\_{2})}{2} + \\dots + \\left(x\_{n}-x\_{n-1}\\right)\\frac{f(x\_{n-1})+f(x\_{n})}{2}${"altText":"I approximately equals (x\_1-x\_0)\*(f(x\_0)+f(x\_1))\/(2) + (x\_2-x\_1)\*(f(x\_1)+f(x\_2))\/(2) + ... + (x\_n-x\_(n-1))\*(f(x\_(n-1))+f(x\_n))\/(2)"}
%[text] If we choose $\[x\_0,x\_1, x\_2, \\dots, x\_{n}\]${"altText":"\[x\_0,x\_1, x\_2, ..., x\_n\]"} to be $n+1${"altText":"n+1"} evenly spaced points on the interval $\[a,b\]${"altText":"\[a,b\]"}, then $\\Delta x = x\_{i+1}-x\_i = \\frac{b-a}{n}${"altText":"delta x = x\_(i+1)-x\_i = (b-a)\/(n)"} with $x\_0 = a${"altText":"x\_0 = a"} and $x\_n=b${"altText":"x\_n=b"}. Substituting these values into the previous equation produces:
%[text]{"align":"center"} $\\begin{array}{rcl} \nI & \\approx & \\left(a + \\Delta x-a\\right)\\frac{f(a)+f(x\_{1})}{2} + \\left(a+2\\Delta x-(a + \\Delta x)\\right)\\frac{f(x\_1)+f(x\_{2})}{2} + \\dots + \\left(b-(a+(n-1)\\Delta x)\\right)\\frac{f(x\_{n-1})+f(b)}{2} \n\\\\ \n& = & \\Delta x\\frac{f(a)+f(x\_1)}{2} + \\Delta x\\frac{f(x\_1)+f(x\_2)}{2} + \\dots + \\Delta x \\frac{f(x\_{n-1})+f(b)}{2} \n\\\\ \n& = & \\frac{\\Delta x}{2}\\left\[f(a) + 2\\sum\\limits\_{i=1}^{n-1}{f(x\_i)} + f(b)\\right\]\n \\end{array}${"altText":"I approximately equals (a + delta x - a)\*(f(a)+f(x\_1))\/2 + (a + 2\*delta x - (a + delta x))\*(f(x\_1)+f(x\_2))\/2 + ... + (b - (a + (n-1)\*\*delta x))\*(f(x\_(n-1))+f(b))\/2; = delta x(f(a)+f(x\_1))\/2 + delta x\*(f(x\_1)+f(x\_2))\/2 + ... + delta x\*(f(x\_(n-1))+f(b))\/2; = (delta x\/2)\*\[f(a) + 2\*(sum from i=1 to n-1 of f(x\_i)) + f(b)\]"}
%[text] Substituting for $\\Delta x${"altText":"delta x"} produces the *multiple trapezoid rule*:
%[text]{"align":"center"} $I \\approx \\frac{b-a}{2n}\\left\[f(a) + 2\\sum\\limits\_{i=1}^{n-1}{f(x\_i)} + f(b)\\right\] \\end{array}${"altText":"I approximately equals ((b-a)\/(2\*n))\*\[f(a) + 2\*(sum from i=1 to n-1 of f(x\_i)) + f(b)\]"}
%[text] This equation means that the area under any curve can be approximated by a summation of a finite number of $n${"altText":"n"} trapezoids over the interval $\[a,b\]${"altText":"\[a,b\]"}. In the next activity, we'll explore how changing the number of trapezoids (i.e. changing $n${"altText":"n"}) affects our integral approximation.
%%
%[text] %[text:anchor:H_D762B5FA] #### Activity 2: How does the number of sub-intervals affect our estimate
%[text] In this activity, we will use the multiple trapezoids rule to integrate the function:
%[text]{"align":"center"} $f(x) = xe^{-x^{-0.08}} + 0.2${"altText":"f(x) = xe^(-x^(-0.08)) + 0.2"}
%[text] Over the range $0\\leq x \\leq 8${"altText":"0 \<= x \<= 8"}. You'll be able to select the number of trapezoids being used for the approximation. Before proceeding with this activity, take a few minutes to try and integrate this function analytically. You will find that it does not have an explicit anti-derivative solution. Therefore, we must numerically integrate to find a solution.
%[text] To start this activity, select a value for $n${"altText":"n"} using the slider below.
n =1; %[control:slider:1339]{"position":[4,5]}
nExample(n)
%[text] %[text:anchor:H_26076A89] #### Question set 2
%[text] 1. How does changing the number of intervals affect the numerical approximation of the integral?
%[text] 2. Can you think of any downsides of using a large $n${"altText":"n"}? \
%%
%[text] %[text:anchor:H_5FA9EB2C] ### Developing an algorithm for the multiple trapezoid rule with equally spaced data
%[text] Looking at our definition of the multiple trapezoids rule:
%[text]{"align":"center"} $I = \\frac{b-a}{2n}\\left\[f(a) + 2\\sum\\limits\_{i=1}^{n-1}{f(x\_i)} + f(b)\\right\] \\end{array}${"altText":"I = ((b-a)\/(2\*n))\*\[f(a) + 2\*(sum from i=1 to n-1 of f(x\_i)) + f(b)\]"}
%[text] we can see that it has four major components:
%[text] 1. The function to be integrated: $f(x)${"altText":"f(x)"}
%[text] 2. The limits of the range over which the function $f(x)${"altText":"f(x)"} is to be integrated: $a${"altText":"a"} and $b${"altText":"b"}
%[text] 3. The number of sub-intervals $n${"altText":"n"}
%[text] 4. A summation of $f(x\_i)${"altText":"f(x\_i)"} for each point $x\_i${"altText":"x\_i"} on the range $a \\leq x \\leq b${"altText":"a \<= x \<= b"}. \
%[text] Therefore, if we were to write an algorithm to perform trapezoidal rule numerical integration, we would want to perform the following steps:
%[text] 1. Specify the function $f(x)${"altText":"f(x)"} to be integrated, the limits of integration $a${"altText":"a"} and $b${"altText":"b"}, and the number of intervals $n${"altText":"n"}
%[text] 2. Use $a${"altText":"a"} and $b${"altText":"b"} to define the interval width, $\\Delta x = \\frac{b-a}{n}${"altText":"delta x = (b-a)\/(n)"}
%[text] 3. Define the $x\_i${"altText":"x\_i"} points: $x\_i = a + i\\Delta x${"altText":"x\_i = a + i\*delta x"}, $i = 1,2,\\dots,n-1${"altText":"i = 1,2,...,n-1"}
%[text] 4. Evaluate $f(x\_i)${"altText":"f(x\_i)"} at each $x\_i${"altText":"x\_i"} point, and then sum all the values
%[text] 5. Use the trapezoid rule formula to approximate the integral \
%%
%[text] %[text:anchor:H_CCD811F0] #### Activity 3: Performing an Integral with the multiple trapezoids rule
%[text] Now that we have a set of steps outlining our algorithm, we can write a script to perform the trapezoid rule integration to solve the following integral:
%[text]{"align":"center"} $\\int\_5^{10}{2x^{0.5}dx}${"altText":"integral from 5 to 10 of (2x^(0.5)\*dx)"}
%[text] using five intervals ($n=5${"altText":"n=5"}). We can write our code following each of the five steps:
%[text] **Step 1:** Specify the function $f(x)${"altText":"f(x)"} to be integrated as an [anonymous function](https://www.mathworks.com/help/matlab/matlab_prog/anonymous-functions.html), the limits of integration $a${"altText":"a"} and $b${"altText":"b"}, and the number of intervals $n${"altText":"n"}
% function to be integrated, f(x)

% limits of integration

% define the number of intervals

%[text] **Step 2:** Use $a${"altText":"a"} and $b${"altText":"b"} to define the interval width: $\\Delta x = \\frac{b-a}{n}${"altText":"delta x = (b-a)\/(n)"}

%[text] **Step 3:** Define the $x\_i${"altText":"x\_i"} points: $x\_i = a + i\\Delta x${"altText":"x\_i = a + i\*delta x"}, $i = 1,2,\\dots,n-1${"altText":"i = 1,2,...,n-1"}

%[text] **Step 4:** Evaluate $f(x\_i)${"altText":"f(x\_i)"} at each $x\_i${"altText":"x\_i"}

%[text] **Step 5:** Use the trapezoid rule formula to approximate the integral

%[text] To check the accuracy of our trapezoid rule approximation, we can compare our answer against the analytical solution:
%[text]{"align":"center"} $\\begin{array}{rcl} F & = & \\int\_5^{10}{2x^{0.5}dx} \\\\ & = & \\left. \\frac{4}{3}x^{1.5}\\right|\_5^{10} \\\\ & = & \\frac{4}{3}\\left(10^{1.5} - 5^{1.5}\\right) \\\\ & = & 27.27 \\end{array}${"altText":"Calculation of F: integral from 5 to 10 of 2\*x^0.5 dx = (4\/3)\*x^1.5 evaluated from 5 to 10 = (4\/3)\*(10^1.5 - 5^1.5) = 27.27"}
%[text] We can see that our approximation is very similar to our analytical solution. Even with relatively few trapezoids, we get a decent approximation of our function ($0.04\\%${"altText":"0.04%"} error).
%[text] **Step 6:** Use the helper function `PlotTrapezoidRule` to visualize the result. The function has the syntax:
%[text] ```matlabCodeExample
%[text] PlotTrapezoidRule(a, b, dx, fx, n)
%[text] ```
%[text] where `a` and `b` are the limits of integration, `dx` is the interval width, `fx` is the function handle, and `n` is the number of intervals.

%%
%[text] %[text:anchor:H_17B52E50] ### Integrating from tabulated data
%[text] So far, we have always had a mathematical expression for $f(x)${"altText":"f(x)"} when performing our integrals. However, it is often the case that the expression $f(x)${"altText":"f(x)"} is unknown, and all that is given is a set of tabulated values for $x\_i${"altText":"x\_i"} and $f(x\_i)${"altText":"f(x\_i)"}, as shown below:
%[text]{"align":"center"} $\\hline  \\begin{array}{|r|r|r|r|r|} \\hline \\mathbf{x\_i} & x\_0 & x\_1 & \\dots & x\_{n-1}\\  \\\\ \\hline \\ \\mathbf{f(x\_i)} & f(x\_0) & f(x\_1) & \\dots & f(x\_{n-1}) \\ \\\\ \\hline \\end{array}${"altText":"A table of data showing x\_i corresponding to f(x\_i) from i=0 to i=n-1"}
%[text] In this case, there is no guarantee that the $x\_i${"altText":"x\_i"} values will be evenly spaced. In other words, The difference between successive $x\_i${"altText":"x\_i"}:
%[text]{"align":"center"} $\\Delta x\_i = x\_{i+1} - x\_i${"altText":"delta x\_i = x\_(i+1) - x\_i"}
%[text] may be different for each value of $i${"altText":"i"}. This means that our definition of $\\Delta x = \\frac{b-a}{n}${"altText":"delta x = (b-a)\/(n)"} is no longer valid. Revisiting our equations from the first section of this script shows us that we can return to our earlier approximation:
%[text]{"align":"center"} $\\begin{array}{rcl} I & \\approx & I\_0 + I\_1 + \\dots + I\_{n-1} \\\\  & = &\\left(x\_{1}-x\_0\\right)\\frac{f(x\_0)+f(x\_{1})}{2} + \\left(x\_{2}-x\_1\\right)\\frac{f(x\_1)+f(x\_{2})}{2} + \\dots + \\left(x\_{n}-x\_{n-1}\\right)\\frac{f(x\_{n-1})+f(x\_{n})}{2} \\end{array}${"altText":"I approximately equals I\_0 + I\_1 + ... + I\_(n-1); = (x\_1-x\_0)\*(f(x\_0)+f(x\_1))\/2 + (x\_2-x\_1)\*(f(x\_1)+f(x\_2))\/2 + ... + (x\_n-x\_(n-1))\*(f(x\_(n-1))+f(x\_n))\/2"}
%[text] We can see that each term $I\_i${"altText":"I\_i"} can be written as:
%[text]{"align":"center"} $I\_i = \\frac{\\Delta x\_i}{2}\\left(f(x\_i) + f(x\_{i+1})\\right); \\quad i = 0,1,2,\\dots,n-1${"altText":"I\_i = (delta x\_i)\/(2)\*(f(x\_i) + f(x\_(i+1))); i = 0,1,2,...,n-1"}
%[text] Therefore, for unevenly spaced points, our multiple trapezoids rule can be written as:
%[text]{"align":"center"} $I\\approx \\frac{1}{2}\\sum\\limits\_{i=0}^{n-1}{\\left\[\\Delta x\_i\\left(y\_i + y\_{i+1}\\right)\\right\]${"altText":"I approximately equals (1\/2)\*(sum from i=0 to n-1 of \[delta x\_i\*(y\_i+y\_(i+1))\])"}
%[text] Here we define $y\_i = f(x\_i)${"altText":"y\_i = f(x\_i)"} and $y\_{i+1} = f(x\_{i+1})${"altText":"y\_(i+1) = f(x\_(i+1))"} for ease of notation. Note that this equation requires that $x\_{i+1}\\geq x\_i${"altText":"x\_(i+1) \>= x\_i"} for all values of $i${"altText":"i"}.
%[text] Again, looking at the equation for $I${"altText":"I"}, we can see that there are four components to this equation:
%[text] 1. Calculating the step size by subtracting successive values of $x\_i${"altText":"x\_i"}: $\\Delta x\_i = x\_{i+1} - x\_i${"altText":"delta x\_i = x\_(i+1) - x\_i"}
%[text] 2. Adding $y\_i${"altText":"y\_i"} to the next value $y\_{i+1}${"altText":"y\_(i+1)"}
%[text] 3. Summing the product of step 1 and step 2 for all values of $i${"altText":"i"}
%[text] 4. Dividing the result by two. \
%[text] Therefore, we can write pseudocode to describe this calculation process:
%[text] ```
%[text] For every value of i, complete the following:
%[text]   Subtract current x(i) value from the next x(i+1) value
%[text]   Add the current y(i) value to the next y(i+1) value
%[text]   Calculate the product of these two values
%[text]   Add the product to the result of the previous result
%[text] End
%[text] ```
%%
%[text] %[text:anchor:H_93F1DBE0] #### Activity 4: Writing an algorithm for the multiple trapezoids rule with tabulated data
%[text] In this activity, we will work to complete an algorithm to approximate the area of the tabulated data provided below:
T = TabulatedData
% Plot the data
plot(T.x,T.y,"o",SeriesIndex="none")
xlabel("x")
ylabel("y")
grid on
hold on
set(gca,"XAxisLocation","origin","XTick",0:0.25:3)
%[text] We can see that the data table contains 26 pairs of $(x,y)${"altText":"(x,y)"} data corresponding to $(x\_i, f(x\_i))${"altText":"(x\_i, f(x\_i))"} for some unknown function $f(x)${"altText":"f(x)"}. We can start the integration process by identifying our $x${"altText":"x"} and $y${"altText":"y"} data:
x = T.x;
y = T.y;
%[text] Now that the data has been selected, we are ready to start the integration process. Looking at the data table, we see that there are 26 data points that need to be accounted for, therefore, $n=26${"altText":"n=26"}, and our $i${"altText":"i"} counter should go from $1${"altText":"1"} to $n-1 = 25${"altText":"n-1 = 25"}. Use the template below to complete the algorithm for the multiple trapezoids rule using our pseudocode provided above:
% Perform the Integration
I = 0;              % Initialize a variable for our integral
n = numel(x);       % Number of points in the dataset
for i = 1:(n-1)
    % Fill in the loop to complete the calculation for the integral, I


    area(x(i:i+1),y(i:i+1),FaceAlpha=0.15,SeriesIndex=1)
end
hold off
fprintf("I = %2.3f",I)
%%
%[text] %[text:anchor:H_ED8A7131] #### Activity 5: Challenge! Vectorizing the trapezoid rule
%[text] In many cases, working with vectors and vector operations yields more compact and efficient code than for loops. Therefore, a more efficient way to perform our trapezoid rule calculations would be to avoid using loops altogether. In our code for Activity 3, we saw that the loop performed three functions:
%[text] 1. Calculating the step size by subtracting successive values of $x\_i${"altText":"x\_i"}: $\\Delta x\_i = x\_{i+1} - x\_i${"altText":"delta x\_i = x\_(i+1) - x\_i"}
%[text] 2. Adding $y\_i${"altText":"y\_i"} to the next value $y\_{i+1}${"altText":"y\_(i+1)"}
%[text] 3. Summing the product of step 1 and step 2 for all values of $i${"altText":"i"} \
%[text] It is possible to perform all three of these functions using other MATLAB commands.
%[text] ```matlabCodeExample
%[text] dx = diff(x)
%[text] ```
%[text] The [`diff`](https://www.mathworks.com/help/matlab/ref/double.diff.html) function calculates the forward finite difference of the vector $n${"altText":"n"}-element vector $x${"altText":"x"}, so that $dx(i) = x(i+1) - x(i)${"altText":"dx(i) = x(i+1) - x(i)"} for $i = 1,2,\\dots,n-1${"altText":"i = 1,2,...,n-1"}. For example:
dx = diff(x)
%[text] You can use [array indexing](https://www.mathworks.com/help/matlab/math/array-indexing.html) to select a subset of elements from an array. For example:
ysub = y(1:end-1)
%[text] Finally, recall that the [`sum`](https://www.mathworks.com/help/matlab/ref/double.sum.html) function can add up all the elements in a vector.
%[text] ```matlabCodeExample
%[text] total = sum(x)
%[text] ```
%[text] As a challenge problem, in the space provided below, use these three functions to write a set of commands that performs the trapezoid rule on a set of $(x,y)${"altText":"(x,y)"} data in no more than two lines of code.
% Enter your code in the space below


%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] %[text:anchor:H_2A1F1DC2] ## Function Definitions
function PolyExample(a,b,n)
% Define function to be integrated
x = 0:0.01:12;
fy = @(x) sin(pi/12*x) + cos(pi/4*x) + 0.5;

% Plot
figure
plot(x,fy(x),LineWidth=1,SeriesIndex="none")
xlabel("$x$",Interpreter="latex")
ylabel("$f(x)$",Interpreter="latex")
title("Integrating with Polynomials")

% Fit polynomial
xn = a:0.1:b;
if n == 1
    xn = [a b];
    yfit = fy([a b]);
else
    p = polyfit(xn,fy(xn),n);
    yfit = polyval(p,xn);
end

% integrate
F = trapz(xn,yfit);

% Plot area
hold on
plot(xn,yfit,"--",LineWidth=1,SeriesIndex=1)
area(xn,yfit,FaceAlpha=0.15,SeriesIndex=1,EdgeColor="none")
hold off
text(xn(1),-0.05,"a")
text(xn(end),-0.05,"b")
title("Activity 1")

legend("$f(x)$","$f_n(x)$","$I$",Location="Northwest",Interpreter="latex")

text(2,1.5,"$I \approx$ " + num2str(F,5),Interpreter="latex")
end

function nExample(n)
%Code for Activity 2
% Define x vector:
x = linspace(0,8,n+1);

% Define y-vector using f(x) defined in Activity 2
fx = @ (x) x.*exp(-x.^0.8)+0.2;
y = fx(x);

% Perform trapezoidal integration
q = trapz(x,y);

% Plot Area Under the Curve
plot(linspace(0,8,200),fx(linspace(0,8,200)),LineWidth=1,SeriesIndex="none")
hold on
xlabel("$x$",Interpreter="latex")
ylabel("$f(x)$",Interpreter="latex")
set(gca,"FontSize",11)
title("Activity 2")
for i = 1:numel(x)-1
    area(x(i:i+1),y(i:i+1),SeriesIndex=1,FaceAlpha=0.15)
end
hold off
s1 = sprintf("$I$, n = %d",n);
legend("$f(x)$",s1,FontSize=11,Interpreter="latex")


% Display Integral
text(5,0.4,"$I\approx$ " + num2str(q,4),Interpreter="Latex",FontSize=11)
end

function T = TabulatedData
% Some unknown function data
Col1 = [0:0.25:1, 1.1:0.05:1.2, 1.2:.1:2.6 2.6 2.8 3]';
Col2 = [2.0000 2.4392 2.0000 0.7071 -1.0000 -1.6473 -1.9403 -2.2058 -2.2058 -2.6361 -2.9074 -3.0000 -2.9074,...
    -2.6361 -2.2058 -1.6473 -1.0000 -0.3090 0.3787 1.0181 1.5691 2.0000 2.2893 2.2893 2.4149 2.0000]';

T = table(Col1,Col2,VariableNames=["x";"y"]);
end

function PlotTrapezoidRule(a,b,dx,fx,n)
% define a full range of x values between a and b
x = linspace(a,b,100);
xi = a:dx:b;
y = fx(x);

% Plot
figure
plot(x,y,LineWidth=1,SeriesIndex="none")
hold on
xlabel("x")
ylabel("f(x)")
set(gca,"FontSize",11)
for ii = 1:numel(xi)-1
    area(xi(ii:ii+1),fx(xi(ii:ii+1)),SeriesIndex=1,FaceAlpha=0.08*(1+(-1)^ii)+0.15)
end
hold off
s = sprintf("$F(x)$, n = %d",n);
legend("$f(x)$",s,FontSize=11,Interpreter="latex",Location="Northwest")
end

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":40}
%---
%[text:image:9ad5]
%   data: {"align":"baseline","height":217,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAboAAAFPCAYAAAA7qAsvAAAfPUlEQVR42u3db4hc93nocb2xJdmSV7JDHdyG3daqfBPZ0TrGDkWku2pe2GkdSyKgpq6JNnFLUAlZQW4RRUFSW0fKO8nGxr3gXu0LNXkjI6X3zY0Ntki4OA4FL4SaFgoSxdwbSInl\/kmb9F7O3ed4fuOjo5nZmdXM7DlnPj\/4sn9ndvbMmfOd3\/N7nue3IcuyDQAANBUHAQDQeNGdrDieKADATYmu6sMTBQAYvujeeeed7Jlnnslefvnl7L333uv4O\/H9N998s+vPiQ4AUEnRPffcc9lDDz2UHT16NNu5c2f21FNPdTRQfD9+vrS0RHQAgHqILmZw8\/Pz+YwuRogsSF8XZ3PpZ3GbQcY3vvENogMArI\/oQnJphvb222+3ZRafF8err77aVYK9xksvvZTf5jvf+Q7RAQDGK7pYbwsJpTW3WKOLr0N+5dHrZ91G3O\/DDz+c3y4+Eh0AYKyii5lZzNSKs7uQUkitPJ544on8Z7GO1+9Ia36JPm\/riQIADD\/rslfYci3rcyHRXbt2XSe62dnZfsKenigAwPBF1ys0uZb1uf3797dvs+PX7s2Jzz\/\/+c8THQBg\/KJLpQOdwpZRfjDI+txrr72WffSjH+0ouvvvvz\/\/OdEBAMYquiSl4ppdWYL9rs8dP34827t3b5tPzM7mpK9XKTfwRAEARie6yMQcVv1cGs+eOZMj6xIAsO6hy3LXk8OHD6+pfo7oAACVEl1KOIl1uJi5xddJfoPWzxEdAKByokuyi3W4qJmLj1FmkGrrBqmfIzoAQKVEF+twncKSxdq6tYYtiQ4AsK6ii+ST2LmgU6F4Wp+7mdkc0QEA1lV0xTZdRdHFOl18LyR4M7M5ogMArKvoUkeUYulArNWF4ILyLI\/oAACrsG2FI5URXczWIuEkMixDein5JBJShrWTONEBwERxKS7mP\/rRj145duzYdGWSUWJGF62+gmHM4ogOACaSk3Ehf\/fdd7Pp6ensvvvu+9mzzz7725UpLxjVIDoAmAj2pwv53NzcinE25LL76U9\/GuHBhXGKbn6MdBNdr9s4WQCgfsyucC0u8IuLi7nkpqamsrfeeitd9y+NU3TjpJvonBQA0Kzkk+W4uJ87dy6XXBCft8Zy63eIDgBQ3+STmL3FLC4kF7O61rjWmu1tIDoAQB05W0w+CcnF+lxh7F+PrEuiAwAMg4VOySchvdY4uV51dEQHABha8smhQ4fWNfmE6AAAw2YmSa6YfHLx4sV1ST4hOgDASDIsX3\/99bbkTpw4sW7JJ0QHABhphmWELkt10huIzokCAHVkqZxhuXv37mLyyUIVHifRAQDWwpEkuZBbhwzLpao8VqIDAKy5jKBLhuXlKj1eogMADMJ8WXJBQXLrmmFJdACAodTKnVm5hnfoYXmtapIjOgDAwJIr1sqd+eBavu5lBEQHABiq5KpWRkB0AIC1FoRfS7VyXSS3UOX\/gegAAL0kt7xKQfhC1f8PogMA9C25qJkrjLN1+F+IDgDQaU2uo+SqWBBOdACANSWeNEFyRAcAaLTkiA4AkJhPkot95JoiOaIDAGzICr0ri3Vyc3NztZcc0QEATnaSXKmEYKnO\/yPRAcDklg8spYtwsUFzkyRHdAAwmcyk8oEITUaIskPvyhhHmvD\/Eh0ATBb7i5mVadPUSD4p7EKQZTXoeEJ0AIByqPJsuugWMytLm6ZeyyrcoJnoAADd6uOupgvu4uJiO1RZKh+4mlV0qx2iAwB0m8W1syqLocoghFcYl7MKbppKdACAXmtx7VnciRMn2oKLUGWELgvjbJOPBdEBQPPClJe7zeJKReDXWkLcQHQjEN2X\/+APi6KbdXICwE2XDLTr4kJmxbW4mMWVSgcut26zgeiGS\/4u4wdvvJH93sHfLR7weScpAKx5BrdUvKCG0FJGZbBv377iLK4x9XFEBwDNTjJZKIYoY0Qd3PT0dFtw8fnrr78+kbM4ogOA+iaYLKWC7xSijESTsuBKxd\/XmlQATnQA0KywZIQZLxXllpJMoidlMUTZQXApo3LbJB9HogMwicyvkVEJY6Z1\/0daYrqcdRght0gwKc7eUtF3B8EtTWKYkugATNJMaKFVLH2pde25lo1mXG3d\/6Asr3bHV65cyQUWM7ey3GImF98vtO4iOKID0ODEjK\/HhCeWrPoxUyRorIVS5uLQRggt7j+kFuttUetWDEkW5Xb69Ons+9\/\/fvku\/nWFCyt8\/iZmq1VgG9EBwPt8fIVvrfB\/uoX4ovNHSCNS67uJYxjETCvufy30c\/\/xe\/F\/lLInmzrmiQ7ApM\/cvrnCj7utXcVaVT9CW4ucit1FRkH8jZBySC0k3SEkSXREB6DBs7dXVvh\/xYtGyODRRx\/N7rhj+4rcPnRDiC\/EEfKL4umYDY1KHGsNgw4QCr3cSlDZ35I90REdgAYJbrk8c\/vsZz+bbdkyld16y8Zcar\/yyzuyT88dzL72lefzr7\/97W+PKoFkecQX+fR3TrYSabpdF8cyItEl3iwMaw2yw8auRAdgYpkpS+WFF17IPvKRj7RnbiG3gwe+mp06fiH7b2f\/V5v4WWkt60IrZX8+G11P3XEnXww8YvYbYdGQTXwM8awmufjd1X5vkBFvUuL5WUV2RAeg8Wtwr6SLQoT1Tp06ld199z3t2dtvPPKZ7Ot\/vHSd3FYRXROvLWsSTMgrbdUTsus2ItTb4TgOZaT77hFGJjoAjeXPVvjP4gwuBLdx4+Zs86Yt2eOPfSk7c\/q7XQVHdN1Hqr+L2Vn6vJvoUogxhDiqkRJ7iA7AJBV2Xy0mdmzfvj2fwQ0iOKLrniiTknNiRHJOSK7bjCqFLEdVL1h8TF1CmEQHoFH8RXEmsWfPnmzrlu35RXBQwRFd55FClf0klcRzkEKcox4xswyIDkCTk03+Ib34Yx0uSgTiIrtzx4M3JJgQ3dpFF7O3OCb9hCKTFMdRv5c2hI0kGaID0DR+f4VfpBlErNXccsuteZjy8NOn1yw4ouu9PtdBKDeMVGw\/jpHClx1mj0QHoNb8VXrBnz9\/vj2L2\/3Ap9YUpiS67pmN5RZjIbH0vV5hy37r5uJvxH2GSGN2Fmt6QdpZIX4Wv9NrpMdFdACaUjbwd+nF\/uSTT+ZrcTGLO\/TksaEIjug+GKnHZ8yWkuji60SvGVY\/Ic643wiJxt+J26UuNKnAPEKfaSbZKwyaWqoRHYAmZFX+c7zI4x3\/zMxMXjIQBd83sxZHdP3NuvqdpaX1udVEl3ZWKJcLpMzOeI4jmzIJtlfINN1uHM8X0QEY+XpcvLNPocoo+h624Iiu88wrjkeEE\/sVXa8i8ZBYp24pSVhJkvHz1Ge0n4QUogNQV\/4ovbij+HvL7e\/vKDDsUCXRZauGBvvoL9lNOteNeLPSacaXZm+DZmt2kSvRAagFZ9ML++jRo9ltm7fm63G9WncR3fBFN4iAuoQR+86eXEu2JtEBqCt\/nV7UsctAdDiJ9bhxSI7orp99JdHdhHT6vl2v3plER3RA4yQXazlFyQ2rdIDo+hddSgjp0VOyo3T6CXP2Wp8rruetNpNMxexEB6B2kns\/s\/K2POlknJIjuhvX3Ppt55UyNFfLuowsymIySpo1lmeC8XdX+9tJkiUhEh2Aaksu9owbdWYl0fU\/01qtaLu81tZLTuk+U5iyWEZQbAKdwqarhUFTrV1pEB0AkiO6\/hNRBllzWy3UWSw+T1v+lAvD4+\/Ffaw2m4vzpUuNH9EBIDmi6z8RZZDtdtKaWbfbRDg07VAeH1Prr5BdfJ3KGfoJl0YItMuMk+gAkBzRDTcRpXy7XgkpIdHyOl36ftyu31q6VMxevh+iA1AVLlRRcpMsuhBGkkZKROl3fa44Ut\/KUY7UYaVLSQLRAVh3\/iS9aO+9995KSW5SRZfCgCnsmEKIHWZLa61tG+pY5W8QHYBqtPWKOrlozlwlyU2q6FIYMNbK0nY7\/fS37DbSlj6jnM31eHxEB2DdWChKLorBYx+5KkluUkWXSgMiFJgkNUgSSqd1uJDRWkKf\/SS8xGPs8fiIDsC6EFvt\/DxeqNG7cj06nhBd7zW61HB5WCHHFA4dtFPKagkoq0iO6ACsm+T+I16ksQtBNGiuquRkXQ53xHHst7NKPyHLmM31MdMkOgBjJXYG\/8f0Dj\/tQjCKDVOJrnqiW6dBdADGyt+nsNiWLVNj22qH6IiO6ACMtSB827a7coEcfvp0pSVHdERHdAAGqpUrFoSPemdwoiM6ogMwLva3X5Tz85UrCCe69nW0qcwSHYCxZFh+8YtfrGytHNGB6ACsNcPyn+pSRkB0IDoAg\/I3KcNyauquypcREB2IDsAgvFjOsPzaV56vneSIDkQHoBML6UU4MzNTqwxLogPRAegn+STvYVnV3QiIDkQHYCjJJ1NTH8qTT+osOaID0QHomHyy5fb323vVLcOS6EB0ALrxzXLySdV7WBIdiA7AwJ1Pdu3alYvh4IGvNkJyRAeiAzBzXeeTWzfVPvmE6EB0AIrJJ\/8QL7bz58\/XtvMJ0YHoAHTjQjv5pCZ7yxEdiA7AQEXhxW136rC3HNGB6AD0WxT+H8Wi8E\/PHWyk5IgORAdMeFH4bbdtzXbueLCxkiM6EB0webzexKJwogPRAQj+JK3Lbd++vdY7EhAdiA5Ap3W5fOzZsye\/+D\/+2JcaLzmiA9EBk7Mu97N4UZ06dSq79ZaN2e4HPjURkiM6EB0wGeTNmuNiv3Xrndldd3648etyRAeiAyaHxjZrJjoQHYD59GJqYrNmogPRAZPNzAr\/Hi+kxcXFRjZrJjoQHTDZ5M2aL1682NhmzUQHogMmlxfjBXTlypXsjju2Z5s33T5x63JEB6IDmstCegGlZs2Hnjw2sZIjOhAd0Lyi8OuaNU\/quhzRgeiAZhaFX4kXTjRr3rple74uN+mSIzoQHdAc8it5NGu+886782bNp45fIDqiA9EBjaDdrPmee+6ZmGbNRAeiAyasKHx+fn6imjUTHYgOmIx1ubwo\/OjRoxPXrJnoQHTAhBSFx0U8isInrVkz0YHogGZzIRWFb9kyNfFF4UQHogOaxR+l5BNF4UQHogMam3wSReFxEf\/03EFCIzoQHdAIZlLnk7RT+M4dD5IZ0YHogGZ1Pkk7Ekg+IToQHdDIzieST4gORAc0jRfLnU8OP32axIgORAc0J8Myxq5du3Q+IToQHdDcDMtbb91k2x2iQ01FdynOvLf\/9m+JDviA2WKG5Zbbp2y7Q3SosehOprPv8cc+UzwZ93syMMEZlv8UL4LYW06GJdGhQaK7d3qmeDKe9GRgQiX3jynDMu0tJ8OS6EB0QFP4+2IZQVykSY7oQHRAU\/jrD8oI9LAkOhAd0FDJadRMdCA6oGl8qyw5ZQREB6IDGtX1JL\/6zs+THNGB6IBmdj1REE50IDqg2ZK7ZWO2+4FPERPRgeiARvDNsuSi64mCcKID0QGNya4kOaID0REdSA5EB6IDasK2Yp1cZFeG5HbueJDkiA5E58lAc3pXpjq5TRtvk11JdCA6okMjiK12fqwYnOhAdESHJvL4Cj+PEzkaNG\/bdld+wf303EHyIToQHdGh9vxZOonPnz\/f3oVA70qiA9ERHZqwHvdmOoGPHj2ab5oa+8l97SvPkw7RgeiIDrUPVf5zWo\/bs2dPu3zAfnJEB6IjOtSdpXTSxnrc3Xffk19co6WX8gGiA9ERHeo+i\/tJMVS5deud+YX14IGvkgzRgeiIDrVei\/sf6US9cuVKtmvXrnz3gbvu\/LBQJdGB6IgOteb5Ff6zOIubmvqgdECokuhAdESHuvJfV\/iXdHLGhXP79u3tWZysSqID0REd6kpsqfNvxTBlZFRu3bI9v4A+\/tiXzOKIDkRHdKgdH1\/hlRX+b1Fwjz76aLZ585b8whkNmU8dv0AkRAeiIzrUSm7fWuFa8SSMcoGy4IQpiQ5ER3SoC0dWuFxce0sF3y+88ELehDmFKAmO6EB0RIeUdh8XkT9oSeRIq5i6G99s\/c7jrdslZob4mGZaj+frLanFljk\/yzqMixcvZnv37s17U0aSSdppgOCIDkRHdJMns5DT\/1xhOSZAK\/x7Np7xbot3Vrha4seFn\/f1eCIseerUqeyRRx7J7th6Z96yKy6K0bYrCr4lmRAdiI7oJoN4UhZaUvt5PwKJxI24sPRLhApHOdLjOXPmTPa5z30uu++++7KNGzdnU1Mfyi+CKTQZcpNgQnQgOqKbDGLD0LOtmdINIy4a586dy7785S\/nqfb33nvvijg25vLYvv2XrmPL7VNtmSRCMOXfS6Tfifubnp7OCTHt3r27Tcjq0KFD1xEJI+nn8XjidnE\/27bd+Dg2b7o9F1uUBghLEh2Ijugma+Z2g9xithVrV4uLi9k999yTh\/iKM6EgCqZDHEkeRWKWFDIpUv6dRHQWSfdTJMRUlmUvYlucdNtorFx8HMKRREd0ILrJY38rSeO6UF+E+ebm5m6QSBLH4adP6+kIogPREV2lWSjO3mLmFuHICP3dILdWuDA+d+EE0YHoiK5WgovZW4Qlp6auX0vbt29fLr74eVqXIzoQHYiO6KrMfFlwkcRRlFskcETIslMWJNGB6EB0RFflJJNLvQQXa3GlC0HWkuLJVgYm0YHoQHREV9kWV9fSGtyJEyeuE1wIL4UmW+Naq2PJbOl+iA5EB6IjusrVwS0XW1sV1+BiBhddQUqztyOtried7o\/oQHQgOqKr3iwuZmvFEoFYgyu94K+2klNWu0+iA9GB6IiuEj0o22txkTFZnMVF2LIUohzk+BIdiA5ER3TrHqq8mtbiojSgWANXClMu9QhREh2IDkRHdJWsi8tDlSG01OOxwyxu+SZe4EQHogPREd26cLYYqiyuxZVmcTd7LIkORAeiI7r1W48r1sVF2LJQ8H11SC9qogPRgeiIbqySW07rccXelKVQ5aU1rMURHYgOREd01aiPi9BkklxkV0atXGEcGfLfJToQHYiO6MYiuXbSSSodKK3HXRvRi5joQHQgOqIbj+TiBZskFzO6wnrccquv5QaiA4gORFdLyRUzK0uSuzzE9TiiA9GB6IhufSUXWZalAvBRPw6iA9GB6IiusZIjOhAdiI7o1kVy4zw+RAeiA9ER3VgltzDmx0R0IDoQHdE1VnJEB6ID0RHd0Dqe5JKL4u8KSY7oQHQgOqIbXluvYjF4RSRHdCA6EB3RDV9y0Zx5hC29iA5EB6IjurERJQLZlStXunU8WarAYyQ6EB2IjujWLrniLgQVlBzRgehAdES3JhbSP1rchaCCkiM6EB2IjugGZn\/6J9OmqSG5wi4EyyPuXUl0IDoQHdGNvlZucXGxXUZQeCFWTXJEB6ID0RHd4LVyxYLw+Lw14mczFXzcRAeiA9ER3WBlBElyMasrSG62oo+d6EB0IDqiG7yMoFQrt1Dhx050IDoQHdH15MgqZQRHKv74iQ5EB6Ijuq7Mp38oZnApwzJmdhUsIyA6EB2IjujWlmF54sSJ9rpcqYxgA9EBRAeiq3XySXE3gkKG5dUKlhEQHYgOREd0fXOpx24EVc6wJDoQHYiO6AZPPpmbm6tLhiXRgehAdEQ3ePJJIcPybA3\/J6ID0YHoiC5nZpXkk8s1PSmIDkQHoiO6nOWiFGqcfEJ0Y+TU8QvZ4499qSuHnjzmOBEdiK6anU9qnHxCdGMkRLZzx4PZ5k1b2m+Qgrvu\/HD+\/d945DOOE9GB6Kqxt1y580mNk0+Ibh0vysGv\/PKO7Mzp7zomRIemiW72\/gfqKLp2UXhxb7madT4hugrw9T9eaovu4IGvOiZEhwaJLhI0sh+88Ub2ewd\/t3gy7q9TUXhx253S3nIbiA79EHJL51BIzzEhOjRfdHU4GW8oCo9sy8K63DaiQ7\/sfuBT+TGOtTrHg+hAdJUqCp+enu5UFN6kFxPRjYGUjBLCczyIDkRXhXW564rCQ3aFovCm7aVHdNbniA5EN0Gi29aqicvOnDnTqSj8UgNPCqKzPkd0ILoJEt3ltC6XLkwhvAYUhROd9TmiA9ER3fulEBGiTMknEbosjNmGnhREZ32O6EB0EyC6drPmSDpJReGFdbkjDT4piM76HNGB6Bouum3lZs0xoyusyy01\/KQgOutzRAeia7joejVrXm7ouhzRWZ8jOhDdhIjubIObNROd9TmiA9FNuOj2pwdTbNZcWJdbmJCTguiszxEdiK6Boms3a15cXGxqs2aisz5HdCC6CRVdx2bNFy9ebFqzZqJbp41Wv\/aV57PDT5++bg+6+F5gex6iA9GNg6Vys+aY1RXW5WaIDmslNlMtbrBaJnYVd5yIDkQ3ShZSUXhalys1a94\/gScF0YHoQHQNEV27WXNxE9UGN2smOhAdiG7CRHdDs+bCC+TyBJ8URAeiA9E1ZUb3wx\/+8H93aNbcpE1UiQ5E50JPdJO8Rnfs2LHpT3ziE+9OSLNmogPRgegmuI7u5AQ0ayY6EB2IbsI7o8w6IYgORAeim6T96IjOhRNEB6IjOqIDiA5ER3REBxAdiM6TQXQA0YHoQHQA0YHoQHQgOtcWEB2IDkQHoiM6onPhBNGB6IiO6ACiA9ERHdEBRAei82QQHUB0IDoQHUB0IDoQHYjOtQVEB6ID0YHoiI7oAKID0REd0QFEB6IjOqIDiA5E58kgOoDoQHQgOoDoQHQgOhCdawuIDkQHogPRER3RAUQHoiM6ogOIDkRHdEQHEB0mQ3T5ePbMmezP\/\/RPiyfjNk8G0QFEh0aJLigMTwbRAUQHogPRAUQHogPRgeiIDkQHogPRgeiIjuhcOEF0IDqiIzqA6EB0REd0ANGB6EB0ANGB6EB0ANGB6EB0IDqiA9GB6EB0GB8zK5wcEwtEB6ID0WHczGfjG5eJDkQHogPRER3RER2IDkRHdEQHEB2I7jq2pUcRe9ERHdEBREd0TRNd+x+N3cVf+e53uz4oEB1AdERXe9H94I03iI7oAKIjOqID0QFER3REB6IDiK6Ronv44Yezl156qfaiu9Z6YKgGRIcmiW7Za7oSLK9VdLOzs9muXbuyvXv3Zq+99lptRWdUbBAdGiQ6o+bjoYceynbu3Jlz\/\/33Z1\/4whey9957r7Ki258exeOPfSb773\/5l7nsUD3+4sUXs82bNmW\/9ZsHgFoR522cv17HzWH3xz+e\/fqOHTlJeDHLO378eCVFd7Y4o0N1+exv\/072X3bszO4Dakactwee2Od13CDu2\/Hr2Y5f\/dWcJLrgwQcfzN5+++3KiW7ZJNwwDMNYa+gyeOCBB7Jnn322kqHLbZ6u+ozvfe972U9+8hMHwqjl+MUvfuEgNFB0fa7Prbvo5lEPDhw4sPTJT35y2bEAMCSOrFV0H\/vYx\/KMyy5hysqFLlETVt49Laxw1rFARYiNNEe1SafjW\/E6uldffXXQmxAdgNpxeYSRMcdXZxQ0kLFtXw+MWnRvvfVWXjd35syZ7MSJE9nFixeJjuiIDuM7uYBRi25ubi4vEk8cOnSI6IiO6EB0aF7oMonu3LlzREd0RAeiQ7NEd+XKlbbo4nOiIzqiA9GhUaKLWVxIbnp6WjIK0REdiA7NE12sy61xfY7oiA6TKrrIYltcXMz27ds3yJoH0WFdRBczuTWuzxFdxUUXXVBefvnljsXiUV8XvPPOO0SH\/kX37rvv5nKLi0Zks0XKdlxE4p1yfH9qaoroUCnRFdfnorQgztU4d+Njn9v1OL4VFF0I7qmnnspbf8XHaAMWhNRCevH5\/Px89sQTT+Sfl4rKiQ7dJbd79+78ghH1SMXvpwtJ\/JzoUCXRpfW5IN6IJcGlsoM+6uoc34qJLiQXAgtSX8uQW0gviW1paSn\/fnwd3z98+DDRYXXRRagyzeTKI100VlkDITqMXXRpfa4stTTTWyUKQXQVFF1IrCi5NNLuBTHDi\/Hmm2+2v\/fMM88QHXqLrhj+6RTu6XMNhOgwdtGlczPC7DcYrHVOR\/cUoquP6CIkGetyxREhyyS1YpgyBPfcc8+VpUh06P6uuNO73wFqlIgOYxVd8dyMEHs30a2yVuf4Vkh0IbRSGLKdeJJEV+VtelBh0YXguoUmB6hRIjqMVXS9zs2YxZnRNae8IGZuaY1OeQHWJLpe7ZMGqFEiOoxVdGldudO5GaHMdF5bo6u\/6FLSSWktjugwuOj6WZ\/rUVtHdBir6FKSVKfzsVgmQ3T1Fl2EKjutzxEd1iS6cognstjK63MR5uwSCiI6rIvoym\/QVkuuIrp6ia7X+lzKvCQ69J2MUnxnHDJLa3cp\/BPi67FWR3QYq+jSeVuW2YAtwRzfCokupJYKwdM4evRoLrOonyuPKDXokLxCdOicvRZSC6JYvCi+Yn1d\/LxHAS7RYayiC8HFuRnnaDlBJc7XTpmYRFdt0YXk0uytXFZQTkRJM70O7cGIDp1HXBRCcnGBiAtHClXG9+PiEfJTXoAqia44e4s1ubSeXBQf0dVLdCnpJGrjIiwZX8eMLrUDi++F\/NIsr1xvR3ToKbohDKLD2EWXQurxJi0+9jmLI7qKii5mZ2lWF6HKEF5KSIkQZXwvfha\/0yMxhehAdGiW6G5yOL41KC+42WuRJ4DoiA5VZ2GFkyPC8SU6EB3RASA61O+EGwWzji0AogMATCKzLQGNg7NEBwCYKBwEAADRAQBAdAAAEB0AAEQHAADRAQBAdAAAonMQAABEBwBATfn\/O9orDlsgLAQAAAAASUVORK5CYII=","width":287}
%---
%[control:slider:34e5]
%   data: {"defaultValue":1,"label":"a","max":5,"min":1,"run":"Section","runOn":"ValueChanging","step":0.5}
%---
%[control:slider:64a3]
%   data: {"defaultValue":6,"label":"b","max":10,"min":6,"run":"Section","runOn":"ValueChanging","step":0.5}
%---
%[control:slider:61e8]
%   data: {"defaultValue":1,"label":"n","max":4,"min":1,"run":"Section","runOn":"ValueChanging","step":1}
%---
%[control:slider:1339]
%   data: {"defaultValue":1,"label":"n","max":30,"min":1,"run":"Section","runOn":"ValueChanging","step":1}
%---
