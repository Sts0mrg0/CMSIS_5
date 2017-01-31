<?xml version="1.0" encoding="utf-8"?>

<!-- File naming: <part/series name>.svd -->

<!--
  Copyright (C) 2012-2014 ARM Limited. All rights reserved.

  Purpose: System Viewer Description (SVD) Example (Schema Version 1.1)
           This is a description of a none-existent and incomplete device
		   for demonstration purposes only.
		   
  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
   - Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   - Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
   - Neither the name of ARM nor the names of its contributors may be used 
     to endorse or promote products derived from this software without 
     specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS AND CONTRIBUTORS BE
  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  POSSIBILITY OF SUCH DAMAGE.
 -->
 
<device schemaVersion="1.1" xmlns:xs="http://www.w3.org/2001/XMLSchema-instance" xs:noNamespaceSchemaLocation="CMSIS-SVD.xsd" >
  <vendor>ARM Ltd.</vendor>                                       <!-- device vendor name -->
  <vendorID>ARM</vendorID>                                        <!-- device vendor short name -->
  <name>My_ARM_Example</name>                                        <!-- name of part-->
  <series>ARMCM3</series>                                         <!-- device series the device belongs to -->
  <version>1.2</version>                                          <!-- version of this description, adding CMSIS-SVD 1.1 tags -->
  <description>ARM 32-bit Cortex-M3 Microcontroller based device, CPU clock up to 80MHz, etc. </description>
  <licenseText>                                                   <!-- this license text will appear in header file. \n force line breaks -->
    ARM Limited (ARM) is supplying this software for use with Cortex-M\n
    processor based microcontroller, but can be equally used for other\n
    suitable  processor architectures. This file can be freely distributed.\n
    Modifications to this file shall be clearly marked.\n
    \n
    THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED\n
    OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF\n
    MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.\n
    ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR\n
    CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
  </licenseText>
  <cpu>                                                           <!-- details about the cpu embedded in the device -->
    <name>CM3</name>
    <revision>r1p0</revision>
    <endian>little</endian>
    <mpuPresent>true</mpuPresent>
    <fpuPresent>false</fpuPresent>
    <nvicPrioBits>3</nvicPrioBits>
    <vendorSystickConfig>false</vendorSystickConfig>
  </cpu>
  <addressUnitBits>8</addressUnitBits>                            <!-- byte addressable memory -->
  <width>32</width>                                               <!-- bus width is 32 bits -->
  <!-- default settings implicitly inherited by subsequent sections -->
  <size>32</size>                                                 <!-- this is the default size (number of bits) of all peripherals
                                                                       and register that do not define "size" themselves -->
  <access>read-write</access>                                     <!-- default access permission for all subsequent registers -->
  <resetValue>0x00000000</resetValue>                             <!-- by default all bits of the registers are initialized to 0 on reset -->
  <resetMask>0xFFFFFFFF</resetMask>                               <!-- by default all 32Bits of the registers are used -->

  <peripherals>
    <!-- Timer 0 -->
    <peripheral>
      <name>TIMER0</name>
      <version>1.0</version>
      <description>32 Timer / Counter, counting up or down from different sources</description>
      <groupName>TIMER</groupName>
      <baseAddress>0x40010000</baseAddress>
      <size>32</size>
      <access>read-write</access>

      <addressBlock>
        <offset>0</offset>
        <size>0x100</size>
        <usage>registers</usage>
      </addressBlock>

      <interrupt>
        <name>TIMER0</name>
        <description>Imterrupt Timer0</description>
        <value>0</value>
      </interrupt>

      <registers>
      <!-- CR: Control Register -->
        <register>
          <name>CR</name>
          <description>Control Register</description>
          <addressOffset>0x00</addressOffset>
          <size>32</size>
          <access>read-write</access>
          <resetValue>0x00000000</resetValue>
          <resetMask>0x1337F7F</resetMask>

          <fields>
            <!-- EN: Enable -->
            <field>
              <name>EN</name>
              <description>Enable</description>
              <bitRange>[0:0]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>Disable</name>
                  <description>Timer is disabled and does not operate</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Enable</name>
                  <description>Timer is enabled and can operate</description>
                  <value>1</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- RST: Reset -->
            <field>
              <name>RST</name>
              <description>Reset Timer</description>
              <bitRange>[1:1]</bitRange>
              <access>write-only</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>No_Action</name>
                  <description>Write as ZERO if necessary</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Reset_Timer</name>
                  <description>Reset the Timer</description>
                  <value>1</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- CNT: Counting Direction -->
            <field>
              <name>CNT</name>
              <description>Counting direction</description>
              <bitRange>[3:2]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>Count_UP</name>
                  <description>Timer Counts UO and wraps, if no STOP condition is set</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Count_DOWN</name>
                  <description>Timer Counts DOWN and wraps, if no STOP condition is set</description>
                  <value>1</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Toggle</name>
                  <description>Timer Counts up to MAX, then DOWN to ZERO, if no STOP condition is set</description>
                  <value>2</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- MODE: Operation Mode -->
            <field>
              <name>MODE</name>
              <description>Operation Mode</description>
              <bitRange>[6:4]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>Continous</name>
                  <description>Timer runs continously</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Single_ZERO_MAX</name>
                  <description>Timer counts to 0x00 or 0xFFFFFFFF (depending on CNT) and stops</description>
                  <value>1</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Single_MATCH</name>
                  <description>Timer counts to the Value of MATCH Register and stops</description>
                  <value>2</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Reload_ZERO_MAX</name>
                  <description>Timer counts to 0x00 or 0xFFFFFFFF (depending on CNT), loads the RELOAD Value and continues</description>
                  <value>3</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Reload_MATCH</name>
                  <description>Timer counts to the Value of MATCH Register, loads the RELOAD Value and continues</description>
                  <value>4</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- PSC: Use Prescaler -->
            <field>
              <name>PSC</name>
              <description>Use Prescaler</description>
              <bitRange>[7:7]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>Disabled</name>
                  <description>Prescaler is not used</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Enabled</name>
                  <description>Prescaler is used as divider</description>
                  <value>1</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- CNTSRC: Timer / Counter Soruce Divider -->
            <field>
              <name>CNTSRC</name>
              <description>Timer / Counter Source Divider</description>
              <bitRange>[11:8]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>CAP_SRC</name>
                  <description>Capture Source is used directly</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>CAP_SRC_div2</name>
                  <description>Capture Source is divided by 2</description>
                  <value>1</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>CAP_SRC_div4</name>
                  <description>Capture Source is divided by 4</description>
                  <value>2</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>CAP_SRC_div8</name>
                  <description>Capture Source is divided by 8</description>
                  <value>3</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>CAP_SRC_div16</name>
                  <description>Capture Source is divided by 16</description>
                  <value>4</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>CAP_SRC_div32</name>
                  <description>Capture Source is divided by 32</description>
                  <value>5</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>CAP_SRC_div64</name>
                  <description>Capture Source is divided by 64</description>
                  <value>6</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>CAP_SRC_div128</name>
                  <description>Capture Source is divided by 128</description>
                  <value>7</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>CAP_SRC_div256</name>
                  <description>Capture Source is divided by 256</description>
                  <value>8</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- CAPSRC: Timer / COunter Capture Source -->
            <field>
              <name>CAPSRC</name>
              <description>Timer / Counter Capture Source</description>
              <bitRange>[15:12]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>CClk</name>
                  <description>Core Clock</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOA_0</name>
                  <description>GPIO A, PIN 0</description>
                  <value>1</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOA_1</name>
                  <description>GPIO A, PIN 1</description>
                  <value>2</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOA_2</name>
                  <description>GPIO A, PIN 2</description>
                  <value>3</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOA_3</name>
                  <description>GPIO A, PIN 3</description>
                  <value>4</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOA_4</name>
                  <description>GPIO A, PIN 4</description>
                  <value>5</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOA_5</name>
                  <description>GPIO A, PIN 5</description>
                  <value>6</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOA_6</name>
                  <description>GPIO A, PIN 6</description>
                  <value>7</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOA_7</name>
                  <description>GPIO A, PIN 7</description>
                  <value>8</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOB_0</name>
                  <description>GPIO B, PIN 0</description>
                  <value>9</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOB_1</name>
                  <description>GPIO B, PIN 1</description>
                  <value>10</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOB_2</name>
                  <description>GPIO B, PIN 2</description>
                  <value>11</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOB_3</name>
                  <description>GPIO B, PIN 3</description>
                  <value>12</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOC_0</name>
                  <description>GPIO C, PIN 0</description>
                  <value>13</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOC_5</name>
                  <description>GPIO C, PIN 1</description>
                  <value>14</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>GPIOC_6</name>
                  <description>GPIO C, PIN 2</description>
                  <value>15</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- CAPEDGE: Capture Edge -->
            <field>
              <name>CAPEDGE</name>
              <description>Capture Edge, select which Edge should result in a counter increment or decrement</description>
              <bitRange>[17:16]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>RISING</name>
                  <description>Only rising edges result in a counter increment or decrement</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>FALLING</name>
                  <description>Only falling edges  result in a counter increment or decrement</description>
                  <value>1</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>BOTH</name>
                  <description>Rising and falling edges result in a counter increment or decrement</description>
                  <value>2</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- TRGEXT: Triggers an other Peripheral -->
            <field>
              <name>TRGEXT</name>
              <description>Triggers an other Peripheral</description>
              <bitRange>[21:20]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>NONE</name>
                  <description>No Trigger is emitted</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>DMA1</name>
                  <description>DMA Controller 1 is triggered, dependant on MODE</description>
                  <value>1</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>DMA2</name>
                  <description>DMA Controller 2 is triggered, dependant on MODE</description>
                  <value>2</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>UART</name>
                  <description>UART is triggered, dependant on MODE</description>
                  <value>3</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- Reload: Selects Reload Register n -->
            <field>
              <name>RELOAD</name>
              <description>Select RELOAD Register n to reload Timer on condition</description>
              <bitRange>[25:24]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>RELOAD0</name>
                  <description>Selects Reload Register number 0</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>RELOAD1</name>
                  <description>Selects Reload Register number 1</description>
                  <value>1</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>RELOAD2</name>
                  <description>Selects Reload Register number 2</description>
                  <value>2</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>RELOAD3</name>
                  <description>Selects Reload Register number 3</description>
                  <value>3</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- IDR: Inc or dec Reload Register Selection -->
            <field>
              <name>IDR</name>
              <description>Selects, if Reload Register number is incremented, decremented or not modified</description>
              <bitRange>[27:26]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>KEEP</name>
                  <description>Reload Register number does not change automatically</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>INCREMENT</name>
                  <description>Reload Register number is incremented on each match</description>
                  <value>1</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>DECREMENT</name>
                  <description>Reload Register number is decremented on each match</description>
                  <value>2</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- START: Starts / Stops the Timer/Counter -->
            <field>
              <name>S</name>
              <description>Starts and Stops the Timer / Counter</description>
              <bitRange>[31:31]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>STOP</name>
                  <description>Timer / Counter is stopped</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>START</name>
                  <description>Timer / Counter is started</description>
                  <value>1</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>
          </fields>
        </register>

        <!-- SR: Status Register -->
        <register>
          <name>SR</name>
          <description>Status Register</description>
          <addressOffset>0x04</addressOffset>
          <size>16</size>
          <access>read-write</access>
          <resetValue>0x00000000</resetValue>
          <resetMask>0xD701</resetMask>

          <fields>
            <!-- RUN: Shows if Timer is running -->
            <field>
              <name>RUN</name>
              <description>Shows if Timer is running or not</description>
              <bitRange>[0:0]</bitRange>
              <access>read-only</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>Stopped</name>
                  <description>Timer is not running</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Running</name>
                  <description>Timer is running</description>
                  <value>1</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- MATCH: Shows if a Match was hit -->
            <field>
              <name>MATCH</name>
              <description>Shows if the MATCH was hit</description>
              <bitRange>[8:8]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>No_Match</name>
                  <description>The MATCH condition was not hit</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Match_Hit</name>
                  <description>The MATCH condition was hit</description>
                  <value>1</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- UN: Shows if an underflow occured -->
            <field>
              <name>UN</name>
              <description>Shows if an underflow occured. This flag is sticky</description>
              <bitRange>[9:9]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>No_Underflow</name>
                  <description>No underflow occured since last clear</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Underflow</name>
                  <description>A minimum of one underflow occured since last clear</description>
                  <value>1</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- OV: Shows if an overflow occured -->
            <field>
              <name>OV</name>
              <description>Shows if an overflow occured. This flag is sticky</description>
              <bitRange>[10:10]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>No_Overflow</name>
                  <description>No overflow occured since last clear</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Overflow_occured</name>
                  <description>A minimum of one overflow occured since last clear</description>
                  <value>1</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- RST: Shows if Timer is in RESET state -->
            <field>
              <name>RST</name>
              <description>Shows if Timer is in RESET state</description>
              <bitRange>[12:12]</bitRange>
              <access>read-only</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>Ready</name>
                  <description>Timer is not in RESET state and can operate</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>In_Reset</name>
                  <description>Timer is in RESET state and can not operate</description>
                  <value>1</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- RELOAD: Shows the currently active Reload Register -->
            <field>
              <name>RELOAD</name>
              <description>Shows the currently active RELOAD Register</description>
              <bitRange>[15:14]</bitRange>
              <access>read-only</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>RELOAD0</name>
                  <description>Reload Register number 0 is active</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>RELOAD1</name>
                  <description>Reload Register number 1 is active</description>
                  <value>1</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>RELOAD2</name>
                  <description>Reload Register number 2 is active</description>
                  <value>2</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>RELOAD3</name>
                  <description>Reload Register number 3 is active</description>
                  <value>3</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>
          </fields>
        </register>

        <!-- INT: Interrupt Register -->
        <register>
          <name>INT</name>
          <description>Interrupt Register</description>
          <addressOffset>0x10</addressOffset>
          <size>16</size>
          <access>read-write</access>
          <resetValue>0x00000000</resetValue>
          <resetMask>0x0771</resetMask>

          <fields>
            <!-- EN: Interrupt Enable -->
            <field>
              <name>EN</name>
              <description>Interrupt Enable</description>
              <bitRange>[0:0]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>Disabled</name>
                  <description>Timer does not generate Interrupts</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Enable</name>
                  <description>Timer triggers the TIMERn Interrupt</description>
                  <value>1</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>

            <!-- MODE: Interrupt Mode -->
            <field>
              <name>MODE</name>
              <description>Interrupt Mode, selects on which condition the Timer should generate an Interrupt</description>
              <bitRange>[6:4]</bitRange>
              <access>read-write</access>
              <enumeratedValues>
                <enumeratedValue>
                  <name>Match</name>
                  <description>Timer generates an Interrupt when the MATCH condition is hit</description>
                  <value>0</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Underflow</name>
                  <description>Timer generates an Interrupt when it underflows</description>
                  <value>1</value>
                </enumeratedValue>
                <enumeratedValue>
                  <name>Overflow</name>
                  <description>Timer generates an Interrupt when it overflows</description>
                  <value>2</value>
                </enumeratedValue>
              </enumeratedValues>
            </field>
          </fields>
        </register>

        <!-- COUNT: Counter Register -->
        <register>
          <name>COUNT</name>
          <description>The Counter Register reflects the actual Value of the Timer/Counter</description>
          <addressOffset>0x20</addressOffset>
          <size>32</size>
          <access>read-write</access>
          <resetValue>0x00000000</resetValue>
          <resetMask>0xFFFFFFFF</resetMask>
        </register>

        <!-- MATCH: Match Register -->
        <register>
          <name>MATCH</name>
          <description>The Match Register stores the compare Value for the MATCH condition</description>
          <addressOffset>0x24</addressOffset>
          <size>32</size>
          <access>read-write</access>
          <resetValue>0x00000000</resetValue>
          <resetMask>0xFFFFFFFF</resetMask>
        </register>
        
        <!-- PRESCALE: Prescale Read Register -->
        <register>
          <name>PRESCALE_RD</name>
          <description>The Prescale Register stores the Value for the prescaler. The cont event gets divided by this value</description>
          <addressOffset>0x28</addressOffset>
          <size>32</size>
          <access>read-only</access>
          <resetValue>0x00000000</resetValue>
          <resetMask>0xFFFFFFFF</resetMask>
        </register>
        
        <!-- PRESCALE: Prescale Write Register -->
        <register>
          <name>PRESCALE_WR</name>
          <description>The Prescale Register stores the Value for the prescaler. The cont event gets divided by this value</description>
          <addressOffset>0x28</addressOffset>
          <size>32</size>
          <access>write-only</access>
          <resetValue>0x00000000</resetValue>
          <resetMask>0xFFFFFFFF</resetMask>
        </register>


        <!-- RELOAD: Array of Reload Register with 4 elements-->
        <register>
          <dim>4</dim>
          <dimIncrement>4</dimIncrement>
          <dimIndex>0,1,2,3</dimIndex>
          <name>RELOAD%s</name>
          <description>The Reload Register stores the Value the COUNT Register gets reloaded on a when a condition was met.</description>
          <addressOffset>0x50</addressOffset>
          <size>32</size>
          <access>read-write</access>
          <resetValue>0x00000000</resetValue>
          <resetMask>0xFFFFFFFF</resetMask>
        </register>
<!--
<register>
    <dim>6</dim> 
    <dimIncrement>4</dimIncrement> 
    <dimIndex>A,B,C,D,E,Z</dimIndex> 
    <name>GPIO_%s_CTRL</name> 
    <addressOffset>0x60</addressOffset>
</register>
-->
<register>
    <dim>4</dim> 
    <dimIncrement>4</dimIncrement> 
    <dimIndex>3-6</dimIndex> 
    <name>IRQ%s</name> 
    <addressOffset>0x80</addressOffset>
</register>

<register>
    <dim>4</dim> 
    <dimIncrement>4</dimIncrement> 
    <name>IRQA[%s]</name> 
    <addressOffset>0x90</addressOffset>
</register>

<cluster>
    <dim>4</dim>
    <dimIncrement>8</dimIncrement>
    <name>TX[%s]</name>
    <description>Grouping of Transfer data and address</description>
    <addressOffset>0x60</addressOffset>
    <register>
       <name>TX_DATA</name>
       <addressOffset>0x0</addressOffset>
    </register>
    <register>
        <name>TX_ADDR</name>
        <addressOffset>0x4</addressOffset>
    </register>
</cluster>

      </registers>
    </peripheral>

    <!-- Timer 1 -->
    <peripheral derivedFrom="TIMER0">
      <name>TIMER1</name>
      <description>Peripheral TIMER1</description>
      <baseAddress>0x40010100</baseAddress>
      <interrupt>
        <name>TIMER1</name>
        <description>Interrupt TIMER1</description>
        <value>4</value>
      </interrupt>
    </peripheral>

    <!-- Timer 2 -->
    <peripheral derivedFrom="TIMER0">
      <name>TIMER2</name>
      <baseAddress>0x40010200</baseAddress>
      <interrupt>
        <name>TIMER2</name>
        <description>Interrupt TIMER2</description>
        <value>6</value>
      </interrupt>
    </peripheral>
  </peripherals>
</device>
