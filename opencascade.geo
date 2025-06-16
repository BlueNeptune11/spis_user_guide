// Simple spacecraft model 
// Mika Holmberg 
// 2025-06-13

SetFactory("OpenCASCADE");

// Mesh Sizes
mesh_box = 0.1;
mesh_sphere = 0.1;

// The spacecraft body 
Box(1) = {-1, -1, -1, 2, 2, 2};
MeshSize{ PointsOf { Volume{1}; } } = mesh_box;

// The outer boundary
Sphere(2) = {0, 0, 0, 30};
MeshSize{ PointsOf { Volume{2}; } } = mesh_sphere;

BooleanDifference(3) = {Volume{2};Delete;}{Volume{1};Delete;};

Physical Surface(600) = {1};
Physical Surface(601) = {2};
Physical Volume(700) = {3};