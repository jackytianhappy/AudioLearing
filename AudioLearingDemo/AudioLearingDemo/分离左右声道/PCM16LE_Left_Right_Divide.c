//
//  PCM16LE_Left_Right_Divide.c
//  AudioLearingDemo
//
//  Created by Tian,Nan on 2017/12/15.
//  Copyright © 2017年 Tian,Nan. All rights reserved.
//

#include "PCM16LE_Left_Right_Divide.h"
#include <stdlib.h>

int simplest_pcm16le_split(char *url, char *url_left, char *url_right){
    FILE *fp=fopen(url,"rb+");
    FILE *fp1=fopen(url_left,"wb+");
    FILE *fp2=fopen(url_right,"wb+");
    
    unsigned char *sample=(unsigned char *)malloc(4);
    
    while(!feof(fp)){
        fread(sample,1,4,fp);
        //L
        fwrite(sample,1,2,fp1);
        //R
        fwrite(sample+2,1,2,fp2);
    }
    
    free(sample);
    fclose(fp);
    fclose(fp1);
    fclose(fp2);
    
    return 0;
}
