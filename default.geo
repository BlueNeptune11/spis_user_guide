    // Simple spacecraft model
    // Mika Holmberg
    // 2024-07-31

    // Lengths

    l = 1;	// Characteristic length for mesh generation
    b = 0.1;		// Characteristic length for mesh generation on the boundary

    // The spacecraft body

    Point(100) = {-1, -1, -1, l};
    Point(101) = {-1, -1, 1, l};
    Point(102) = {-1, 1, 1, l};
    Point(103) = {-1, 1, -1, l};
    Point(104) = {1, -1, -1, l};
    Point(105) = {1, -1, 1, l};
    Point(106) = {1, 1, 1, l};
    Point(107) = {1, 1, -1, l};

    // The outer boundary

    Point(108) = {0, 0, 0, b};
    Point(109) = {4, 0, 0, b};
    Point(110) = {0, 4, 0, b};
    Point(111) = {-4, 0, 0, b};
    Point(112) = {0, -4, 0, b};
    Point(113) = {0, 0, 4, b};
    Point(114) = {0, 0, -4, b};

    // Lines for the spacecraft

    Line(200) = {100, 101};
    Line(201) = {101, 102};
    Line(202) = {102, 103};
    Line(203) = {103, 100};
    Line(204) = {104, 105};
    Line(205) = {105, 106};
    Line(206) = {106, 107};
    Line(207) = {107, 104};
    Line(208) = {105, 101};
    Line(209) = {102, 106};
    Line(210) = {103, 107};
    Line(211) = {104, 100};

    // Lines for the outer boundary

    Circle(212) = {109, 108, 110};
    Circle(213) = {110, 108, 111};
    Circle(214) = {111, 108, 112};
    Circle(215) = {112, 108, 109};
    Circle(216) = {109, 108, 113};
    Circle(217) = {113, 108, 111};
    Circle(218) = {111, 108, 114};
    Circle(219) = {114, 108, 109};
    Circle(220) = {112, 108, 113};
    Circle(221) = {113, 108, 110};
    Circle(222) = {110, 108, 114};
    Circle(223) = {114, 108, 112};

    // Defining the surfaces on the satellite

    Line Loop(300) = {200, 201, 202, 203};
    Plane Surface(301) = {300};
    Line Loop(302) = {204, 205, 206, 207};
    Plane Surface(303) = {302};
    Line Loop(304) = {204, 208, -200, -211};
    Plane Surface(305) = {304};
    Line Loop(306) = {202, 210, -206, -209};
    Plane Surface(307) = {306};
    Line Loop(308) = {205, -209, -201, -208};
    Plane Surface(309) = {308};
    Line Loop(310) = {211, -203, 210, 207};
    Plane Surface(311) = {310};

    // Defining the surfaces of the outer boundary

    Line Loop(312) = {212, -221, -216};
    Surface(313) = {312};
    Line Loop(314) = {213, -217, 221};
    Surface(315) = {314};
    Line Loop(316) = {214, 220, 217};
    Surface(317) = {316};
    Line Loop(318) = {215, 216, -220};
    Surface(319) = {318};
    Line Loop(320) = {212, 222, 219};
    Surface(321) = {320};
    Line Loop(322) = {213, 218, -222};
    Surface(323) = {322};
    Line Loop(324) = {214, -223, -218};
    Surface(325) = {324};
    Line Loop(326) = {215, -219, 223};
    Surface(327) = {326};

    // Defining the computational volume

    Surface Loop(400) = {301, 303, 305, 307, 309, 311}; // Spacecraft
    Surface Loop(401) = {313, 315, 317, 319, 321, 323, 325, 327}; // Outer boundary
    Volume(500) = {401, 400};

    // Physical groups

    Physical Surface(600) = {301, 303, 305, 307, 309, 311}; // Spacecraft
    Physical Surface(601) = {313, 315, 317, 319, 321, 323, 325, 327}; // Outer boundary

    Physical Volume(700) = {500};