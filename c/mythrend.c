/*
 * mythrend.c
 *
 *  Created on: 2013-7-26
 *      Author: tboqi
 */

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <signal.h>
#include <sys/param.h>
#include <sys/stat.h>

void init_daemon(void);

int main(void){
	FILE *fp;
	time_t t;

	init_daemon();

	while(1){
		sleep(10);
		if( (fp=fopen("log.txt", "a+")) >= 0){//打开log文件，若没有此文件则创建
			t=time(0);
			fprintf(fp, "守护进程正在运行，时间是:%s", asctime(localtime(&t)));
			fclose(fp);
		}
	}
	return 1;
}

void init_daemon(void){
	pid_t pid;
	int i;
	pid = fork();
	if(pid > 0){ //终止父进程
		exit(0);
	}else if(pid < 0 ){
		perror("创建子进程失败\n");
		exit(1);
	}else if(pid == 0){
		setsid();//子进程中创建新会话
		chdir("/tmp");//改变工作目录到tmp
		umask(0); //重设文件掩码
		for(i=0; i<NOFILE;++i){//关闭文件描述符
			close(i);
		}
		return ;
	}
}
