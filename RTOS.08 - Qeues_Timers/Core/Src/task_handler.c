/*
 * task_handler.c
 *
 *  Created on: 01-Jul-2022
 *      Author: Naseef
 */


#include "main.h"

int extract_command(command_t *cmd) ;
void process_command(command_t *cmd);

const char *msg_inv = "Invalid Entry\n";

void menu_task(void* parameters)
{

	uint32_t cmd_addr;
	command_t* cmd;
	int option;

	const char* msg_menu = 	   "===========================\n"
							   "|           MENU           \n"
							   "===========================\n"
									"LED EFFECT 	---->0/n"
									"DATE & TIME 	---->1/n"
									"EXIT 			---->2/n"
									"ENTER YOUR CHOICE:   /n";
		while (1)
		{
			xQueueSend(q_print,&msg_menu,portMAX_DELAY);

			//wait for menu commands
			xTaskNotifyWait(0,0,&cmd_addr,portMAX_DELAY);
			cmd = (command_t*) cmd_addr;

			if (cmd -> len ==1)
			{
				option = cmd -> payload[0] - 48;
				switch(option)
				{
				case 0:
					curr_state = sLedEffect;
					xTaskNotify(led_task,0,eNoAction);
					break;
				case 1:
					curr_state = sRtcMenu;
					xTaskNotify(rtc_task,0,eNoAction);
					break;
				case 2:
					xTaskNotifyWait(0,0,NULL,eNoAction);					break;
				default:
					xQueueSend(q_print,&msg_inv,portMAX_DELAY);
					continue;
				}
			}
			else
			{
				//invalid entry
				xQueueSend(q_print,&msg_inv,portMAX_DELAY);
				continue;
			}
			//wait to run again when some other task notifies
			xTaskNotifyWait(0,0,NULL,eNoAction);
		}
}

void led_task(void* parameters)
{
	uint32_t cmd_addr;
	command_t *cmd;

	const char* msg_menu = 	       "===========================\n"
								   "|        LED EFFECT        \n"
								   "===========================\n"
										"none,e1,e2,e3,e4/n"
										"ENTER YOUR CHOICE:   /n";

	while(1)
	{
		//wait for command from main menu
		xTaskNotifyWait(0,0,NULL,portMAX_DELAY);

		//after command, print led menu
		xQueueSend(q_print,&msg_menu,portMAX_DELAY);

		//wait for led effect command
		xTaskNotifyWait(0,0,&cmd_addr,portMAX_DELAY);
		cmd = (command_t*) cmd_addr;

		if(cmd->len <= 4)
		{
			if (! strcmp((char*)cmd->payload,"none"))
				led_effect_stop();
			else if (! strcmp((char*)cmd->payload,"e1"))
				led_effect(1);
			else if (! strcmp((char*)cmd->payload,"e2"))
				led_effect(2);
			else if (! strcmp((char*)cmd->payload,"e3"))
				led_effect(3);
			else if (! strcmp((char*)cmd->payload,"e4"))
				led_effect(4);
			else
				xQueueSend(q_print,&msg_inv,portMAX_DELAY);
		}
		else
			xQueueSend(q_print,&msg_inv,portMAX_DELAY);

		/*TODO: update state variable */
		curr_state = sMainMenu;

		/*TODO: Notify menu task */
		xTaskNotify(handle_menu_task,0,eNoAction);
	}

}

void rtc_task(void* parameters)
{
	while(1)
	{

	}
}

void print_task(void* parameters)
{
	while(1)
	{
		uint32_t msg;

		xQueueReceive(q_print, &msg, portMAX_DELAY);
		HAL_UART_Transmit(&huart2, (uint8_t*)msg, strlen ((char*)msg), HAL_MAX_DELAY);
	}
}

void cmd_task(void* parameters)
{
	BaseType_t ret;
	command_t cmd;

	while(1)
	{
		xTaskNotifyWait(0,0,NULL,portMAX_DELAY);
		if (ret == pdTRUE)
		{
			/*process the user data stored in input data queue*/
			process_command(&cmd);
		}
	}
}

void process_command(command_t *cmd)
{
	extract_command(cmd);

	switch(curr_state)
	{
		case sMainMenu:
			xTaskNotify(menu_task,(uint8_t)cmd, eSetValueWithOverwrite);
		break;

		case sLedEffect:
			xTaskNotify(led_task,(uint8_t)cmd, eSetValueWithOverwrite);
		break;

		case sRtcMenu:
		case sRtcTimeConfig:
		case sRtcDateConfig:
		case sRtcReport:
			xTaskNotify(rtc_task,(uint8_t)cmd, eSetValueWithOverwrite);
		break;
	}
}

int extract_command(command_t *cmd)
{
	uint8_t item;
	BaseType_t status;
	status = uxQueueMessagesWaiting(q_data);

	if(!status) return -1;
	uint8_t i =0;

	do {
		status = xQueueReceive(q_data,&item,0);
				if(status == pdTRUE) cmd->payload[i++] = item;
		}while(item != '\n');

	cmd->payload[1-1] = '\0';
	cmd->len = i-1; /*save length of the command excluding null char */

	return 0;
}

