Given a graph G and two nodes A and Z in G, this program finds an acyclic path P between A and Z. 
The path represents an ordered list of nodes from the start node to the goal node. 
Since the path is acyclic, a node appears in the path only once.

**Execution steps:**

*Step 1* - Compile	
  ?- ['..location of the file../acyclic.pl'].

*Step 2* - Run	
  ?- start.

*Step 3* - Enter values for node A, node Z and graph.

*Important: The format of inputting graph values must be followed strictly. Also make sure to add a period (.) at the end of every command.*

*Format*: graph(Nodes,Edges).

**Sample data:**

1.	a.	d.	graph([a,b,c,d], [c(a,b),c(b,c),c(b,d),c(c,d),c(d,b)]).

2.	a.	c.	graph([a,b,c,d], [c(a,b),c(b,c),c(b,d),c(c,d),c(d,b)]).
