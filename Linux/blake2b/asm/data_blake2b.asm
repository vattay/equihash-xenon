xshufb_ror24 db 3,4,5,6,7,0,1,2, 11,12,13,14,15,8,9,10
xshufb_ror16 db 2,3,4,5,6,7,0,1, 10,11,12,13,14,15,8,9
xshufb_bswap8 db 7,6,5,4,3,2,1,0, 15,14,13,12,11,10,9,8
xctrinc dd 0,2, 0,2

align 32
iv dq 0x6a09e667f3bcc908, 0xbb67ae8584caa73b
dq 0x3c6ef372fe94f82b, 0xa54ff53a5f1d36f1
dq 0x510e527fade682d1, 0x9b05688c2b3e6c1f
dq 0x1f83d9abfb41bd6b, 0x5be0cd19137e2179

s0 dq 0x6a09e667f3bcc908 xor 0x1010032, 0xbb67ae8584caa73b	;0x32=50 bytes output
s2 dq 0x3c6ef372fe94f82b, 0xa54ff53a5f1d36f1
s4 dq 0x510e527fade682d1, 0x9b05688c2b3e6c1f
s6 dq 0x1f83d9abfb41bd6b xor 0x576f50687361635a	;Personalization
s7 dq 0x5be0cd19137e2179 xor 0x00000009000000c8	;n=200, k=9

iv4xor128 dq 0x510e527fade682d1 xor 0x80, 0x9b05688c2b3e6c1f
dq 0x1f83d9abfb41bd6b, 0x5be0cd19137e2179
iv4xor144 dq 0x510e527fade682d1 xor 144, 0x9b05688c2b3e6c1f
iv6inverted dq 0xe07c265404be4294, 0x5be0cd19137e2179

align 32
yctrinit dd 0,0, 0,1, 0,2, 0,3
yctrinc dd 0,4, 0,4, 0,4, 0,4

blake2sigma db 0,2,4,6,1,3,5,7,8,10,12,14,9,11,13,15
db 14,4,9,13,10,8,15,6,1,0,11,5,12,2,7,3
db 11,12,5,15,8,0,2,13,10,3,7,9,14,6,1,4
db 7,3,13,11,9,1,12,14,2,5,4,15,6,10,0,8
db 9,5,2,10,0,7,4,15,14,11,6,3,1,12,8,13
db 2,6,0,8,12,10,11,3,4,7,15,1,13,5,14,9
db 12,1,14,4,5,15,13,10,0,6,9,8,7,3,2,11
db 13,7,12,3,11,14,1,9,5,15,8,2,0,4,6,10
db 6,14,11,0,15,9,3,8,12,13,1,10,2,7,4,5
db 10,8,7,1,2,4,6,5,15,9,3,13,11,14,12,0
