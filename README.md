[TOC]

#### Introduction 

As per some independent research, if the computer is on for eight hours a day then it uses almost 600 kWh and emits 175 kg of CO2 per year. A laptop uses between 50 and 100 W/hour when it is being used, depending on the model. A laptop that is on for eight hours a day uses between 150 and 300 kWh and emits between 44 and 88 kg of CO2 per year. 

Quite often we see the servers, desktops and other devices are up and running during non-business hours. By turning off the servers\desktops\other device during non-business hours we can limit the carbon emission. With the help of "Azure Monitor" , "Azure Automation" , "Azure Hybrid Runbook worker" and "Azure IOT" we can build a "Full Stack Solution" that will identify the devices which are not required during "non-business hours" and turn them off during non productive hours. 

Azure Monitor will be used here for monitoring and Azure Automation will be used for controlling the devices. With this solution lot of electricity can be saved and eventually it will reduce the Carbon foot print.



#### Solution Design

Our solution will make use of the following Azure Components. 

| Azure Component             | Description                                                  |
| --------------------------- | ------------------------------------------------------------ |
| Azure Monitor               | Azure Monitor maximizes the availability and performance of your applications and services by delivering a comprehensive solution for collecting, analyzing, and acting on telemetry from your cloud and on-premises environments.<br /><br /><br />In this solution Azure Monitor is used to monitor the usage of the machines. Also, here Azure monitor will integrate with Azure Automation. |
| Azure Automation            | Azure Automation delivers a cloud-based automation and configuration service that provides consistent management across your Azure and non-Azure environments. Azure Automation provides you the ability to automate frequent, time-consuming, and error-prone cloud management tasks.<br /><br />Azure Automation is used here to run the code for Shutting down the machines during non-business hours. |
| Azure Hybrid Runbook Worker | Hybrid Runbook Worker feature of Azure Automation can directly run runbooks on the computer that's hosting the role and against resources in the environment to manage those local resources. <br /><br />Hybrid Runbook Worker is used here to run the code directly of the on-premises machines.  This will also allow us to execute the code on the machines which resided on the on-premises infrastructure. |

Azure Monitor will help us in analyzing the usage and requirement of the particular devices. Based on this telemetry data we can identify whether that device is needed during off hours or we can safely turn it off.

Once the machine is identified we can initiate the runbook to shutdown it during non business hours. Most of the resources are located in on-premises infrastructure.  So for communicating with these machines Hybrid Runbook worker will be used.  Runbook code will be executed on the HRW. 



![](./Images/Architecture.PNG)

Azure Monitor will help us in analyzing the usage and requirement of the particular devices. Based on this telemetry data we can identify whether that device is needed during off hours or we can safely turn it off.

Once the machine is identified we can initiate the runbook to shutdown it during non business hours. Most of the resources are located in on-premises infrastructure. So for communicating with these machines Hybrid Runbook worker will be used. Runbook code will be executed on the HRW.



##### 

#### Code 

|                       |                                                              |
| --------------------- | ------------------------------------------------------------ |
| Shutdown-AzureVM.md** | https://github.com/Keshav1308/Hack-For-Environment/blob/master/Hackathon-Shutdown-AzureVM.md |
|                       |                                                              |



#### Team 

|              |                                                              |
| ------------ | ------------------------------------------------------------ |
| Team Name    | Hack-For-Environment                                         |
| Team Members | Keshav Deo Jain  https://www.linkedin.com/in/keshav-jain-016427121/<br /> Nilankar Sen https://www.linkedin.com/in/nilankar-sen-b36589a4/ |

