/*
Cities With The Most Expensive Homes
Write a query that identifies cities with higher than average home prices when compared to the national average. Output the city names.
Table: zillow_transactions

zillow_transactions
id int,
state varchar,
city varchar,
street_address varchar,
mkt_price int

id	state	city	street_address	mkt_price
1	NY	New York City	66 Trout Drive	449761
2	NY	New York City	Atwater	277527
3	NY	New York City	58 Gates Street	268394
4	NY	New York City	Norcross	279929
5	NY	New York City	337 Shore Ave.	151592
6	NY	New York City	Plainfield	624531
7	NY	New York City	84 Central Street	267345
8	NY	New York City	Passaic	88504
9	NY	New York City	951 Fulton Road	270476
10	NY	New York City	Oxon Hill	118112
11	CA	Los Angeles	692 Redwood Court	150707
12	CA	Los Angeles	Lewiston	463180
13	CA	Los Angeles	8368 West Acacia Ave.	538865
14	CA	Los Angeles	Pearl	390896
15	CA	Los Angeles	8206 Old Riverview Rd.	117754
16	CA	Los Angeles	Seattle	424588
17	CA	Los Angeles	7227 Joy Ridge Rd.	156850
18	CA	Los Angeles	Battle Ground	643454
19	CA	Los Angeles	233 Bedford Ave.	713841
20	CA	Los Angeles	Saint Albans	295852
21	IL	Chicago	8830 Baker St.	12944
22	IL	Chicago	Watertown	410766
23	IL	Chicago	632 Princeton St.	160696
24	IL	Chicago	Waxhaw	464144
25	IL	Chicago	7773 Tailwater Drive	129393
26	IL	Chicago	Bonita Springs	174886
27	IL	Chicago	31 Summerhouse Rd.	296008
28	IL	Chicago	Middleburg	279000
29	IL	Chicago	273 Windfall Avenue	424846
30	IL	Chicago	Graham	592268
31	TX	Houston	91 Canterbury Dr.	632014
32	TX	Houston	Dallas	68868
33	TX	Houston	503 Elmwood St.	454184
34	TX	Houston	Kennewick	186280
35	TX	Houston	739 Chapel Street	334474
36	TX	Houston	San Angelo	204460
37	TX	Houston	572 Parker Dr.	678443
38	TX	Houston	Bellmore	401090
39	TX	Houston	8653 South Oxford Street	482214
40	TX	Houston	Butler	330868
41	AZ	Phoenix	8667 S. Joy Ridge Court	316291
42	AZ	Phoenix	Torrance	210392
43	AZ	Phoenix	35 Harvard St.	167502
44	AZ	Phoenix	Nutley	327554
45	AZ	Phoenix	7313 Vermont St.	285135
46	AZ	Phoenix	Lemont	577667
47	AZ	Phoenix	8905 Buttonwood Dr.	212301
48	AZ	Phoenix	Lafayette	317504
49	AZ	Phoenix	170 Brandywine Drive	287864
50	AZ	Phoenix	Lake Mary	822532
51	PA	Philadelphia	77 West Mayfield St.	541423
52	PA	Philadelphia	Port Chester	334229
53	PA	Philadelphia	92 Bedford Lane	445591
54	PA	Philadelphia	Palm Bay	461683
55	PA	Philadelphia	86 Edgemont Drive	386885
56	PA	Philadelphia	Hollywood	670135
57	PA	Philadelphia	946 George St.	416003
58	PA	Philadelphia	Braintree	477100
59	PA	Philadelphia	35 Sussex Court	293291
60	PA	Philadelphia	Henderson	384877
61	CA	San Diego	222 N. Tunnel Ave.	140981
62	CA	San Diego	Orange	465564
63	CA	San Diego	757 Lakewood Street	235446
64	CA	San Diego	Ronkonkoma	143486
65	CA	San Diego	562 Marlborough Drive	609823
66	CA	San Diego	Fitchburg	202015
67	CA	San Diego	7487 North Market Drive	455428
68	CA	San Diego	El Paso	252083
69	CA	San Diego	672 High Ridge Drive	506868
70	CA	San Diego	Great Falls	90000
71	CA	San Francisco	9936 SW. Livingston Street	217451
72	CA	San Francisco	Clearwater	1794282
73	CA	San Francisco	76 South Ave.	1692646
74	CA	San Francisco	Bethel Park	596998
75	CA	San Francisco	51 Homestead Ave.	1495620
76	CA	San Francisco	Valparaiso	1752703
77	CA	San Francisco	7851 Lookout Court	1383822
78	CA	San Francisco	Seymour	243464
79	CA	San Francisco	8290 Bradford Street	1568759
80	CA	San Francisco	Sugar Land	28285
81	CA	Santa Clara	9673 South Homewood St.	1119747
82	CA	Santa Clara	Mount Juliet	204832
83	CA	Santa Clara	73 East South Ave.	917268
84	CA	Santa Clara	Hudson	713266
85	CA	Santa Clara	669 South Columbia St.	974397
86	CA	Santa Clara	Hummelstown	944574
87	CA	Santa Clara	7699 S. Orange St.	1100325
88	CA	Santa Clara	Asbury Park	966673
89	CA	Santa Clara	19 Beacon Circle	1207658
90	CA	Santa Clara	Phillipsburg	1682459
91	CA	Mountain View	730 El Dorado Street	893838
92	CA	Mountain View	Bear	446689
93	CA	Mountain View	8233 Swanson Circle	1271223
94	CA	Mountain View	Lumberton	949895
95	CA	Mountain View	8803 University Drive	1376870
96	CA	Mountain View	Sterling Heights	1235082
97	CA	Mountain View	9447 Rockwell St.	1569111
98	CA	Mountain View	Biloxi	853914
99	CA	Mountain View	219 East Rock Maple Ave.	746615
100	CA	Mountain View	Bridgewater	616129

*/

-- Solution
Select distinct x.city from (

select city,
avg(mkt_price) over (partition by city) as avgHomePrice,
avg(mkt_price) over () as nationalAvg
from zillow_transactions
) x
where x.avgHomePrice > x.nationalAvg
---- Another Solution found in towards data science
SELECT city
FROM zillow_transactions a
GROUP BY city
HAVING avg(a.mkt_price) >
  (SELECT avg(mkt_price)
   FROM zillow_transactions)
ORDER BY city ASC
