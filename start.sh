#!/bin/bash
if ! node -v &> /dev/null
then
    echo "node.js could not be found"
    exit
else
	if ! npm -v &> /dev/null
	then
    		echo "npm could not be found"
    		exit
	else
		if ! which node-red > /dev/null
		then
			echo "node-red could not be found, please install node-red first"
			exit
		else
			cwd=$(pwd)

			if [ ! -d "~/.node-red" ]
			then
				mkdir ~/.node-red	
			fi

			echo "change current dir to ~/.node-red"
			cd ~/.node-red
			echo 'arrived at $PWD'
			echo ""

			echo "copy flows and setting file to ~/.node-red"
			cp "$cwd/flows.json" ~/.node-red/
			echo ""
			echo 'Start install dependency'
			echo '-----------------------------------------------'
			npm install node-red-cipherflow
			npm install node-red-contrib-cpu
			npm install node-red-contrib-interval-switch
			npm install node-red-contrib-linux-memory
			npm install node-red-contrib-loop

			echo '-----------------------------------------------'
			echo "Install dependency successful"
			echo ""



			echo '------------------------------------------------------------------'
			echo '------------------------------------------------------------------'
			echo "Please wait until the 'FINISH' message appears in the debug tab. 
The test results can be found in '~/.node-red/result'."

			echo '------------------------------------------------------------------'
			echo '------------------------------------------------------------------'
			echo ""
			echo "start node-red"
			node-red

				

			exit
		fi

	fi
fi
