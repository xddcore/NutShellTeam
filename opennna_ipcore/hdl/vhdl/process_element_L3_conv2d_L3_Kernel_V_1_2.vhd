-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity process_element_L3_conv2d_L3_Kernel_V_1_2_rom is 
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


architecture rtl of process_element_L3_conv2d_L3_Kernel_V_1_2_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0001100", 1 => "0001001", 2 => "1111110", 3 => "0010011", 
    4 => "1100000", 5 => "0101111", 6 => "0011100", 7 => "0011011", 
    8 => "1100111", 9 => "1100010", 10 => "1110010", 11 => "1110111", 
    12 => "0100101", 13 => "1110011", 14 => "1100010", 15 => "1110010", 
    16 => "1111001", 17 => "1110011", 18 => "1111111", 19 => "0001111", 
    20 => "0010000", 21 => "1010101", 22 => "0011000", 23 => "1101001", 
    24 => "0001001", 25 => "1100101", 26 => "1101000", 27 => "1111100", 
    28 => "1111010", 29 => "1110100", 30 => "0000100", 31 => "1101111", 
    32 => "0011100", 33 => "1110101", 34 => "1101001", 35 => "0000011", 
    36 => "1111101", 37 => "1101010", 38 => "0011010", 39 => "1111101", 
    40 => "0010110", 41 => "0010001", 42 => "0000000", 43 => "0011100", 
    44 => "1110001", 45 => "1100100", 46 => "0001100", 47 => "0010011", 
    48 => "0100011", 49 => "1111011", 50 => "1101010", 51 => "0010001", 
    52 => "1101101", 53 => "0011001", 54 => "0000110", 55 => "1110100", 
    56 => "0001101", 57 => "0001111", 58 => "0000111", 59 => "1100010", 
    60 => "1100110", 61 to 62=> "1111001", 63 => "0001111", 64 => "1011101", 
    65 => "1110111", 66 => "0000010", 67 => "0000011", 68 => "1110000", 
    69 => "1111001", 70 => "0001100", 71 => "1110010", 72 => "0001011", 
    73 => "0010110", 74 => "0000110", 75 => "0011100", 76 => "1110000", 
    77 => "0010001", 78 => "1101111", 79 => "0010100", 80 => "0011100", 
    81 => "1101101", 82 => "1100100", 83 => "0000101", 84 => "0011110", 
    85 => "1101011", 86 => "0000101", 87 to 88=> "1110001", 89 => "0010111", 
    90 => "0011101", 91 => "0001001", 92 => "0010111", 93 => "1110111", 
    94 => "0000100", 95 => "1111011", 96 => "0000111", 97 => "1100111", 
    98 => "1111110", 99 => "0000111", 100 => "0011111", 101 => "1010000", 
    102 => "0000101", 103 => "1101011", 104 => "0011100", 105 => "1100111", 
    106 => "1100100", 107 => "1110111", 108 => "1101010", 109 => "0010011", 
    110 => "0011100", 111 => "1100100", 112 => "0000111", 113 => "1111100", 
    114 => "1101011", 115 => "0001001", 116 => "0011000", 117 => "0011110", 
    118 => "1111010", 119 => "0000101", 120 => "0011011", 121 => "1111001", 
    122 => "0010010", 123 => "0011111", 124 => "1110010", 125 => "0000100", 
    126 => "0100000", 127 => "1101011", 128 => "0010011", 129 => "0001001", 
    130 => "1111010", 131 => "1100110", 132 => "0010111", 133 => "0011110", 
    134 => "0011010", 135 => "1110101", 136 => "0010000", 137 => "1110010", 
    138 => "0001111", 139 => "0010010", 140 => "0000011", 141 => "1110011", 
    142 => "0010001", 143 => "0010110", 144 => "0011010", 145 => "0000000", 
    146 => "1110111", 147 => "0010001", 148 => "0001010", 149 => "0010001", 
    150 => "0010000", 151 => "1110101", 152 => "0001101", 153 => "1110110", 
    154 => "1100100", 155 => "0001110", 156 => "1110101", 157 => "1100111", 
    158 => "1100011", 159 => "0011111", 160 => "1110100", 161 => "1111101", 
    162 => "0000111", 163 => "0000000", 164 => "0101000", 165 => "1111110", 
    166 => "1100101", 167 => "1011101", 168 => "0011111", 169 => "1110001", 
    170 => "0001110", 171 => "0100000", 172 => "0010111", 173 => "0010101", 
    174 => "0001110", 175 => "0011100", 176 => "0110001", 177 => "0000011", 
    178 => "0001011", 179 => "1111011", 180 => "0011000", 181 => "0001001", 
    182 => "1101100", 183 => "0101110", 184 => "1101110", 185 => "0011011", 
    186 => "1110011", 187 => "0001010", 188 => "0001000", 189 => "0010000", 
    190 => "1110000", 191 => "1110101", 192 => "0000010", 193 => "1101110", 
    194 => "0010110", 195 => "0001101", 196 => "1101100", 197 => "0001010", 
    198 => "1110000", 199 => "0011000", 200 => "1100000", 201 => "0001111", 
    202 => "1110100", 203 => "1111011", 204 => "0000111", 205 => "0010101", 
    206 => "1100110", 207 => "1111100", 208 => "1110000", 209 => "1101111", 
    210 => "0010100", 211 => "0011000", 212 => "1101010", 213 => "1111011", 
    214 => "1110110", 215 => "1111000", 216 => "1110101", 217 => "1111101", 
    218 => "0001000", 219 => "1101101", 220 => "1110010", 221 => "0000100", 
    222 => "0000110", 223 => "1111001", 224 => "0100000", 225 => "0011010", 
    226 => "0010110", 227 => "1111101", 228 => "0000000", 229 to 230=> "0000101", 
    231 => "1101010", 232 => "1100111", 233 => "0000111", 234 => "0011011", 
    235 => "1101110", 236 => "0010000", 237 => "1111011", 238 => "0010000", 
    239 => "0001111", 240 => "1101010", 241 => "0010101", 242 => "0011011", 
    243 => "1110001", 244 => "0000010", 245 => "0000000", 246 => "0010001", 
    247 => "1101110", 248 => "1101001", 249 => "0000100", 250 => "0010001", 
    251 => "1101111", 252 => "0000010", 253 => "0001111", 254 => "0011100", 
    255 => "1100100", 256 => "1101111", 257 => "1101011", 258 => "0010011", 
    259 => "0011111", 260 => "0001011", 261 => "0100010", 262 => "0000011", 
    263 => "0101000", 264 => "0000011", 265 => "0011101", 266 => "1110001", 
    267 => "0011010", 268 => "0010100", 269 => "1110111", 270 => "0011111", 
    271 => "1101111", 272 => "0001001", 273 => "1110101", 274 => "1111111", 
    275 => "0010110", 276 => "1111110", 277 => "0011000", 278 => "0001001", 
    279 => "0000010", 280 => "1100110", 281 => "0011001", 282 => "1100010", 
    283 => "1100100", 284 to 285=> "1100010", 286 => "1101000", 287 => "0011011", 
    288 => "1111000", 289 => "0001100", 290 => "0010010", 291 => "0011001", 
    292 => "1100111", 293 => "0100111", 294 => "0000111", 295 => "0001101", 
    296 => "0000011", 297 => "1100010", 298 => "1100001", 299 => "0100101", 
    300 => "1110100", 301 => "0011011", 302 => "1110101", 303 => "0000110", 
    304 to 305=> "1101000", 306 => "1110001", 307 => "1101100", 308 => "1110010", 
    309 => "0101011", 310 => "1111000", 311 => "1110101", 312 => "0010010", 
    313 => "0010001", 314 => "1100001", 315 => "1111000", 316 => "1101001", 
    317 => "1110111", 318 => "0010100", 319 => "0011011", 320 => "0100010", 
    321 => "0000010", 322 => "1110100", 323 => "1110001", 324 => "1111110", 
    325 => "0000100", 326 => "1110100", 327 => "1101011", 328 => "0100010", 
    329 to 330=> "0001100", 331 => "1100100", 332 => "1110001", 333 => "1110101", 
    334 => "1101100", 335 => "1101110", 336 => "1100110", 337 => "0001111", 
    338 => "0000011", 339 => "0010001", 340 => "1111011", 341 => "0100001", 
    342 => "0010000", 343 => "0010010", 344 => "1100110", 345 => "1110101", 
    346 => "0001111", 347 => "1110100", 348 => "1100100", 349 => "1100010", 
    350 => "1110101", 351 => "1110001", 352 => "0001011", 353 => "1111110", 
    354 => "0010111", 355 => "0000001", 356 => "0000000", 357 => "0101010", 
    358 => "1111101", 359 => "0011001", 360 => "1110110", 361 => "1111011", 
    362 => "0001100", 363 => "1101010", 364 => "1100101", 365 => "1101001", 
    366 => "1110011", 367 => "1110001", 368 => "0001111", 369 => "0000100", 
    370 => "1110010", 371 => "1101011", 372 => "0011000", 373 => "0010110", 
    374 => "1101101", 375 => "1100101", 376 => "0001010", 377 => "0010111", 
    378 => "0010010", 379 => "0000000", 380 => "0001011", 381 => "0001010", 
    382 => "1101100", 383 => "1100010", 384 => "0011101", 385 => "0000011", 
    386 => "1101111", 387 => "0001000", 388 => "1110111", 389 => "0011000", 
    390 => "0011001", 391 => "0001000", 392 => "1110101", 393 => "1111010", 
    394 => "0000001", 395 => "0000110", 396 => "1101111", 397 => "1100100", 
    398 => "1110000", 399 => "0001110", 400 => "1110010", 401 => "1100011", 
    402 => "1111110", 403 => "1101110", 404 => "0010111", 405 => "1110010", 
    406 => "0010101", 407 => "1101111", 408 => "0001100", 409 => "1101010", 
    410 => "1110110", 411 => "0011010", 412 => "1111000", 413 => "1100110", 
    414 => "0011011", 415 => "1101001", 416 => "1110011", 417 => "0010001", 
    418 => "0001010", 419 to 420=> "1111010", 421 => "1001111", 422 => "0011001", 
    423 => "1111111", 424 => "1110000", 425 => "0001010", 426 => "0010000", 
    427 => "1110011", 428 => "0001011", 429 => "1101110", 430 => "1111000", 
    431 => "0000011", 432 => "1101001", 433 => "1110100", 434 => "0001101", 
    435 => "1101101", 436 => "1111100", 437 => "0001011", 438 => "1100011", 
    439 => "0000111", 440 => "1111000", 441 => "0001111", 442 => "1111011", 
    443 => "0001000", 444 => "1101100", 445 => "1100011", 446 => "0011111", 
    447 => "0000101", 448 => "1111001", 449 => "0000000", 450 => "1101010", 
    451 => "0001111", 452 => "0001101", 453 => "1111101", 454 => "0010111", 
    455 => "1110010", 456 => "1101001", 457 => "1110111", 458 => "1100111", 
    459 => "1111010", 460 => "0000011", 461 => "0000100", 462 => "1110111", 
    463 => "0011001", 464 => "0001010", 465 => "1111001", 466 => "1111011", 
    467 => "1111110", 468 => "1110000", 469 => "0000000", 470 => "1101010", 
    471 => "0001001", 472 => "1101100", 473 => "1111101", 474 => "1101000", 
    475 => "0010110", 476 => "1111001", 477 => "1111101", 478 => "0011000", 
    479 => "1101010", 480 => "0001100", 481 => "1111100", 482 => "1100110", 
    483 => "1111000", 484 => "0010110", 485 => "0000111", 486 => "1110111", 
    487 => "0001011", 488 => "0001111", 489 => "0000011", 490 => "0011010", 
    491 => "1101011", 492 => "1110100", 493 => "1101011", 494 => "0011001", 
    495 => "0010010", 496 => "0101110", 497 => "1101010", 498 => "1101111", 
    499 => "0000100", 500 => "0001101", 501 => "0000111", 502 => "1110110", 
    503 => "1101010", 504 => "0000011", 505 => "0101000", 506 => "0011001", 
    507 => "1101110", 508 => "0010000", 509 => "0001001", 510 => "0000101", 
    511 => "0000110" );


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

entity process_element_L3_conv2d_L3_Kernel_V_1_2 is
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

architecture arch of process_element_L3_conv2d_L3_Kernel_V_1_2 is
    component process_element_L3_conv2d_L3_Kernel_V_1_2_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    process_element_L3_conv2d_L3_Kernel_V_1_2_rom_U :  component process_element_L3_conv2d_L3_Kernel_V_1_2_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


