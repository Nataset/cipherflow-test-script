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

			export RESULT_DIR=$(pwd)

			echo "copy flows and setting file to ~/.node-red"
			cp "$cwd/flows.json" "$cwd/settings.js" ~/.node-red/
			echo ""
			echo 'Start install dependency'
			echo '-----------------------------------------------'

			if [ ! -d "$(pwd)/node_modules/node-red-cipherflow" ]; then
  				echo "Installing cipherflow"
				npm install node-red-cipherflow
			fi


			if [ ! -d "$(pwd)/node_modules/node-red-contrib-cpu" ]; then
  				echo "Installing cipherflow"
				npm install node-red-contrib-cpu
			fi

			if [ ! -d "$(pwd)/node_modules/node-red-contrib-interval-switch" ]; then
  				echo "Installing cipherflow"
				npm install node-red-contrib-interval-switch
			fi

			if [ ! -d "$(pwd)/node_modules/node-red-contrib-linux-memory" ]; then
  				echo "Installing cipherflow"
				npm install node-red-contrib-linux-memory
			fi

			if [ ! -d "$(pwd)/node_modules/node-red-contrib-loop" ]; then
  				echo "Installing cipherflow"
				npm install node-red-contrib-loop
			fi

			if [ ! -d "$(pwd)/node_modules/performance-now" ]; then
  				echo "Installing cipherflow"
				npm install performance-now
			fi

			echo '-----------------------------------------------'
			echo "Install dependency successful"
			echo ""
			read -p "Please Enter number of iterations you would like to run [default 20]: " loop
			export CPU_LOOP_NUMBER="$loop"
			export TIME_LOOP_NUMBER="$loop"
			export MEMORY_LOOP_NUMBER="$loop"

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
