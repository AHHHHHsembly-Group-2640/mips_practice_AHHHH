#Name: Remi Ong
#Date: 3/27/2023
#Program: Program 1 


#   Task 1: User Input and Output
#   In this task, you will practice getting user input, moving them to registers, and printing them back to the user. Below are the specific requirements for this task:
#       A. Use "main: " label for this task
#       B. Get 2 int values from the user
#       C. The two user values should be held in registers $s0 and $s1, respectively
#       D. Output the user inputs in the "Run I/O" section in MARS environment back to the user

.data
    #create variables here?
    prompt: .asciiz "Please enter an integer: "

.text
    main:
    	li $v0, 4         #output string in a0
    	la $a0, prompt 	  #load string from data into a0
    	syscall           #Execute

    	li $v0, 5         #read user input form console
    	syscall           #execute

    	move $s0, $v0	  # move user input from v0 to s0 new register

    	li $v0, 1	  #print out what whatevers in a0 same as before but with a integer this time
    	move $a0, $s0    #move the value in s0 (which is user input) into a0
    	syscall		  #execute
    	
    	li $v0, 4         #output string in a0
    	la $a0, prompt 	  #load string from data into a0
    	syscall           #Execute

    	li $v0, 5         #read user input form console
    	syscall           #execute

    	move $s1, $v0	  # move user input from v0 to s0 new register

    	li $v0, 1	  #print out what whatevers in a0 same as before but with a integer this time
    	move $a0, $s1    #move the value in s1 (which is user input) into a0
    	syscall		  #execute
    
    	li $v0, 10	#exit program
	    syscall 	#execute


#   Task 2: Arithmetic Operation Practice
#   Using the user input values in registers $s0 and $s1, write MIPS Assembly code to complete the arithmetic operations below:
#       A. add two values (use instruction "add")
#       B. subtract two values (use instruction "sub")
#       C. multiply two values (use instruction "mul")
#       D. divide two values (use instruction "div")
#       E. Output the arithmetic results in the "Run I/O" section in MARS environment back to the user 

.text 
.globl main 
	main:
    		# user input
    		li $v0, 5      
    		syscall        
    		move $s0, $v0  
    		syscall        
    		move $s1, $v0  

    		# arithmetic operations
    		add $t0, $s0, $s1  
    		sub $t1, $s0, $s1 
    		mul $t2, $s0, $s1  
    		div $t3, $s0, $s1  

  		# output 
    		li $v0, 1      
    		move $a0, $t0  
    		syscall       
   		 move $a0, $t1 
    		syscall       
    		move $a0, $t2  
    		syscall       
    		move $a0, $t3  
    		syscall        

    		# exit 
    		li $v0, 10     
    		syscall



#   Task 3: Conditions
#   In this final task, you will practice how to do conditions in Assembly:
#       A. If the two user inputs from Task 1 are equal to each other, output "User inputs are the same"
#       B. If the two user inputs from Task 1 are not equal to each other, output "User inputs are different"
