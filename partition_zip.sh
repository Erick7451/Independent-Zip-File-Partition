iters=0
count=0
dir=0
current_memory=0 #based on MB
partition=$((1024*5))

#Function
K_MB() 
{
if [[ $1 == *K* ]];then #if the variable contains K for KB, then
	kb=$1 #replace argument so that we can use default awk $1
	local mb=$(echo $kb | sed 's/K//' | awk '{print $1/1024}') #sub-process
	
else
	mb=$1
	local mb=$(echo $mb | sed 's/M//')

fi #end conditional

echo $mb #return statement

} 


#be on dir containing all subject id tags
ls -lh ./* | grep total | cut -d' ' -f2 | while read f; 

#loops goes per directory
do
	f=$(K_MB $f) 
	((iters += 1)) 
	current_memory=$(echo $current_memory + $f | bc)
	if [[ $current_memory > $partition ]]; then #double parenthesis does NOT work with comparing FLOAT numbers. needs to be > WITHOUT the '=' b/c of floater
		((dir += 1)) #add first partition of folders
		if ((dir == 1)); then
			ls | head -$iters > folders #directory folders
			cat folders | xargs -I % zip -r "partition$dir" % 
			
		else
			ls | grep -vf folders | head -$iters >> folders #appends list
			ls | grep -vf folders | head -$iters | xargs -I % zip -r "partition$dir" % #coprress all files NOT in 'cat folders' until head CONSTRAINT (lim
			
		fi #end condition and give control to INNER loop

	iters=0 # re-init iters

	fi #end this control
done #terminate LOOP CONTROL
