#! /usr/bin/env python
#coding=utf-8
#������Ҫ��������ģ��
import time, os, sched 
    
# ��һ������ȷ�������ʱ�䣬���ش�ĳ���ض���ʱ�䵽���ھ��������� 
# �ڶ���������ĳ����Ϊ�ķ�ʽ����ʱ�� 
schedule = sched.scheduler(time.time, time.sleep) 
    
def perform_command(cmd, inc): 
    os.system(cmd) 
        
def timming_exe(cmd, inc = 60): 
    # enter��������ĳ�¼��ķ���ʱ�䣬���������n�뿪ʼ���� 
    schedule.enter(inc, 0, perform_command, (cmd, inc)) 
    # �������У�ֱ���ƻ�ʱ����б�ɿ�Ϊֹ 
    schedule.run() 
        
    
print("show time after 10 seconds:") 
timming_exe("echo %time%", 2)