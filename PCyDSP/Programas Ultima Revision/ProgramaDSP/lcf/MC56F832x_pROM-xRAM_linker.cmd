



# ----------------------------------------------------

# Metrowerks sample code

# linker command file for DSP56832x EVM
# using 
#    flash pROM
#    flash xROM 
#    internal xRAM 
#    Small Data Model (SDM) or Large Data Model (LDM)

# ----------------------------------------------------



# see end of file for additional notes & revision history
# see Motorola docs for specific EVM memory map



# memory use for this LCF: 
# interrupt vectors --> flash pROM starting at zero
#      program code --> flash pROM
#         constants --> flash xROM 
#      dynamic data --> flash pROM (copied to xRAM with init) 



# CodeWarrior preference settings:


#  for SDM
# ----------------------------------
#   M56800E Processor:
#     Small Program Model: OFF
#        Large Data Model: OFF
#
#   M56800E Assembler:
#        Default Data Memory Model: 16-bit
#     Default Program Memory Model: 19-bit
#
#
#   M56800E Target pref panel:
#     config file: 56832x_flash.cfg (322 or 322) 


#  for LDM
# ----------------------------------
#   M56800E Processor:
#     Small Program Model: OFF
#        Large Data Model: ON
#
#   M56800E Assembler:
#        Default Data Memory Model: 24-bit
#     Default Program Memory Model: 19-bit
#
#
#   M56800E Target pref panel:
#     config file: 56832x_flash.cfg (322 or 322)



# NOTE: 56832x has no EMI

 
 
# x memory above 7FFF not available with SDM
# this LCF can be used for both SDM and LDM
# see below for memory notes


MEMORY 
{
    .p_interrupts_flash_ROM (RX)  : ORIGIN = 0x0000,   LENGTH = 0x00A4   # reserved for 5682x interrupts
    .p_flash_ROM            (RX)  : ORIGIN = 0x00A4,   LENGTH = 0x3F5C   # pROM is 16K words total
 
     # p_flash_ROM_data mirrors x_internal_RAM, mapping to origin and length
     # the "X" flag in "RX" tells the debugger flash p-memory.
     # the p-memory flash is directed to the address determined by AT
     # in the data_in_p_flash_ROM section definition  
     
    .p_flash_ROM_data       (RWX) : ORIGIN = 0x0001,   LENGTH = 0x0FFF # internal xRAM mirror

#   .p_reserved_1                 : ORIGIN = 0x4000,   LENGTH = 0x1C000   
    .p_boot_flash_ROM       (RX)  : ORIGIN = 0x20000,  LENGTH = 0x0800   # 4K words
    .p_loader_flash_ROM     (RX)  : ORIGIN = 0x20800,  LENGTH = 0x0800   # 4K words
#   .p_reserved_2                 : ORIGIN = 0x21000,  LENGTH = 0xE800   # 58K words   
    .p_internal_RAM         (RWX) : ORIGIN = 0x2F800,  LENGTH = 0x0800   # 2K words   
#   .p_reserved_3                 : ORIGIN = 0x30000,  LENGTH = 0x0000    
    .x_internal_RAM         (RW)  : ORIGIN = 0x0001,   LENGTH = 0x0FFF   # 4K x 16
    .x_flash_ROM            (RW)  : ORIGIN = 0x1000,   LENGTH = 0x1000   # 4K x 16
#   .x_reserved_1                 : ORIGIN = 0x2000,   LENGTH = 0xD000    
    .x_onchip_peripherals   (RW)  : ORIGIN = 0xF000,   LENGTH = 0x1000   # n/a w/SDM
#   .x_reserved_2                 : ORIGIN = 0x010000, LENGTH = 0xFEFF00 # n/a 
    .x_EOnCE                (RW)  : ORIGIN = 0xFFFF00, LENGTH = 0x0000   # n/a w/SDM
}






# we ensure the interrupt vector section is not deadstripped here
# the label "interrupt_vectors" comes from file 568323_vector.asm

KEEP_SECTION{ interrupt_vectors.text}





SECTIONS 
{
    .interrupt_code :
    {
        * (interrupt_vectors.text)
       
    } > .p_interrupts_flash_ROM
    
	
	
    .boot_code :
    {
        * (startup.text)
        * (utility.text)
       
    } > .p_boot_flash_ROM
	                     
  
    .loader_code :
    {
        * (loader.text)
               
    } > .p_loader_flash_ROM

    
	.executing_code :
	{
		# .text sections
		    
		* (interrupt_routines.text)
		* (rtlib.text)
		* (fp_engine.text)
		* (.text)		
		* (user.text)	
		
        * (.const.data.pmem)
		
		# save address where for the data start in pROM
		 
        . = ALIGN(2);
 	    __pROM_data_start = .;  
 	    
	} > .p_flash_ROM


     
     
     
     
    .data_in_xROM : 
	{                      
	                   	
        # constant data is placed in x flash ROM

        * (.const.data.char)   # used if "Emit Separate Char Data Section" enabled
        * (.const.data) 
        
	} > .x_flash_ROM	 

    



# AT sets the download address
# the download stashes the data just after the program code
# as determined by our saved pROM data start variable

	.data_in_p_flash_ROM : AT(__pROM_data_start) 
	{                             
	    # the data sections flashed to pROM
	    # save data start so we can copy data later to xRAM
	    
 	    __xRAM_data_start = .; 
 	    
 	    
        * (.data.char)  # used if "Emit Separate Char Data Section"    
        * (.data)	    
	    * (fp_state.data)
		* (rtlib.data)
 	    
 	    
 	    # save data end and calculate data block size
 	    
 	    . = ALIGN(2);       # ensure _data_size is word-aligned
 	                        # since rom-to-ram copy is by word
 	                        # and we could have odd-number bytes
 	                        # in .data section since 56800E 
 	                        # has byte addressing
 	                        
		__xRAM_data_end = .;
		__data_size = __xRAM_data_end - __xRAM_data_start;


	} > .p_flash_ROM_data	 # this section is designated as p-memory 
	                         # with X flag in the memory map
	                         # the start address and length map to 
	                         # actual internal xRAM
	
	
		
		
		
	.data : 
	{                             

        # save space for the pROM data copy 
        
        . = __data_size +1 ;

		        
        # .bss sections
        
		. = ALIGN(2);        
        * (rtlib.bss.lo)
        * (rtlib.bss)
        
        . = ALIGN(2);
        __bss_addr = .;
        * (.bss.char)         # used if "Emit Separate Char Data Section" enabled
        * (.bss)
        __bss_end   = .;

		__bss_size = __bss_end - __bss_addr;



        # setup the heap address 
        
        . = ALIGN(4);
        __heap_addr = .;
        __heap_size = 0x100;
        __heap_end  = __heap_addr + __heap_size; 
        . = __heap_end;



        # setup the stack address 
        
        _min_stack_size = 0x200;
        _stack_addr = __heap_end + 2;
        _stack_end  = _stack_addr + _min_stack_size;
        . = _stack_end;
        
        
        
        # used by MSL 
            
        F_heap_addr   = __heap_addr;
        F_heap_end    = __heap_end;
        
     
        
	# stationery init code uses these globals:

        F_Lstack_addr   = _stack_addr;
        
        # rom-to-ram utility
		F_Ldata_size     = __data_size;
		F_Ldata_RAM_addr = __xRAM_data_start;
		F_Ldata_ROM_addr = __pROM_data_start;
		
        F_xROM_to_xRAM   = 0x0000;
        F_pROM_to_xRAM   = 0x0001; 	# true
               
	 	# zeroBSS utility
        F_Lbss_addr   = __bss_addr;
        F_Lbss_size   = __bss_size;
 	
	} > .x_internal_RAM	 	                    	
}



# -------------------------------------------------------
# additional notes:


# about the reserved sections:

# p_interrupts_RAM -- reserved in internal pRAM
# memory space reserved for interrupt vectors
# interrupt vectors must start at address zero




# about the memory map:

# SMM xRAM limit is 0x7FFF





# about LCF conventions:

# program memory (p memory)
# (RWX) read/write/execute for pRAM
# (RX) read/execute for flashed pROM

# data memory (X memory)
# (RW) read/write for xRAM
# (R)  read for data flashed xROM or reserved x memory

# LENGTH = next start address - previous
# LENGTH = 0x0000 means use all remaing memory




# about ROM-to-RAM copying at init time:

# In embedded programming, it is common for a portion of 
# a program resident in ROM to be copied into RAM at runtime.
# For starters, program variables cannot be accessed until 
# they are copied to RAM. 

# To indicate data or code that is meant to be copied 
# from ROM to RAM,the data or code is given two addresses.

# One address is the resident location in ROM (defined by 
# the linker command file). The other is the intended
# location in RAM (defined in C code where we will 
# do the actual copying).

# To create a section with the resident location in ROM 
# and an intended location in RAM, you define the two addresses 
# in the linker command file.

# Use the MEMORY segment to specify the intended RAM location,
# and the AT(address)parameter to specify the resident ROM address.




# revision history

# 011226 R1.0  c.m. first version
# 020220 R1.1  a.h. updates
# 020308 R1.1  a.h. 56838E
# 021101 R2.0  a.h. R2.0 prep
# 021204 R2.01 a.h. bss align by 1
# 030222 R2.1  a.h. 56835E/36E
# 030525 R6.0  a.h. 568323
# 030630 R6.0  a.h. generalized for SDM/LDM
# 030814 R6.0  a.h. align(1) for data


# -- end -- 
