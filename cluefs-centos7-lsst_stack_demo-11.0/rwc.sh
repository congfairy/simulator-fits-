#!/bin/bash
filename=$1
awk -F' ' '/VERBOSE/ {
if($6=="read")
{
readtime=readtime+$NF;
print "read "$NF;
}
else if($6=="write")
{
writetime=writetime+$NF;
print "write "$NF;
}
else if($6=="compute")
{
computetime=computetime+$NF;
print "compute "$NF;
}
}
END{printf("readtime is %s,writetime is %s,compute time is %s\n",readtime,writetime,computetime)}
' $filename 


