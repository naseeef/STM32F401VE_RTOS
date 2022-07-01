/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdio.h>
#include "FreeRTOS.h"
#include "task.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
#define DWT_CTRL (*(volatile uint32_t*) 0xE0001000)
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
/* USER CODE BEGIN PFP */
static void task_green_handler(void*  parameters);
static void task_red_handler(void*  parameters);
static void task_blue_handler(void*  parameters);
static void task_button_handler(void* parameters);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
TaskHandle_t ledg_handle;
TaskHandle_t ledr_handle;
TaskHandle_t ledb_handle;
TaskHandle_t btn_handle;

BaseType_t status;
TaskHandle_t volatile next_task_handle;
/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  /* USER CODE BEGIN 2 */
  //cyclic counter
  DWT_CTRL |= (1<<0);

  SEGGER_SYSVIEW_Conf();

  status = xTaskCreate(task_green_handler, "LED_Green", 200, NULL, 3, &ledg_handle);
  configASSERT(status == pdPASS);

  status = xTaskCreate(task_red_handler, "LED_Red", 200, NULL, 2, &ledr_handle);
  configASSERT(status == pdPASS);

  status = xTaskCreate(task_blue_handler, "LED_Blue", 200, NULL, 1, &ledb_handle);
  configASSERT(status == pdPASS);

  status = xTaskCreate(task_button_handler, "LED_Blue", 200, NULL, 4, &btn_handle);
  configASSERT(status == pdPASS);

  //start freertos scheduler
  vTaskStartScheduler();
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOD_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOD, GPIO_PIN_12|GPIO_PIN_13|GPIO_PIN_14|GPIO_PIN_15, GPIO_PIN_RESET);

  /*Configure GPIO pins : PD12 PD13 PD14 PD15 */
  GPIO_InitStruct.Pin = GPIO_PIN_12|GPIO_PIN_13|GPIO_PIN_14|GPIO_PIN_15;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */
void button_interrupt_handler()
{
	traceISR_ENTER();
	xTaskNotifyFromISR(next_task_handle,0,eNoAction,NULL);
	traceISR_EXIT();
}

static void task_green_handler(void* parameters)
{
	while(1)
	{
		SEGGER_SYSVIEW_PrintfTarget("Toggling L G");
		HAL_GPIO_TogglePin(GPIOD, 12);
		status = xTaskNotifyWait(0,0,NULL,pdMS_TO_TICKS(1000));
		if(status == pdTRUE)
		{
			portENTER_CRITICAL();
			next_task_handle = ledr_handle;
			//xTaskResumeAll();
			HAL_GPIO_WritePin(GPIOD, 12,GPIO_PIN_SET);
			SEGGER_SYSVIEW_PrintfTarget("Deleted L G");
			portEXIT_CRITICAL();
			vTaskDelete(NULL);
		}

	}
}

static void task_red_handler(void* parameters)
{
	while(1)
	{
		SEGGER_SYSVIEW_PrintfTarget("Toggling L R");
		HAL_GPIO_TogglePin(GPIOD, 13);
		status = xTaskNotifyWait(0,0,NULL,pdMS_TO_TICKS(800));
		if(status == pdTRUE)
		{
			portENTER_CRITICAL();
			vTaskSuspendAll();
			next_task_handle = ledb_handle;
			//xTaskResumeAll();
			HAL_GPIO_WritePin(GPIOD, 14,GPIO_PIN_SET);
			SEGGER_SYSVIEW_PrintfTarget("Deleted L R");
			portEXIT_CRITICAL();
			vTaskDelete(NULL);
		}

	}
}

static void task_blue_handler(void* parameters)
{
	while(1)
	{
		SEGGER_SYSVIEW_PrintfTarget("Toggling L B");
		HAL_GPIO_TogglePin(GPIOD, 14);
		status = xTaskNotifyWait(0,0,NULL,pdMS_TO_TICKS(400));

		if(status == pdTRUE)
		{
			portENTER_CRITICAL();
			vTaskSuspendAll();
			next_task_handle = NULL;
			//xTaskResumeAll();
			HAL_GPIO_WritePin(GPIOD, 14,GPIO_PIN_SET);
			SEGGER_SYSVIEW_PrintfTarget("Deleted L B");
			portEXIT_CRITICAL();
			vTaskDelete(btn_handle);
			vTaskDelete(NULL);
		}

	}
}

static void task_button_handler(void* parameters)
{

	uint8_t btn_read = 0;
	uint8_t prev_read = 0;

	while(1)
	{
		btn_read = HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_0);

			if(btn_read)
			{
				if(!prev_read)
					{
						xTaskNotify(next_task_handle,0,eNoAction);
					}
			}
			prev_read = btn_read;
			vTaskDelay(pdMS_TO_TICKS(10));
		}
}

/* USER CODE END 4 */

/**
  * @brief  Period elapsed callback in non blocking mode
  * @note   This function is called  when TIM6 interrupt took place, inside
  * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
  * a global variable "uwTick" used as application time base.
  * @param  htim : TIM handle
  * @retval None
  */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  /* USER CODE BEGIN Callback 0 */

  /* USER CODE END Callback 0 */
  if (htim->Instance == TIM6) {
    HAL_IncTick();
  }
  /* USER CODE BEGIN Callback 1 */

  /* USER CODE END Callback 1 */
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

