UPDATE spell SET attributes = attributes & ~65536 WHERE ID IN (2575, 2576, 3564, 10248, 29354, 32606, 50310) AND (attributes & 65536) != 0;
