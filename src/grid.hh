/*
* grid.hh
* 
* Copyright (c) 2017 Pradu Kannan. All rights reserved.
*/

#ifndef ___GRID_HH
#define ___GRID_HH

#include <u/types.hh>

struct GridNode
{
    //Node Types
    //FLOW - a regular solution node
    //BODY - Body Boundary Conditions
    //SOURCE - (Dirichlet) Source Boundary Conditions
    //FREE - (Neumann) Bounday Conditions
    enum { FLOW=0, BODY, SOURCE, FREE };
    FLOAT p;   //pressure
    FLOAT rho; //denisty
    FLOAT x;   //x-position
    FLOAT y;   //y-position
    FLOAT ux;  //flow velocity
    FLOAT uy;  //flow velocity
    GridNode* l; //left
    GridNode* r; //right
    GridNode* u; //up
    GridNode* d; //down
};


#endif  // ___GRID_HH

