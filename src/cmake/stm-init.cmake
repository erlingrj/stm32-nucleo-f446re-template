# Includes the correct toolchain file and sets global compile options, linker options
# compile definitions and include directories for the STM32F446RE MCU.

set(CMAKE_TOOLCHAIN_FILE ${LF_SOURCE_DIRECTORY}/cmake/arm-none-eabi-gcc.cmake)

set(MCU_FAMILY STM32F4xx)
set(MCU_MODEL STM32F446xx)
set(CPU_PARAMETERS -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp)

set(STM_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../STM_sdk)
set(MCU_LINKER_SCRIPT ${STM_DIR}/STM32F446RETx_FLASH.ld)

add_compile_options(
    ${CPU_PARAMETERS}
    -Wall
    -Wextra
    -Wpedantic
    -Wno-unused-parameter
)

add_link_options(
    -T${MCU_LINKER_SCRIPT}
    ${CPU_PARAMETERS}
    -Wl,-Map=${CMAKE_PROJECT_NAME}.map
    --specs=nosys.specs
    -Wl,--start-group
    -lc
    -lm
    -lstdc++
    -Wl,--end-group
    -Wl,--print-memory-usage)


add_compile_definitions(${MCU_MODEL} USE_HAL_DRIVER)

set(CUBEMX_INCLUDE_DIRECTORIES
    ${PROJECT_DIR}
    ${PROJECT_DIR}/include/Main
    ${STM_DIR}/Core/Inc
    ${STM_DIR}/Drivers/STM32F4xx_HAL_Driver/Inc
    ${STM_DIR}/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy
    ${STM_DIR}/Drivers/CMSIS/Device/ST/STM32F4xx/Include
    ${STM_DIR}/Drivers/CMSIS/Include
)

include_directories(${CUBEMX_INCLUDE_DIRECTORIES})