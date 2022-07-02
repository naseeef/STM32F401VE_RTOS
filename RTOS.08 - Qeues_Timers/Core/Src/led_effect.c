/*
 * led_effect.c
 *
 *  Created on: 01-Jul-2022
 *      Author: Naseef
 */

#include "main.h"

void led_effect_stop(void)
{
	for (int i=0; i<4; i++)
	{
		xTimerStop(led_timer[i],portMAX_DELAY);
	}
}

void led_effect(int n)
{
	switch (n)
	{
	led_effect_stop();
	xTimerStart(led_timer[n-1],portMAX_DELAY);
	}
}

void turn_off_leds()
{

}

void turn_on_leds()
{

}

void led_effect1(void)
{
	static int flag =1;
	(flag ^=1) ? turn_off_leds() : turn_on_leds();
}


