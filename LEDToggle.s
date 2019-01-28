.text
.globl main
main:
  # Main initializations
  lui s1, 0x7ff60 # assigns s1 with the LED base address
  
  addi s2,s2,0
    
  addi,a0,zero,1 # venus-specific code for console output
  # An infinite loop, almost needed in any embedded systems code
  while_1: # You might write some code here
    xori s2,s2,0xFF
    sw s2, 0(s1) # toggles the LEDs 
    	
    mv a1,s2 # venus-specific code for modifying the console output register
        
    li s3, 1500 # sets the counter to 1500
    delay: # delay routine with decrementor
      addi,s3,s3,-1
      bnez,s3,delay
    ecall
    j while_1
