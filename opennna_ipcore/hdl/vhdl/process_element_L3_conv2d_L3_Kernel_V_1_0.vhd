-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity process_element_L3_conv2d_L3_Kernel_V_1_0_rom is 
    generic(
             DWIDTH     : integer := 7; 
             AWIDTH     : integer := 9; 
             MEM_SIZE    : integer := 512
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of process_element_L3_conv2d_L3_Kernel_V_1_0_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1110011", 1 => "0011010", 2 => "1101100", 3 => "1110111", 
    4 => "1110011", 5 => "0101110", 6 => "1111010", 7 => "1110010", 
    8 => "1101011", 9 => "1101111", 10 => "1100100", 11 => "1101100", 
    12 => "1100011", 13 => "0001001", 14 => "0010100", 15 => "0011010", 
    16 => "1110011", 17 => "0010010", 18 => "1111101", 19 => "1110000", 
    20 => "0000110", 21 => "0100011", 22 => "1100101", 23 => "0011101", 
    24 => "1101111", 25 => "1111111", 26 => "1101111", 27 => "0000101", 
    28 => "0011001", 29 => "1101110", 30 => "0011110", 31 => "1110000", 
    32 => "0001111", 33 to 34=> "0011011", 35 => "0010100", 36 => "1111100", 
    37 => "0001111", 38 => "1111010", 39 => "0001011", 40 => "1110010", 
    41 => "0010111", 42 => "0001011", 43 => "0001101", 44 => "1111011", 
    45 => "1111000", 46 => "0010111", 47 => "0011001", 48 => "1111010", 
    49 => "0010111", 50 => "1110000", 51 => "1101101", 52 => "0001101", 
    53 => "0010100", 54 => "1111100", 55 => "1100011", 56 => "0011011", 
    57 => "0000100", 58 => "0010100", 59 => "0001011", 60 => "1100010", 
    61 => "1101111", 62 to 63=> "0000000", 64 => "1111010", 65 => "0011100", 
    66 => "1110001", 67 => "1100011", 68 => "1101100", 69 => "0011110", 
    70 => "0000110", 71 => "0000011", 72 => "0010010", 73 => "1110011", 
    74 => "0011010", 75 => "0001001", 76 => "1100110", 77 => "1110101", 
    78 => "1110010", 79 => "1111000", 80 => "0001011", 81 => "0010100", 
    82 => "0010111", 83 => "1110101", 84 => "0011000", 85 => "0100010", 
    86 => "0011101", 87 => "1111010", 88 => "1100111", 89 => "0000101", 
    90 => "0010001", 91 => "0001001", 92 => "0000110", 93 => "1110100", 
    94 => "1101000", 95 => "0011001", 96 => "0011111", 97 => "1110111", 
    98 => "1111011", 99 => "1110011", 100 => "1111010", 101 => "0100101", 
    102 => "1101101", 103 => "1100010", 104 => "1110110", 105 => "0000101", 
    106 => "0001011", 107 => "1110001", 108 => "0011111", 109 => "1111010", 
    110 => "0000100", 111 => "0010010", 112 => "1111011", 113 => "0000001", 
    114 => "1111001", 115 => "0001101", 116 => "0000001", 117 => "1101011", 
    118 => "1111011", 119 => "1110110", 120 => "1101001", 121 => "0000110", 
    122 => "1100100", 123 => "0100010", 124 => "1110001", 125 => "1111001", 
    126 => "0100001", 127 => "0000100", 128 => "0001001", 129 => "1111110", 
    130 => "0010110", 131 => "0001110", 132 => "1111110", 133 => "1010010", 
    134 => "0000100", 135 => "0000110", 136 => "0011010", 137 => "1101011", 
    138 => "0011110", 139 => "0000101", 140 => "1101011", 141 => "1110001", 
    142 => "0010101", 143 => "0000011", 144 to 145=> "0001111", 146 => "1101011", 
    147 => "0000100", 148 => "1101001", 149 => "0001010", 150 => "1110111", 
    151 => "1111001", 152 => "1100111", 153 => "1101100", 154 => "1100101", 
    155 => "1110110", 156 => "0011100", 157 => "0011010", 158 => "0000100", 
    159 => "1111001", 160 => "0001100", 161 => "0000001", 162 => "0001000", 
    163 => "1100111", 164 => "0010001", 165 => "0011100", 166 => "1100101", 
    167 => "1110011", 168 => "0000011", 169 => "1101101", 170 => "0010001", 
    171 => "0010111", 172 => "1100010", 173 => "1100100", 174 => "0001001", 
    175 => "0011000", 176 => "0001110", 177 => "0001000", 178 => "0010010", 
    179 => "0001011", 180 => "0101100", 181 => "1100100", 182 => "0001010", 
    183 => "0010100", 184 => "0010010", 185 => "1110011", 186 => "0001111", 
    187 => "0000101", 188 => "0000011", 189 => "0101000", 190 => "0011011", 
    191 => "0010100", 192 => "0000111", 193 => "1110100", 194 => "1111010", 
    195 => "0010011", 196 => "0011000", 197 => "1111000", 198 => "0000110", 
    199 => "1111001", 200 => "1101110", 201 => "1101000", 202 => "0001010", 
    203 => "1101011", 204 => "1011111", 205 => "0000100", 206 => "0011000", 
    207 => "1100101", 208 => "0101110", 209 => "1101111", 210 => "0000110", 
    211 => "1110001", 212 => "0101001", 213 => "1001111", 214 => "1100111", 
    215 => "0001000", 216 => "1100111", 217 => "0010111", 218 => "0000000", 
    219 => "1100100", 220 => "1110110", 221 => "0011010", 222 => "1100101", 
    223 => "0100000", 224 to 225=> "0011001", 226 => "0010011", 227 => "1111000", 
    228 => "0100000", 229 => "1110101", 230 => "0000000", 231 => "1101001", 
    232 => "0011000", 233 => "0010110", 234 => "0011110", 235 => "0000100", 
    236 => "1101000", 237 to 238=> "1110101", 239 => "1101010", 240 => "0011100", 
    241 => "0000100", 242 => "1101110", 243 => "0001110", 244 => "1110110", 
    245 => "1101000", 246 => "0011001", 247 => "1101110", 248 => "1110101", 
    249 => "0001001", 250 => "1111000", 251 => "1110100", 252 => "1111001", 
    253 => "1111101", 254 => "1101000", 255 => "0001000", 256 => "1101100", 
    257 => "1111010", 258 => "1110100", 259 => "1101101", 260 => "0010111", 
    261 => "1001100", 262 => "0001010", 263 => "0010010", 264 => "0000001", 
    265 => "0011111", 266 => "0010000", 267 => "0010110", 268 => "0100001", 
    269 => "1111010", 270 => "0001000", 271 => "1101111", 272 => "0010011", 
    273 => "1111001", 274 => "1110001", 275 => "1101011", 276 => "0000010", 
    277 => "1101101", 278 => "0000100", 279 => "1110111", 280 => "0011001", 
    281 => "0011101", 282 => "0010110", 283 => "0010100", 284 => "1100110", 
    285 => "1101110", 286 => "1101010", 287 => "0000110", 288 => "0101000", 
    289 => "0011111", 290 => "0000110", 291 => "0000010", 292 => "0001101", 
    293 => "0000100", 294 => "1100100", 295 => "1100011", 296 => "1110001", 
    297 => "0010110", 298 => "1111101", 299 => "1110010", 300 => "1111100", 
    301 => "0000101", 302 => "0100001", 303 => "1101111", 304 => "0100011", 
    305 => "0011100", 306 => "1110101", 307 => "0010101", 308 => "0100010", 
    309 => "1111000", 310 => "0010101", 311 => "1101101", 312 => "1101111", 
    313 => "0010001", 314 => "0011000", 315 => "0010000", 316 => "1110010", 
    317 => "0001100", 318 => "0001011", 319 => "0010011", 320 => "0010111", 
    321 => "0000110", 322 => "1100111", 323 => "1101011", 324 => "0010100", 
    325 => "0100101", 326 => "0010011", 327 => "0100010", 328 => "1100101", 
    329 => "0011001", 330 => "0010110", 331 => "0001110", 332 => "1100011", 
    333 => "1111110", 334 => "1110101", 335 => "0011101", 336 => "0010001", 
    337 => "0000001", 338 => "1110011", 339 => "1100111", 340 => "0000101", 
    341 => "0001100", 342 => "1111010", 343 => "0000011", 344 => "0011101", 
    345 => "0011010", 346 => "0001100", 347 => "0001010", 348 => "1111101", 
    349 => "0001100", 350 => "1100110", 351 => "1100011", 352 => "0100010", 
    353 => "0011010", 354 => "1110011", 355 => "1111101", 356 => "1111011", 
    357 => "0011101", 358 => "1110011", 359 => "1111111", 360 => "1101110", 
    361 => "1110111", 362 => "0011100", 363 => "1100010", 364 => "1011111", 
    365 => "0001001", 366 => "0001010", 367 => "1111110", 368 => "1110101", 
    369 => "1100101", 370 => "0011111", 371 => "0010101", 372 => "0010000", 
    373 => "1011000", 374 => "1111001", 375 => "1111010", 376 => "0100010", 
    377 => "1111001", 378 => "1111110", 379 => "1101100", 380 => "0010011", 
    381 => "1101110", 382 => "1110101", 383 => "1111010", 384 => "0000011", 
    385 => "1100110", 386 => "0010010", 387 => "0000000", 388 => "0011101", 
    389 => "1111101", 390 => "1111110", 391 => "1101011", 392 => "1110001", 
    393 => "0011000", 394 => "0011101", 395 => "1110001", 396 => "0001111", 
    397 => "0001001", 398 => "0000000", 399 => "1101110", 400 => "1111100", 
    401 => "0000110", 402 => "0011111", 403 => "0011110", 404 => "1110100", 
    405 => "0000001", 406 => "0011000", 407 => "0011101", 408 => "1101111", 
    409 => "1100111", 410 => "0001001", 411 => "0001111", 412 => "0010001", 
    413 => "0011100", 414 => "1111101", 415 => "0011011", 416 => "0010111", 
    417 => "0010100", 418 => "1101111", 419 => "0010111", 420 => "0010101", 
    421 => "0010000", 422 => "0000111", 423 => "1111111", 424 => "0011100", 
    425 => "1110010", 426 => "1111011", 427 => "1101001", 428 => "0010000", 
    429 => "0001001", 430 => "0000000", 431 => "1101001", 432 => "0011010", 
    433 => "1101000", 434 => "0010111", 435 => "1111000", 436 => "0010110", 
    437 => "0001011", 438 => "0000000", 439 => "0001001", 440 => "1101010", 
    441 => "1111000", 442 => "1111110", 443 => "1111001", 444 => "0000101", 
    445 => "1110111", 446 => "0000100", 447 => "0000000", 448 => "0000111", 
    449 => "1100010", 450 => "1111010", 451 => "1110111", 452 => "0000010", 
    453 => "1110010", 454 => "0001110", 455 => "0000011", 456 => "1111011", 
    457 => "1110111", 458 => "0001100", 459 => "0001110", 460 => "1110111", 
    461 => "1111111", 462 => "0010010", 463 => "0001101", 464 => "1101001", 
    465 => "0010010", 466 => "0000111", 467 => "1100011", 468 => "0010001", 
    469 => "1100011", 470 => "0010011", 471 => "1100110", 472 => "1110001", 
    473 => "1100111", 474 => "0011100", 475 => "0010100", 476 => "1101011", 
    477 => "0001110", 478 => "1111000", 479 => "1101011", 480 => "0010001", 
    481 => "1111101", 482 => "1101101", 483 => "1110001", 484 => "1101100", 
    485 => "0010101", 486 => "1110110", 487 => "0011011", 488 => "1110100", 
    489 => "0011100", 490 => "0001100", 491 => "1110100", 492 => "1110000", 
    493 => "1100101", 494 => "1101011", 495 => "0011011", 496 => "0011110", 
    497 => "0001010", 498 => "1110100", 499 => "1111011", 500 => "1110000", 
    501 => "1110010", 502 => "1101010", 503 => "0001111", 504 => "0001101", 
    505 => "1101110", 506 to 507=> "1111111", 508 to 509=> "0000000", 510 => "0010001", 
    511 => "0001011" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity process_element_L3_conv2d_L3_Kernel_V_1_0 is
    generic (
        DataWidth : INTEGER := 7;
        AddressRange : INTEGER := 512;
        AddressWidth : INTEGER := 9);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of process_element_L3_conv2d_L3_Kernel_V_1_0 is
    component process_element_L3_conv2d_L3_Kernel_V_1_0_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    process_element_L3_conv2d_L3_Kernel_V_1_0_rom_U :  component process_element_L3_conv2d_L3_Kernel_V_1_0_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


