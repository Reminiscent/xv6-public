	.text

/* Switch from current_thread to next_thread. Make next_thread
 * the current_thread, and set next_thread to 0.
 * Use eax as a temporary register; it is caller saved.
 */
	.globl thread_switch
thread_switch:
	/* YOUR CODE HERE */
	// save all eight x86 registers
	pushal
	// save current thread's stack pointer
	movl current_thread, %eax
	movl %esp, (%eax)

	// restore the next thread
	movl next_thread, %eax
	movl (%eax), %esp

	// restore all eight x86 registers
	popal

	// set the current_thread and next_thread
	movl next_thread, %eax
	movl %eax, current_thread
	movl $0, %eax
	movl %eax, next_thread
	ret				/* pop return address from stack */