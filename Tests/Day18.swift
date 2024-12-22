import Testing
@testable import AdventOfCode

fileprivate let testInput = #"""
3,10
40,53
23,1
3,14
42,69
43,64
11,2
12,7
45,49
7,3
2,17
1,29
57,52
11,3
7,27
62,51
9,29
10,19
63,69
32,65
21,62
53,46
55,65
3,26
35,61
51,63
10,3
31,55
23,4
28,49
41,67
69,49
62,41
30,67
59,39
18,5
54,55
69,64
9,14
30,43
63,43
67,44
23,56
23,10
11,27
7,18
0,27
19,6
22,61
33,59
59,49
67,51
59,57
59,69
5,27
27,24
44,57
13,47
1,5
42,65
55,61
18,37
67,36
67,43
43,46
42,63
23,12
13,45
52,49
1,34
63,37
19,39
31,0
26,59
29,65
15,29
62,31
9,20
4,31
23,45
36,1
19,59
29,9
69,67
67,52
25,42
23,60
12,11
5,11
20,17
32,69
33,15
27,4
0,1
55,62
15,9
31,45
13,8
29,52
53,53
13,19
23,65
57,39
10,13
65,41
4,23
49,57
57,53
39,63
9,10
21,49
11,22
23,7
8,3
53,52
17,31
5,19
37,68
65,45
61,65
14,27
51,53
27,11
61,43
24,1
37,59
1,31
25,38
29,17
23,5
48,57
27,55
8,31
63,45
53,65
59,68
1,12
2,25
25,3
17,6
13,11
55,53
10,31
1,13
25,63
24,55
11,13
54,57
27,1
30,15
4,5
21,51
23,49
13,33
14,19
21,50
66,43
17,18
7,15
23,53
16,9
7,22
47,64
19,67
31,10
43,69
68,55
29,64
56,49
28,3
23,13
29,24
54,65
22,39
55,57
13,14
38,59
31,2
56,55
67,53
69,66
63,51
68,39
67,60
64,57
49,69
23,9
20,41
27,13
43,67
15,8
12,33
70,39
55,59
23,3
17,33
50,69
6,5
25,41
61,51
64,49
59,64
67,48
31,1
63,47
9,9
51,69
60,51
33,65
11,7
63,39
18,1
51,65
30,57
15,38
10,5
37,69
5,3
53,55
39,67
26,61
68,47
36,63
6,37
9,13
17,70
49,49
5,8
44,67
9,25
1,28
27,50
37,66
7,36
23,57
48,49
19,22
9,7
13,5
24,17
27,43
9,31
31,9
63,52
33,11
15,1
15,15
58,51
11,37
17,67
24,59
13,49
55,54
5,16
63,53
55,69
63,49
47,65
51,57
32,55
33,69
66,57
69,57
17,37
20,39
30,51
22,7
3,13
17,15
49,61
5,7
61,32
13,26
29,16
29,45
69,32
33,68
65,46
65,61
62,57
31,7
28,47
36,69
29,51
26,55
25,10
25,58
34,61
19,48
17,36
1,25
25,67
33,17
51,54
58,59
15,28
20,3
65,55
17,3
21,41
14,1
13,3
69,43
15,17
26,45
67,59
51,49
61,38
15,19
7,34
23,15
67,57
53,49
53,67
25,59
54,63
12,5
13,30
14,37
18,41
60,37
11,33
27,54
65,37
5,31
39,55
13,35
28,7
53,51
56,69
24,49
27,61
53,61
62,65
56,51
58,37
65,47
27,53
29,66
61,63
27,63
31,41
11,40
37,65
21,13
69,51
21,10
63,44
29,67
21,9
13,17
55,67
24,39
55,37
23,11
1,1
63,63
59,47
13,15
69,59
4,41
22,69
35,63
53,64
11,29
2,31
24,13
22,19
69,47
19,69
61,61
9,27
15,7
1,40
27,9
65,64
13,37
67,63
14,17
27,51
16,3
9,21
0,15
55,63
59,62
17,1
27,64
28,13
55,68
21,17
60,49
25,1
8,27
69,42
11,5
39,62
5,14
69,65
31,47
61,41
17,69
62,69
45,57
50,67
27,68
7,28
53,57
63,61
27,65
51,67
30,41
69,55
59,51
25,61
7,13
64,63
15,14
19,65
27,7
15,33
57,59
31,67
50,65
25,46
19,43
7,2
1,24
65,69
16,11
17,29
63,59
64,69
23,63
41,62
27,3
23,54
69,39
11,6
3,22
13,1
69,70
3,27
19,41
1,38
3,6
17,30
5,1
48,55
16,39
58,69
67,67
4,13
19,11
8,33
45,63
25,49
43,65
8,15
31,12
12,23
61,53
3,5
11,11
31,69
51,47
3,35
38,3
61,39
2,1
46,67
41,63
63,66
25,6
22,47
65,36
53,69
21,36
16,1
19,21
13,20
69,68
20,43
17,11
22,5
7,19
5,23
29,49
65,53
10,29
29,2
4,11
11,21
1,15
7,0
13,9
19,3
22,57
47,49
17,13
62,55
28,63
62,63
57,65
17,66
5,17
64,55
17,16
29,69
69,44
65,59
15,12
23,19
67,49
27,47
53,42
18,63
33,1
25,9
31,52
23,43
13,34
29,39
66,61
14,11
69,62
31,65
69,41
47,50
28,43
17,9
39,68
7,48
17,17
21,63
23,61
59,58
23,70
22,41
57,67
63,55
19,7
58,63
17,28
54,51
53,54
12,1
29,38
31,5
20,65
25,43
24,7
8,7
53,70
11,18
26,39
67,45
57,51
5,21
39,60
21,14
25,47
26,13
1,8
59,59
31,48
29,47
47,55
52,61
35,45
56,65
12,17
21,1
9,22
15,31
19,17
57,63
34,69
7,35
20,19
65,49
6,7
43,54
20,1
15,37
52,67
17,64
3,28
19,37
23,44
67,64
19,13
57,38
48,69
67,68
61,45
25,40
19,66
5,20
17,68
33,46
22,51
31,11
68,51
9,19
27,56
69,69
53,63
13,29
51,59
25,55
17,5
65,68
6,31
5,28
61,48
28,45
61,67
15,39
5,18
24,63
11,31
7,17
5,2
5,22
40,57
11,19
22,65
55,60
61,37
45,67
21,61
41,68
54,45
9,23
31,51
18,9
69,63
57,40
22,1
63,36
48,59
67,56
51,50
23,67
32,67
21,68
65,40
20,37
50,53
23,51
59,53
7,24
19,31
26,11
61,62
55,55
13,16
21,69
33,48
21,7
19,60
27,23
55,43
12,21
69,61
51,52
28,67
48,63
10,37
29,54
57,61
30,47
21,5
24,67
67,62
25,57
29,10
25,52
59,65
19,63
69,60
15,32
59,43
66,53
66,47
63,50
59,42
37,12
3,18
15,13
65,65
68,41
15,30
31,53
52,57
7,16
25,48
11,28
22,3
61,49
54,49
13,32
7,20
9,11
57,43
31,44
29,55
41,57
69,53
4,9
1,7
1,27
70,49
55,42
65,43
1,30
35,21
27,39
57,66
51,60
63,67
67,65
27,69
25,2
49,67
47,68
63,48
25,53
57,55
65,58
49,53
32,49
19,23
9,24
60,47
64,61
5,13
23,42
49,65
62,45
63,65
9,33
25,27
49,59
15,34
11,23
60,65
67,66
19,9
29,53
36,5
4,29
9,5
64,43
59,54
26,69
2,15
27,49
20,11
27,41
25,50
21,65
40,69
58,43
5,9
66,41
59,41
47,59
39,65
38,63
64,39
41,69
65,50
5,33
12,29
31,49
53,47
3,31
20,25
30,61
21,3
15,4
63,46
18,3
5,15
39,13
61,40
43,11
3,1
25,5
59,67
45,58
19,5
29,70
19,42
59,66
67,55
59,61
5,4
52,63
7,33
12,39
29,12
17,63
45,68
22,9
3,15
7,11
7,7
45,61
14,41
13,36
25,69
57,46
17,65
50,59
56,59
65,66
59,60
6,13
45,65
2,11
23,46
1,4
25,14
17,24
10,25
13,31
7,29
37,61
44,65
67,50
50,63
23,55
9,3
60,53
23,23
3,23
5,32
2,39
69,58
21,20
39,69
46,65
23,69
41,66
25,51
10,9
10,33
19,16
11,34
21,48
57,69
51,61
9,12
43,60
67,54
24,65
66,39
35,69
61,58
25,45
60,43
25,65
34,3
12,13
47,69
23,47
59,63
19,24
37,67
13,44
61,47
19,38
16,7
36,13
13,27
13,7
2,7
55,49
13,4
56,57
26,1
3,29
25,11
20,7
13,38
14,3
61,57
40,61
65,38
27,6
3,3
55,51
65,67
25,68
6,25
49,66
47,67
48,47
1,33
5,25
19,19
67,39
27,62
63,41
3,2
64,23
9,8
16,35
20,63
27,45
1,3
61,59
52,69
21,15
55,45
1,9
34,11
5,29
10,1
3,9
31,57
21,67
5,34
23,39
1,6
58,55
29,11
65,51
11,26
39,66
61,68
4,25
19,1
37,64
25,37
29,43
46,57
13,24
69,45
53,59
16,19
17,39
45,62
50,43
69,46
26,47
7,30
59,56
46,61
3,7
67,61
15,5
1,23
29,8
15,35
7,1
21,59
25,8
63,57
11,16
22,27
29,13
27,5
63,42
29,50
18,11
19,61
13,13
42,59
16,15
25,13
67,69
11,9
50,57
44,55
13,25
61,69
61,55
7,31
21,39
7,21
59,40
22,63
8,5
23,41
13,10
56,61
21,52
47,60
63,54
17,19
61,60
70,53
54,67
49,62
49,63
18,61
7,23
32,51
67,35
69,37
31,17
51,56
5,35
25,39
16,21
25,4
26,43
23,59
19,68
67,41
23,66
57,57
64,59
11,25
65,39
44,51
29,41
59,37
17,40
26,53
7,5
66,27
63,12
67,19
60,19
9,70
15,45
47,45
25,23
49,19
19,30
53,31
5,58
51,1
5,45
64,33
41,45
69,12
1,46
57,45
30,31
37,23
40,33
65,57
47,3
43,22
41,1
69,27
39,19
25,25
54,13
29,61
65,7
67,37
63,29
33,16
26,23
36,21
40,9
65,13
6,53
45,29
45,13
48,53
45,31
53,17
57,3
53,32
62,27
9,65
48,17
40,45
11,15
42,47
57,21
41,7
8,59
21,57
27,17
59,34
16,61
67,9
63,25
45,69
21,47
35,35
39,49
7,44
43,30
37,9
33,51
2,49
61,33
61,23
59,33
3,48
15,42
48,13
59,15
11,35
5,51
56,35
21,55
13,50
49,6
55,29
37,4
7,59
45,44
28,29
3,39
45,23
19,27
32,43
66,69
51,8
41,44
69,19
7,67
67,7
3,37
55,6
27,18
55,21
31,58
67,34
43,47
43,29
61,9
64,7
1,37
32,35
47,37
21,58
4,59
48,11
51,34
3,66
65,9
41,35
17,43
53,36
51,23
11,47
35,58
1,19
48,37
55,13
25,33
8,53
35,47
39,61
15,55
33,19
51,55
60,13
45,26
60,15
0,57
29,27
47,44
53,25
56,39
65,24
47,19
9,35
39,5
29,31
44,49
59,19
1,52
42,43
51,9
10,63
61,28
23,17
63,33
44,39
19,52
40,7
19,34
45,3
26,17
20,13
68,3
69,14
39,28
65,18
1,36
6,67
19,45
5,57
27,19
1,51
3,43
31,21
55,7
43,36
13,39
19,51
23,28
47,11
61,15
56,25
51,42
3,62
3,47
31,37
47,32
55,3
69,21
67,24
69,7
9,42
29,19
53,45
34,35
59,23
15,53
17,41
55,17
12,47
30,5
27,28
5,67
11,59
49,51
39,45
5,60
37,31
36,53
56,17
33,58
17,44
5,61
24,21
15,21
70,3
42,25
41,40
34,49
65,14
51,21
13,53
25,20
37,57
33,60
47,4
53,15
57,9
36,61
13,69
45,4
13,43
21,29
57,47
31,61
65,11
5,40
2,53
59,3
47,14
47,34
31,35
53,39
49,9
69,18
19,29
50,11
1,11
49,37
27,60
51,13
53,43
7,45
33,56
41,55
25,7
9,67
3,21
49,13
69,31
51,43
5,39
59,7
17,59
46,43
13,51
60,45
61,24
28,41
49,1
1,39
21,27
59,26
29,35
37,28
68,5
67,1
5,65
50,49
37,49
4,43
61,12
37,63
7,57
45,16
46,53
10,45
6,61
8,61
33,9
46,17
1,43
57,5
37,5
45,36
61,3
23,33
65,33
33,33
50,5
69,35
55,5
41,38
43,57
39,15
43,13
57,25
41,59
53,40
33,13
7,41
16,23
3,17
49,45
58,49
6,69
57,28
39,11
39,59
34,51
65,25
39,48
4,45
13,56
29,58
27,29
1,67
43,45
35,3
43,7
57,19
37,45
67,17
13,64
1,68
34,13
35,6
1,53
24,35
44,41
43,31
43,16
40,1
53,19
53,24
45,6
38,7
51,5
18,49
23,22
46,23
43,1
58,21
45,19
35,4
13,58
49,11
37,32
52,7
69,9
31,43
33,43
15,62
9,1
33,38
15,65
13,62
38,53
18,13
31,63
62,21
9,45
12,45
42,27
29,15
32,15
33,53
35,65
5,37
40,47
41,43
59,45
61,6
51,31
47,29
66,33
9,38
47,25
61,14
25,19
66,21
7,51
43,18
53,22
37,48
57,13
63,23
44,45
45,15
56,43
19,53
9,43
57,15
56,33
15,25
43,28
39,22
33,44
53,33
53,9
45,55
19,50
66,7
25,16
43,33
58,31
61,19
37,39
9,54
52,9
51,40
63,7
21,30
57,4
46,1
10,61
49,43
37,56
9,47
42,51
47,61
28,31
27,27
51,2
67,8
43,25
15,56
2,19
29,21
35,22
32,61
39,47
15,48
3,57
39,50
33,62
43,35
53,38
64,13
35,40
13,65
63,35
53,0
9,49
67,31
47,10
23,36
36,45
54,33
62,1
39,3
55,41
12,61
61,13
53,23
41,50
58,47
49,10
4,47
29,7
23,35
37,42
51,39
31,59
9,53
53,5
41,15
4,65
60,31
43,41
35,37
11,69
43,49
69,13
50,47
46,13
45,17
11,58
43,43
41,61
21,26
25,17
3,34
56,29
3,65
34,33
41,12
1,69
6,11
33,25
19,32
40,23
67,12
37,26
33,37
31,26
37,11
55,11
16,49
55,22
60,1
2,57
27,31
5,55
51,19
5,59
69,30
61,36
30,37
65,2
20,55
40,37
9,37
47,39
10,43
25,32
54,17
57,2
40,13
38,57
39,21
19,49
13,23
55,16
50,31
55,31
34,37
31,3
15,61
63,11
7,64
53,27
7,25
33,64
39,40
24,27
51,26
17,7
60,5
17,21
31,25
55,39
27,10
43,23
36,15
11,68
42,23
45,47
3,61
7,37
1,63
49,28
40,3
36,51
8,17
17,47
49,41
42,33
48,1
58,7
35,59
45,41
34,65
63,4
37,13
13,57
6,45
49,46
59,35
36,37
15,3
10,51
47,18
35,16
10,41
57,1
53,2
11,49
34,55
37,15
65,5
50,19
53,1
61,29
41,39
66,5
12,65
50,35
62,5
47,23
33,28
13,61
45,33
61,21
9,39
67,3
51,51
12,49
14,45
61,1
68,37
0,47
5,43
31,15
47,27
29,56
50,23
41,9
41,42
35,13
3,67
25,21
16,45
5,5
13,21
9,15
59,13
53,14
59,25
43,14
23,30
35,26
35,41
15,66
3,53
33,27
57,49
15,43
33,5
4,53
48,41
37,55
0,65
57,23
34,21
18,57
57,37
17,58
14,47
35,18
22,23
34,1
37,19
19,33
66,19
36,31
35,19
25,29
21,11
37,27
5,53
53,3
37,33
17,46
28,59
9,63
40,5
7,61
43,39
43,32
54,9
2,61
42,1
9,41
1,42
7,55
60,21
35,28
39,42
65,4
15,11
53,34
31,23
35,27
7,47
31,28
15,51
50,37
7,46
11,67
9,17
28,21
17,27
41,25
35,11
33,67
28,35
8,39
61,7
39,14
33,26
18,47
25,15
3,51
39,53
5,50
14,53
20,59
5,56
47,7
41,41
60,3
5,62
33,55
49,39
56,31
38,39
3,41
53,44
37,21
5,47
9,36
33,61
39,54
27,15
45,25
11,61
39,31
43,15
62,25
49,7
35,43
27,67
46,37
50,39
7,39
65,31
6,51
23,24
41,51
31,34
28,15
61,34
45,27
11,65
67,10
59,10
7,65
53,29
10,47
31,29
21,31
63,3
62,7
32,3
3,69
41,3
3,55
17,55
38,35
33,23
34,31
65,21
41,33
67,23
39,43
49,27
23,31
33,49
44,33
67,6
69,23
1,66
59,9
5,63
18,21
1,21
39,30
68,23
43,8
27,30
17,54
45,12
39,57
59,0
47,63
35,44
57,11
1,55
67,27
51,20
63,27
42,3
48,39
31,33
35,17
10,49
58,3
7,43
44,13
11,17
6,41
52,47
48,25
65,19
57,27
35,66
67,29
42,5
41,5
51,7
21,35
37,1
3,59
39,23
9,57
29,33
27,34
51,33
47,1
14,59
55,1
59,21
37,47
37,3
7,63
53,6
12,69
35,42
16,55
55,9
15,64
46,47
53,41
63,21
41,65
39,27
17,32
69,20
27,26
47,17
11,41
39,51
21,25
54,59
67,5
57,12
59,28
17,25
65,3
45,39
54,25
17,57
12,41
49,16
61,31
8,45
47,31
59,29
59,11
31,27
57,29
26,29
37,37
32,11
55,46
55,10
27,35
4,55
43,51
7,69
33,14
22,15
54,29
47,6
52,11
26,33
59,27
49,35
64,19
17,53
38,19
50,25
3,45
31,8
49,3
9,68
51,45
27,36
3,64
38,33
1,49
33,41
37,18
49,29
56,21
54,37
33,45
20,21
33,21
51,29
33,63
40,31
43,55
37,8
48,35
21,45
13,55
46,39
5,41
47,21
4,35
41,11
41,58
8,57
30,63
35,23
30,27
35,39
35,31
56,23
67,21
54,27
46,55
7,9
51,4
68,1
37,7
51,14
7,49
43,5
21,23
39,7
17,49
28,39
11,63
15,23
39,17
52,37
65,29
53,21
39,1
45,5
63,5
59,1
68,25
35,7
55,19
59,24
45,1
49,33
2,59
49,5
11,51
16,51
1,65
51,37
49,17
47,41
16,57
24,31
18,27
13,41
3,19
65,16
51,15
11,45
31,19
19,47
7,56
45,30
41,53
23,37
29,32
1,17
46,29
67,2
58,15
55,23
53,35
39,25
23,32
48,45
63,10
21,34
65,63
51,30
61,11
43,61
11,1
40,25
45,51
29,63
27,20
17,45
14,23
61,5
43,38
42,15
51,44
1,35
70,25
4,37
31,31
49,55
35,46
15,59
65,27
53,4
27,37
43,63
25,31
63,19
35,1
31,40
45,7
8,51
36,35
44,9
39,6
51,28
4,69
6,65
1,59
38,45
50,13
37,30
35,10
43,2
8,67
45,28
63,13
68,15
53,30
47,33
69,34
69,10
22,17
45,21
39,12
31,18
51,18
8,9
35,49
45,59
63,17
13,59
59,5
65,15
23,21
29,25
39,41
47,43
30,19
37,53
49,25
63,22
49,42
61,25
43,21
41,31
69,1
33,18
29,37
40,51
69,3
63,1
62,9
29,59
43,34
9,59
11,57
55,33
57,44
41,21
37,41
67,33
36,9
57,7
49,32
59,31
50,1
11,56
57,41
29,22
10,57
19,14
61,27
25,26
39,16
53,37
27,59
65,17
1,57
15,69
33,8
29,5
41,56
32,23
57,20
42,11
21,54
55,4
68,21
19,15
40,17
45,35
48,21
41,17
7,42
11,43
3,50
36,47
45,18
49,47
15,57
32,41
49,23
35,33
33,31
47,47
31,13
53,12
56,27
27,25
1,62
55,2
6,49
34,41
37,51
41,27
70,15
57,35
21,46
62,15
63,2
37,29
17,52
41,47
55,47
63,31
47,51
42,57
57,17
12,51
51,17
14,51
69,8
65,35
35,67
43,59
39,20
19,25
41,30
33,29
65,10
57,33
23,34
43,53
35,15
63,9
15,47
65,30
46,31
55,15
48,29
2,45
51,27
41,23
9,61
35,9
51,3
1,45
43,9
14,67
27,57
62,19
36,23
67,11
57,14
67,47
55,8
3,68
65,22
10,53
11,60
41,19
39,9
67,18
55,25
45,53
69,11
3,33
39,24
1,50
1,61
21,21
35,25
13,63
41,29
0,19
54,19
47,35
1,56
35,24
57,36
17,23
19,26
35,55
21,19
29,57
33,54
9,69
41,37
69,33
46,35
9,51
37,43
37,38
43,19
67,13
35,29
42,53
65,26
11,66
29,23
21,53
17,61
51,16
44,25
60,17
32,37
2,43
59,18
23,29
69,28
2,21
15,49
35,36
43,37
49,21
29,26
39,33
61,35
48,3
11,39
21,33
27,21
1,41
39,10
29,1
33,30
43,20
51,35
19,35
45,37
67,30
1,47
37,35
69,29
39,36
55,35
67,25
2,37
37,20
45,20
34,7
61,17
46,21
10,65
27,33
49,22
31,39
12,53
36,59
47,57
15,63
33,7
31,20
33,20
41,18
52,27
53,7
51,41
64,31
56,11
47,53
64,9
44,61
33,39
23,27
53,20
65,1
49,15
41,49
17,35
28,19
60,23
69,5
56,15
29,29
47,26
32,31
3,25
45,52
38,1
59,17
30,35
60,9
41,13
37,52
59,30
47,9
33,35
47,5
39,37
33,3
25,35
23,25
47,24
43,27
45,48
57,18
49,31
3,63
3,54
6,39
21,32
37,17
17,51
19,57
63,16
51,25
68,31
35,5
44,5
15,27
42,35
33,57
57,31
38,15
48,51
69,15
5,69
57,6
51,11
9,55
24,23
35,57
33,24
45,2
58,33
13,67
65,23
63,34
37,25
58,9
21,37
35,51
47,15
7,66
39,29
15,41
69,25
67,16
63,15
31,22
41,20
33,47
13,54
49,8
45,42
45,45
38,43
19,55
11,55
46,7
14,69
29,3
39,35
52,17
7,53
19,56
3,49
45,9
58,25
32,5
39,26
62,29
53,11
8,63
21,43
43,10
35,53
19,44
55,27
3,11
45,11
52,23
36,33
67,15
15,68
36,55
16,25
37,50
15,67
67,28
69,17
43,17
46,9
5,49
57,8
47,13
31,6
65,32
43,3
53,13
11,53
18,33
64,27
45,43
39,39
7,58
59,55
29,4
56,63
48,67
59,2
31,24
16,17
7,6
54,47
4,42
55,52
14,38
62,4
58,14
30,50
45,24
30,30
56,0
20,32
16,18
54,4
45,50
12,43
49,70
2,20
11,48
16,65
34,0
12,0
6,22
64,18
57,48
6,9
8,11
66,65
62,14
68,26
26,34
4,26
68,22
26,10
3,56
2,38
42,50
40,70
20,48
28,54
30,48
25,22
8,37
8,70
37,70
58,19
18,52
0,69
12,64
10,21
12,32
48,9
45,8
4,68
38,8
60,6
4,10
67,26
32,39
24,62
17,50
25,18
46,66
32,47
10,11
67,20
25,62
14,65
54,43
64,10
31,50
48,28
4,33
3,8
69,24
20,56
8,40
66,22
18,36
33,32
8,1
12,28
43,0
70,1
48,26
50,64
8,12
68,54
66,10
70,44
20,57
12,68
54,8
61,18
3,42
9,62
12,44
9,32
9,28
52,36
38,69
50,30
28,44
24,69
36,46
9,40
19,36
28,56
13,52
16,46
53,68
4,44
31,36
0,56
12,58
46,26
16,38
6,30
7,70
44,48
65,8
0,29
12,27
44,70
3,16
16,28
25,44
18,53
8,2
66,1
61,8
59,52
14,28
54,7
22,16
28,24
30,39
38,44
10,50
24,25
0,39
3,30
2,10
64,17
26,67
60,8
11,42
8,18
6,36
66,59
17,0
58,8
5,68
22,54
0,59
36,39
68,17
65,6
68,40
5,30
9,6
48,52
15,70
22,50
22,31
36,34
30,53
37,0
60,11
49,4
62,3
25,64
26,44
66,68
26,40
46,30
23,62
24,37
66,12
66,26
14,58
43,58
38,34
56,10
62,32
50,29
8,38
0,44
11,38
9,44
14,63
8,30
16,44
18,23
4,17
26,32
11,44
8,22
20,54
30,28
58,17
12,24
22,11
31,42
4,27
8,66
15,26
49,34
58,54
52,68
51,58
68,10
0,45
0,35
6,57
4,4
40,30
41,0
2,48
27,46
29,6
22,48
40,11
24,14
10,17
20,42
2,47
28,33
5,38
44,7
50,40
22,52
58,12
12,55
30,45
0,11
42,49
69,54
48,6
37,44
1,58
67,40
4,46
0,25
27,44
27,40
29,34
41,6
68,53
6,52
67,14
39,0
7,62
4,60
40,35
24,30
63,60
5,52
51,66
52,33
41,2
20,12
66,62
38,0
6,50
9,66
32,70
14,5
16,58
47,28
2,9
62,62
57,60
0,55
22,68
35,50
44,68
40,34
19,70
17,20
32,2
6,54
68,12
28,36
14,68
14,22
40,8
56,16
57,68
69,0
14,52
26,28
48,58
48,10
70,24
10,38
64,1
45,46
4,16
15,60
44,58
32,40
40,66
57,0
37,36
9,30
62,35
36,4
29,42
16,32
70,32
30,46
5,48
4,14
25,70
64,20
4,12
19,20
0,18
8,56
26,57
33,0
42,24
47,46
0,52
8,10
70,13
18,42
10,6
50,34
6,18
64,11
62,28
2,35
20,53
70,0
59,4
11,50
6,17
24,53
20,22
2,18
13,0
25,34
21,40
16,47
2,62
69,50
40,48
54,41
16,37
46,49
0,67
70,22
4,64
16,24
24,18
26,64
16,54
2,67
32,30
22,14
16,26
14,18
30,7
36,22
6,15
4,38
70,9
9,26
0,68
40,64
1,70
69,16
7,50
43,6
24,64
35,2
62,37
62,11
2,26
65,12
56,44
19,58
30,24
68,9
2,68
54,6
7,12
8,43
18,22
46,48
11,46
2,16
58,10
10,56
62,10
34,47
38,65
64,22
8,21
16,64
62,54
6,21
30,32
16,33
40,10
26,46
6,16
20,47
53,28
48,65
32,46
48,27
28,5
11,32
14,25
33,2
0,24
26,52
36,49
46,50
34,43
26,51
20,52
56,64
4,21
67,58
16,29
49,58
63,32
38,9
36,3
50,58
44,6
9,64
15,36
64,16
2,54
2,40
17,56
20,23
4,20
2,64
14,24
23,16
6,64
18,12
35,70
68,8
22,32
24,24
18,54
62,60
48,32
7,14
13,60
70,4
24,44
19,46
23,40
42,58
38,21
15,0
62,52
44,59
16,43
40,0
0,43
24,68
3,4
14,33
70,43
36,41
14,61
12,22
56,60
34,36
19,0
16,56
6,10
19,28
46,36
46,25
26,42
12,54
22,53
11,12
25,0
39,64
25,60
8,29
66,2
13,66
6,60
0,4
9,56
24,50
32,44
42,0
59,14
56,5
13,48
2,34
10,59
0,3
18,7
70,2
32,24
17,60
18,0
62,8
24,51
6,27
68,48
46,51
50,4
4,62
62,17
51,36
6,59
58,65
18,17
40,6
12,25
10,69
28,65
66,0
64,5
4,7
13,6
56,46
31,46
24,19
20,38
68,52
2,12
66,25
58,2
18,65
6,55
56,3
59,12
46,46
8,69
16,16
18,51
58,68
15,50
21,12
52,48
60,10
15,44
41,26
42,55
14,20
66,29
46,63
44,21
70,57
14,54
70,55
6,29
41,10
3,20
37,24
7,38
26,31
42,66
45,0
20,24
52,6
45,56
27,58
11,14
54,10
26,36
30,11
26,27
3,32
46,42
52,25
56,28
40,55
66,18
28,9
52,10
70,36
12,67
4,30
44,28
22,62
54,30
20,2
70,46
28,55
38,14
60,54
40,27
46,68
3,58
37,58
20,50
20,34
6,38
60,4
66,67
1,16
4,28
17,42
15,54
38,40
60,27
35,54
20,60
31,4
55,64
14,44
34,46
44,54
44,27
53,26
49,24
34,40
67,0
10,4
60,32
50,66
64,70
48,5
1,32
6,4
60,35
49,14
2,2
45,38
60,34
0,50
20,62
61,20
34,57
38,29
24,12
12,6
54,1
48,61
26,35
14,40
16,48
46,62
25,12
42,70
17,4
14,36
22,10
6,14
61,52
28,50
8,8
70,59
44,46
56,54
29,60
51,46
43,12
34,38
32,8
8,32
27,38
21,18
30,29
60,66
48,70
48,4
68,7
61,16
56,26
33,42
36,62
66,60
38,49
55,32
30,52
46,41
48,7
68,36
32,27
57,24
36,42
56,47
44,15
38,23
8,54
16,62
44,14
22,49
65,34
46,58
47,36
50,0
12,56
26,50
63,56
10,54
44,26
12,18
30,9
2,69
28,34
68,59
23,64
44,43
34,66
38,22
42,56
42,60
14,15
51,32
37,16
44,66
32,21
64,14
63,18
42,2
21,22
10,62
46,18
42,6
24,38
21,4
35,32
10,8
66,50
50,70
52,40
10,32
46,33
54,36
66,36
64,66
48,18
61,64
61,70
51,22
22,56
41,4
0,63
56,12
17,2
45,40
26,38
20,5
31,70
51,10
32,17
22,13
65,60
61,50
17,8
54,52
50,36
7,68
18,67
18,4
53,66
56,41
40,40
18,60
60,33
17,10
48,62
0,62
31,14
32,19
68,11
34,34
26,19
38,30
46,10
10,66
64,51
24,42
32,25
63,40
50,45
58,66
44,3
70,63
29,0
26,15
29,30
16,8
42,7
50,10
0,5
20,33
60,42
0,64
24,5
21,56
52,22
30,26
30,44
52,44
48,66
64,60
70,58
70,35
62,67
60,57
70,5
33,66
0,21
4,63
29,44
26,66
48,0
42,9
9,50
34,28
51,62
38,52
20,64
5,70
16,14
70,20
65,44
32,29
69,38
42,36
6,3
66,15
31,32
66,30
6,28
54,20
65,20
10,10
15,10
38,24
8,6
57,16
55,36
38,41
16,36
46,20
12,57
52,4
24,45
40,16
64,25
22,18
23,50
24,70
27,14
9,58
14,34
56,8
20,18
49,64
48,20
70,68
70,17
60,68
70,26
66,54
66,8
0,22
36,38
61,10
10,46
47,12
0,53
13,22
51,64
62,49
38,70
56,34
32,42
24,15
58,46
40,68
21,28
42,34
70,56
32,50
44,64
63,20
8,64
25,36
28,23
43,66
18,39
16,4
26,54
18,31
44,2
27,0
21,42
48,42
62,13
56,7
62,20
4,19
52,13
68,68
27,32
54,31
62,47
0,38
2,0
37,40
31,64
70,31
42,8
22,26
13,12
6,34
23,38
46,2
56,52
30,16
36,24
48,46
21,38
67,38
64,36
38,60
47,52
35,62
55,0
60,69
21,2
55,12
19,2
9,16
47,42
27,2
68,16
50,9
62,53
40,58
41,46
0,32
47,2
4,22
32,53
14,16
15,46
8,49
32,48
50,61
29,18
22,6
66,6
64,8
42,48
26,62
35,48
40,20
18,44
58,13
68,45
34,62
31,56
47,54
52,31
69,36
21,66
57,50
45,54
26,70
48,43
34,5
12,63
36,40
24,36
27,70
64,15
8,4
23,58
34,68
28,16
22,60
14,29
45,22
39,58
34,27
40,22
61,4
16,68
36,19
36,30
30,12
54,34
"""#

@Suite("Day 18 Tests")
struct Day18Tests {
  @MainActor @Test("Day 18 Part 1")
  func testDay18_part1() {
    let day = Day18(input: testInput)
    #expect(day.part1(fallen: 12, gridSize: 6) == 22)
  }
  
  @MainActor @Test("Day 18 Part 1 Solution")
  func testDay18_part1_solution() {
    let day = Day18(input: Day18.input)
    #expect(day.part1() == 348)
  }
  
  @MainActor @Test("Day 18 Part 2")
  func testDay18_part2() {
    let day = Day18(input: testInput)
    #expect(day.part2(fallen: 12, gridSize: 6) == "6,1")
  }
  
  @MainActor @Test("Day 18 Part 2 Solution")
  func testDay18_part2_solution() {
    let day = Day18(input: Day18.input)
    #expect(day.part2() == "54,44")
  }
}
