Board Class:
rows 0, 1, 6, and 7 are going to be pieces at the start of the game
remaining rows will be nullpieces
row[0][0] && row[0][7] && row[7][0] && row[7][7] == rooks
row[0][1] && row[0][6] && row[7][1] && row[7][6] == knights
row[0][2] && row[0][5] && row[7][2] && row[7][5] == bishops
row[6].each && row[1].each == pawns
row[0][3] && row[7][3] == queens
row[0][4] && row[7][4] == kings

rows[2] - [5].each == nullpiece


pieces:
black_pieces: ♖ ♘ ♔ ♕ ♗ ♙
white_pieces: ♜ ♟ ♞ ♝ ♜ ♛ ♚ 