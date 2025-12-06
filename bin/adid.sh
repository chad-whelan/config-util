#!/bin/bash 

id $1 | awk 'BEGIN {FS="="};
   {
      split($4,Arr,",")
      for (x in Arr) {
         # if (index(Arr[x], "PJIUS") > 0) {
           i=index(Arr[x], "(") + 1
           l=length(Arr[x]) 
           #print  substr(Arr[x],i,l-i) 
           print Arr[x]
         #};
       };
   }' | sort 
