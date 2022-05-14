-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity process_element_L3_conv2d_L3_Kernel_V_0_2_rom is 
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


architecture rtl of process_element_L3_conv2d_L3_Kernel_V_0_2_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011011", 1 => "0000011", 2 => "0010101", 3 => "1100001", 
    4 => "0001001", 5 => "0110010", 6 => "1100110", 7 => "1101100", 
    8 => "1111111", 9 => "0000101", 10 => "1111111", 11 => "0001110", 
    12 => "1111101", 13 => "1111001", 14 => "0000111", 15 => "1111101", 
    16 => "0001111", 17 => "0000000", 18 => "1110001", 19 => "0000010", 
    20 => "0010100", 21 => "1100010", 22 => "1101100", 23 => "0001010", 
    24 => "1111010", 25 => "0001111", 26 => "0010110", 27 => "1101010", 
    28 => "0010000", 29 => "1110111", 30 => "0010000", 31 => "1100110", 
    32 => "0000000", 33 => "0010101", 34 => "1111011", 35 => "1101111", 
    36 => "1100111", 37 => "0101101", 38 => "1111010", 39 => "1110001", 
    40 => "0001011", 41 => "1101100", 42 => "1100101", 43 => "0001101", 
    44 => "0000000", 45 => "1101010", 46 => "0000111", 47 => "1111101", 
    48 => "1111011", 49 => "0000111", 50 => "1111101", 51 => "0010110", 
    52 => "0001100", 53 => "1101010", 54 => "0010110", 55 => "1100101", 
    56 => "0001101", 57 => "1100111", 58 => "0010000", 59 => "0011100", 
    60 => "1110101", 61 => "0011100", 62 => "1111111", 63 => "0001010", 
    64 => "1110101", 65 => "0000110", 66 => "1100100", 67 => "0011000", 
    68 => "1111111", 69 => "0110110", 70 => "0001110", 71 => "1110001", 
    72 => "0000110", 73 => "1110101", 74 => "1101110", 75 => "0010010", 
    76 to 77=> "1111111", 78 => "1101000", 79 => "1101101", 80 => "1100000", 
    81 => "0000010", 82 => "1100111", 83 => "1101010", 84 => "0010000", 
    85 => "1101011", 86 => "0011010", 87 => "0000101", 88 => "0001001", 
    89 => "0010011", 90 => "1110011", 91 => "1111011", 92 => "0010111", 
    93 => "0100000", 94 => "1111101", 95 => "0000111", 96 => "1111100", 
    97 => "1111011", 98 => "1110110", 99 => "0011011", 100 => "1110111", 
    101 => "0000101", 102 => "0010011", 103 => "1111011", 104 => "0000110", 
    105 => "0011011", 106 => "0010000", 107 => "1111100", 108 => "0010010", 
    109 => "0010111", 110 => "0011101", 111 => "0001100", 112 => "1101100", 
    113 => "1111010", 114 => "1110101", 115 => "1111101", 116 => "0000011", 
    117 => "0010101", 118 => "0001011", 119 => "0000101", 120 => "1110011", 
    121 => "1101011", 122 => "0001000", 123 => "0010010", 124 => "1101010", 
    125 => "0010010", 126 => "0011001", 127 => "0000001", 128 => "0011001", 
    129 => "1110100", 130 => "1110101", 131 => "0011100", 132 => "1110011", 
    133 => "0101111", 134 => "0010000", 135 => "1111110", 136 => "1111001", 
    137 => "0001001", 138 => "0010111", 139 => "1110001", 140 => "0001001", 
    141 => "0000011", 142 => "0011011", 143 => "1100110", 144 => "1111010", 
    145 => "0000011", 146 => "1101100", 147 => "0011100", 148 => "0000001", 
    149 => "0010011", 150 => "0000111", 151 => "1101100", 152 => "1111010", 
    153 => "1110111", 154 => "1101110", 155 => "1101011", 156 to 157=> "0011110", 
    158 => "1111101", 159 => "1101011", 160 => "1100101", 161 => "1101100", 
    162 => "0001101", 163 => "1101101", 164 => "0000110", 165 => "1110010", 
    166 => "0000111", 167 => "0010110", 168 => "1110011", 169 => "1111000", 
    170 => "1101101", 171 => "0100010", 172 => "0100011", 173 => "1110001", 
    174 => "0011100", 175 => "0000000", 176 => "0010010", 177 => "1110011", 
    178 => "0000000", 179 => "0010100", 180 => "0110100", 181 => "1000100", 
    182 => "0001010", 183 => "1101101", 184 => "0100101", 185 => "0101010", 
    186 => "0011011", 187 => "1111101", 188 => "1111001", 189 => "0000011", 
    190 => "0000001", 191 => "0101001", 192 => "0001010", 193 => "1111110", 
    194 => "0001011", 195 => "1100111", 196 => "1110101", 197 => "0011111", 
    198 => "1110111", 199 => "0011110", 200 => "0010011", 201 => "0000000", 
    202 => "1111010", 203 => "1111101", 204 => "0010010", 205 => "0010101", 
    206 => "0000011", 207 => "0010111", 208 => "0100110", 209 => "1101111", 
    210 => "1101101", 211 => "1101001", 212 => "0010011", 213 => "0101101", 
    214 => "0011110", 215 => "0011010", 216 => "0000011", 217 => "0001000", 
    218 => "0001111", 219 => "1101000", 220 => "0011101", 221 => "0010110", 
    222 => "0100001", 223 => "1111110", 224 => "0010000", 225 => "0000011", 
    226 => "0011011", 227 => "0011110", 228 => "0100001", 229 => "1110110", 
    230 => "0001011", 231 => "1101011", 232 => "0011100", 233 => "0001110", 
    234 => "0011100", 235 => "0001111", 236 => "1110110", 237 => "1100011", 
    238 => "1101101", 239 => "1111010", 240 => "0011001", 241 => "0011000", 
    242 => "0010010", 243 => "0010101", 244 => "0010001", 245 => "0010010", 
    246 => "0011100", 247 => "0010000", 248 => "0001001", 249 => "0010011", 
    250 => "1100100", 251 => "0010101", 252 => "1110010", 253 => "1100101", 
    254 => "1100110", 255 => "0001011", 256 => "1100111", 257 => "0000000", 
    258 => "0010100", 259 => "0011110", 260 => "0000110", 261 => "0100100", 
    262 => "0011000", 263 => "1110111", 264 => "0000000", 265 => "1100101", 
    266 => "1101000", 267 => "1111111", 268 => "0010100", 269 => "1111101", 
    270 => "0100110", 271 => "1110011", 272 => "1100110", 273 => "1101110", 
    274 => "1111000", 275 => "1111011", 276 => "0011100", 277 => "1111111", 
    278 => "1101001", 279 => "0000000", 280 => "1100110", 281 => "0011110", 
    282 => "1101011", 283 => "0010111", 284 => "1101100", 285 => "1111001", 
    286 => "0011000", 287 => "0000000", 288 => "0001101", 289 => "1111011", 
    290 => "0010111", 291 => "1101010", 292 => "1110110", 293 => "0100100", 
    294 => "0000111", 295 => "0011000", 296 => "0000100", 297 => "0001010", 
    298 => "1111111", 299 => "0100010", 300 => "0000111", 301 => "1110101", 
    302 => "0011001", 303 => "0000010", 304 => "0000101", 305 => "1101000", 
    306 => "1110001", 307 => "0001100", 308 => "1110110", 309 => "0000010", 
    310 => "0010101", 311 => "0011100", 312 => "0010100", 313 => "0000101", 
    314 => "0000100", 315 => "1101101", 316 => "1110000", 317 => "0010101", 
    318 => "1111000", 319 => "1111100", 320 => "0100111", 321 => "0001111", 
    322 => "1101110", 323 => "1111000", 324 => "0010100", 325 => "1100001", 
    326 => "0001111", 327 => "1111110", 328 => "0011010", 329 => "1110100", 
    330 => "0010001", 331 => "1111000", 332 => "1101101", 333 => "1110001", 
    334 => "1111101", 335 => "1111010", 336 => "0000100", 337 => "1110001", 
    338 => "0010101", 339 => "0001000", 340 => "1111111", 341 => "0000001", 
    342 => "0010101", 343 => "0001011", 344 => "0011011", 345 => "1101010", 
    346 => "1100011", 347 => "1111101", 348 => "0001101", 349 => "1110101", 
    350 => "1110000", 351 => "1101111", 352 => "0010011", 353 => "1111100", 
    354 => "1101010", 355 => "1110001", 356 => "0011100", 357 => "1100110", 
    358 => "0000111", 359 => "0000000", 360 => "0001001", 361 => "0011001", 
    362 => "0011110", 363 => "1101001", 364 => "1110101", 365 => "1111011", 
    366 => "1110000", 367 => "0010101", 368 => "0001000", 369 => "1100100", 
    370 => "0000110", 371 => "0000000", 372 => "0001000", 373 => "1111001", 
    374 => "1110111", 375 => "0011000", 376 => "1111011", 377 => "0010110", 
    378 => "1100111", 379 => "0000100", 380 => "1110101", 381 => "0000101", 
    382 => "1111111", 383 => "0000000", 384 => "0011000", 385 => "0011001", 
    386 => "1101010", 387 => "1110010", 388 => "0000011", 389 => "1111000", 
    390 => "0000010", 391 => "0001010", 392 => "1111011", 393 => "0001111", 
    394 => "1101110", 395 => "1100001", 396 => "1101111", 397 => "1110110", 
    398 => "1100111", 399 => "1100110", 400 to 401=> "0000111", 402 => "0000100", 
    403 => "0010010", 404 => "0011100", 405 => "0000111", 406 => "1101010", 
    407 => "1100101", 408 => "1101000", 409 => "1101010", 410 => "1110001", 
    411 => "1111001", 412 => "0001110", 413 => "0100000", 414 => "1111101", 
    415 => "0011101", 416 => "0000111", 417 => "1111100", 418 => "1111001", 
    419 => "0000000", 420 => "0000100", 421 => "1011110", 422 => "0001001", 
    423 => "0010010", 424 => "0000000", 425 => "0011000", 426 => "1111100", 
    427 => "0010101", 428 => "0100011", 429 => "0100100", 430 => "1110111", 
    431 => "0001000", 432 => "1111000", 433 => "1111110", 434 => "0011010", 
    435 => "1111101", 436 => "0011001", 437 => "1100111", 438 => "0000110", 
    439 => "0010010", 440 => "0000101", 441 => "0011110", 442 => "0000000", 
    443 => "0000001", 444 => "1101011", 445 => "0001010", 446 => "0001001", 
    447 => "0010001", 448 => "0000101", 449 => "1110000", 450 => "0011100", 
    451 => "0010011", 452 => "1101000", 453 => "1100011", 454 => "1110100", 
    455 => "1110000", 456 => "0001010", 457 => "0001100", 458 => "1101110", 
    459 => "0000111", 460 => "0010001", 461 => "1111100", 462 => "0001011", 
    463 => "1110000", 464 => "0010001", 465 => "0010000", 466 => "1111111", 
    467 => "0010001", 468 => "0000001", 469 => "1100101", 470 => "0011011", 
    471 => "0011010", 472 => "0001011", 473 => "0000001", 474 => "0010011", 
    475 => "0010101", 476 => "0010100", 477 => "1110010", 478 => "1111010", 
    479 => "0011000", 480 => "0010000", 481 => "0010111", 482 => "0011001", 
    483 => "1111100", 484 => "1101011", 485 => "1101110", 486 => "1100111", 
    487 => "0001000", 488 => "1111011", 489 => "0010111", 490 => "0011101", 
    491 => "1110011", 492 => "1101001", 493 => "0011100", 494 => "1101000", 
    495 => "0001000", 496 => "0011011", 497 => "0000001", 498 => "0000011", 
    499 => "0001000", 500 => "0011110", 501 => "1110110", 502 => "0001010", 
    503 => "0001011", 504 => "1110110", 505 => "1111011", 506 => "1101000", 
    507 => "0011100", 508 => "0100111", 509 => "0000011", 510 => "0001000", 
    511 => "1101000" );


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

entity process_element_L3_conv2d_L3_Kernel_V_0_2 is
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

architecture arch of process_element_L3_conv2d_L3_Kernel_V_0_2 is
    component process_element_L3_conv2d_L3_Kernel_V_0_2_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    process_element_L3_conv2d_L3_Kernel_V_0_2_rom_U :  component process_element_L3_conv2d_L3_Kernel_V_0_2_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


