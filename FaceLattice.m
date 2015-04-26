(*
  FaceLattice.m: Face Enumeration for Convex Polytopes
     
             Version 0.2 Beta
              September 19, 1992

           Copyright (c) 1992 by

  Komei Fukuda
  Graduate School of Systems Management
  University of Tsukuba, Tokyo
  3-29-1 Otsuka, Bunkyo-ku
  Tokyo, Japan 112
  +81-3-3942-6876
  fukuda@gssm.otsuka.tsukuba.ac.jp

  and
  
  Vera Rosta
  Department of Mathematics
  Temple University Japan
  2-2 Minami-Osawa, Hachioji-shi
  Tokyo, Japan 192-03

*)

BeginPackage["FaceLattice`", "VertexEnum`", "DiscreteMath`Combinatorica`"]

KFaceList::usage = "KFaceList[vlist] gives the list of k-faces of
the convex polytope P with combinatorial representation of vertices 
given by  vlist, for k=-1,0,1,...,dim(P)."

FVector::usage = "FVector[kfl] gives the f-vector of 
the convex polytope with k-face list kfl."

FaceLatticeDiagram::usage = "FaceLatticeDiagram[kfl,psize,ewidth] gives 
the graphics primitive of the face lattice of 
the convex polytope with k-face list kfl.  
Point size and edge width are both optional."

FaceLatticeLinks::usage = "FaceLatticeLinks[kfl] gives 
the links (covering relation) of the face lattice of 
the convex polytope with k-face list kfl."

Begin["`Private`"]

KFaceList[l_List]:=
    Block[{allfaces={{Apply[Union,l]}},
           ktemp=Map[Union[#]&,l],kfaces,k1faces={},
           doflag,ftemp,s,i,j,k=0},
      While[Length[ktemp]>1,
      	 doflag=Table[True,{Length[ktemp]}];
         Do[
         	If[doflag[[i]],
         		Do[
         			If[doflag[[j]],
         				ftemp=Union[Intersection[ktemp[[i]],ktemp[[j]]]];
         				If[k1faces=={} || Position[k1faces,ftemp]=={},
         					k1faces=Append[k1faces,ftemp];
         					s=Position[ktemp,ftemp];
             					If[s!={},
         						doflag[[s[[1,1]]]]=False
         					]
         				]
         			]
         			,{j,i+1,Length[ktemp]}
         		]
         	]
            ,{i,Length[ktemp]-1}
         ];
         kfaces={};
         Do[
         	If[doflag[[i]],
         		AppendTo[kfaces,ktemp[[i]]]
         	]
         	,{i,Length[ktemp]}
         ];
         Print["All ",k,"-faces determined."];
         allfaces=Append[allfaces,kfaces];
         ktemp=k1faces;   k1faces={};  k=k+1
      ];
      allfaces=Append[allfaces,ktemp]
    ];

FVector[kfl_List]:=Map[Length[#]&,kfl];

FaceLatticeLinks[kfl_List]:=
    Block[{k,d,i,j,f1,f2,allrel={},krel},
      d=Length[kfl]-2;
      Do[krel={};
         Do[
            Do[f1=kfl[[k+1,i]];  f2=kfl[[k+2,j]];
               If[Complement[f2,f1]=={},
                  krel=Join[krel,
                    {{{k-1,i},{k,j}}}],
               ],
               {j,Length[kfl[[k+2]]]}
            ],
            {i,Length[kfl[[k+1]]]}
         ];
         allrel=Join[allrel,krel],  
         {k,0,d}
      ];
      allrel
    ];

FacePosition[kfl_List,k_Integer,j_Integer]:=
   Block[{x,y,fk,fmax,fmin,width,d=(Length[kfl]-2)},
      fmax=Max[FVector[kfl]];
      fmin=Min[FVector[kfl]];
      fk=Length[kfl[[k+2]]];
      If[fmax>fmin,
         width=2/3+(1/3)(fk-fmin)/(fmax-fmin),1];
      If[fk<=1,x=1/2,x=(1-width)/2+(j-1)*width/(fk-1)]; 
      If[d<=-1,0,y=(k+1)/(d+1)];
      {x,y}
   ];


FaceLatticeEdges[kfl_List,flink_List]:=
   Map[{FacePosition[kfl,#[[1,1]],#[[1,2]]],
        FacePosition[kfl,#[[2,1]],#[[2,2]]]}&,
      flink
   ];
    
FaceLatticePoints[kfl_List]:=
  Flatten[
     Table[
        Table[FacePosition[kfl,k-2,j],
           {j,Length[kfl[[k]]]}
        ],
        {k,Length[kfl]}
     ],1
  ];
  

FaceLatticeDiagram[kfl_List,psize_:0.01,ewidth_:0.002]:=
	Block[{HasseLinks,EdgePositions,PointPositions},
		HasseLinks=FaceLatticeLinks[kfl];
		EdgePositions=FaceLatticeEdges[kfl,HasseLinks];
		PointPositions=FaceLatticePoints[kfl];
		Graphics[
 			Join[{Thickness[ewidth],GrayLevel[0]},
 		   		Line /@ EdgePositions,
				{PointSize[psize],GrayLevel[0]},
				Point /@ PointPositions
			]
		]
	]

  
End[]

EndPackage[]

