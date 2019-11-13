/*
 * mainc.c
 *
 *  Created on: Nov 7, 2019
 *      Author: LOCHE Jeremy
 */
#include <stdio.h> //std lib
#include <stdlib.h>
#include <stdint.h> //usefull uint32_t etc types
#include <unistd.h> //linux headers
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/time.h> //usleep and sleep

//Specific Header for Cyclone 5 SOC
#define soc_cv_av

#include "hwlib.h"
#include "soc_cv_av/socal/socal.h" //alt read and write functions
#include "soc_cv_av/socal/hps.h"
#include "hps_soc_system.h"


#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )


void *led_pio_base;

int main(int argc,char **argv)
{
	printf("Hello World HPS\n");

	void *virtual_base;
	int fd;

	// map the address space for the LED registers into user space so we can interact with them.
	// we'll actually map in the entire CSR span of the HPS since we want to access various registers within that span

	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}

	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );

	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return( 1 );
	}

	//Map the virtual address to the real address of the LED PIO.
	led_pio_base= virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + LED_PIO_BASE ) & ( unsigned long)( HW_REGS_MASK ) );

	uint8_t led_sel=0;
	uint32_t led_mask=0;
	while(1)
	{
		//Calculate the LED animation
		led_sel=(led_sel+1) % LED_PIO_DATA_WIDTH;
		led_mask = (1<<led_sel);

		//Write the 32 bit register of the LED PIO
		alt_write_word(led_pio_base,led_mask);

		//Small delay for the animation.
		usleep(200*1000);

	}

	return 0;
}


