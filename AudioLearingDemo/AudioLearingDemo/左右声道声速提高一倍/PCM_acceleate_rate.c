//
//  PCM_acceleate_rate.c
//  AudioLearingDemo
//
//  Created by Tian,Nan on 2017/12/17.
//  Copyright © 2017年 Tian,Nan. All rights reserved.
//

#include "PCM_acceleate_rate.h"
#include <stdlib.h>

/**
 * Re-sample to double the speed of 16LE PCM file
 * @param url  Location of PCM file.
 */
int simplest_pcm16le_doublespeed(char *url,char *url_accerate){
    FILE *fp=fopen(url,"rb+");
    FILE *fp1=fopen(url_accerate,"wb+");
    
    int cnt=0;
    
    unsigned char *sample=(unsigned char *)malloc(4);
    
    while(!feof(fp)){
        
        fread(sample,1,4,fp);
        
        if(cnt%2==0){
            //L
            fwrite(sample,1,2,fp1);
            //R
            fwrite(sample+2,1,2,fp1);
        }
        cnt++;
    }
    printf("Sample Cnt:%d\n",cnt);
    
    free(sample);
    fclose(fp);
    fclose(fp1);
    return 0;
}
