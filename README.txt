
           Vertex Enumeration Package for 
         Convex Polytopes and Arrangements
                  Version 0.41 Beta
                 (Nevember 14, 1992)
                         by
         Komei Fukuda and Ichiro Mizukoshi


This package contains Mathematica implementations of Avis-Fukuda 
algorithms for enumerating all vertices of a convex polyhedron 
given by a system of linear inequalities, and all vertices (points) 
of an arrangement given similarly.

The package consists of the following six files

     README.txt             (This file itself) 
     VertexEnum.m           (Mathematica package)   
     VE-Notebook.nb         (Mathematica Notebook)
     Power.m                (Supplementary program 
			     for VertexEnum.m)
     FaceLattice.m          (Supplementary package
			     to compute the face
			     lattice of a convex
			     polytope)
     FL-Notebook.nb         (Mathematica Notebook)

The notebooks explain how to use these packages through examples. 
If your environment does not allow you to use notebooks, we suggest 
you to get it printed before using the package. For the moment, the 
notebook environment is supported by the Macintosh, NeXT, and Windows 
versions of Mathematica. 

This beta release is designed to run under Version 1.2/2.0/2.1 of 
Mathematica. 

Few bugs of Version 0.3 have been fixed, including its mishandling 
of the case when the polyhedron is empty.  Also, the notebook for 
Version 0.3 has been slightly revised.

Please send your comments, bug reports etc. to:

  Komei Fukuda  or Ichiro Mizukoshi
  Graduate School of Systems Management
  University of Tsukuba, Tokyo
  3-29-1 Otsuka, Bunkyo-ku
  Tokyo 112, Japan

  +81-3-3942-6876
  fukuda@gssm.otsuka.tsukuba.ac.jp
  or mizukosi@gssm.otsuka.tsukuba.ac.jp

Some remarks from Prof. Fukuda:
1. This package is rather old and slow, but it might be still useful for 
   small polytopes, say, of dimension less than or equal to 8.
2. VertexEnum.m does not detect unboundness.
For more information, please refer to 
https://groups.google.com/forum/#!searchin/sci.math.symbolic/vertexenum/sci.math.symbolic/6ZI2QKOPvik/2lRn1QQEeN0J
