for(i=1;i<length($0);i++)
{
	if(substr($0,i,1)=="=") continue;
	ch=ch decodes[substr($0,i,1)];
	if(length(ch)<8) continue;
	printf "%c",bintodec(substr(ch,1,8));
	ch=substr(ch,9);
}
