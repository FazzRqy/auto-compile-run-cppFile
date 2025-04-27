if ! command -v g++ > /dev/null 2>&1; then
	printf "\n[!] Opss, looks like the g++ on your terminal is not found, plz download it first!\n"
	exit 1
fi

while :
	do
		printf "\n[+] Input the name file here (use command 'exit' to quit thi's script, use 'cf' to check all file in directory)\n"
		read -p "[+] no need use './', name only (example: name.cpp or path/to/file.cpp): " input

		if [ -z $input ]; then
			printf "\n[!] Opss. looks like u not type anything, try again!"
			continue
		fi

		if [ $input == 'cf' ]; then
			printf "[+] File:\n\n"
			echo ./*
			continue
		fi

		if [ $input == 'exit' ]; then
			printf "\n[!] Exit...\n"
			exit 1
		fi

		printf "\n"

		read -p "[+] Input the name file (The name of the saved file will follow the name of the cpp file itself.): " nmfile

		if [ -z $nmfile ]; then

			filenm=$(basename "$input" .cpp)

			g++ ./$input -o $filenm.out

			while :
				do
					printf "\n"
					read -p "[+] Do you want to running the code? [y/n]: " runng

					if [ -z $runng ] || [ $runng == "y" ] || [ $runng == "Y" ] || [ $runng == "yes" ]; then
						printf "\n"
						./$filenm.out
						printf "\n"
						exit 1
					fi

		       		if [ "$runng" != "n" ] && [ "$rungg" != "N" ] && [ "$runng" != "no" ] && [ "$runng" != "No" ]; then
		               	printf "\n[!] Opss. looks like u wrong typing, try again!"
		               	continue
		       		fi

					printf "\ndone"
					printf "\n"
					exit 1
		done
		fi


		if [ -n "$nmfile" ]; then
			g++ ./$input -o $nmfile.out

			while :
				do
					printf "\n"
					read -p "[+] Do you want to running the code? [y/n]: " runng

		            if [ -z $runng ] || [ $runng == "y" ] || [ $runng == "Y" ] || [ $runng == "yes" ]; then
		               		printf "\n"
	                   		./$nmfile".out"
							printf "\n"
                       		exit 1
               		fi

		       		if [ "$runng" != "n" ] && [ "$rungg" != "N" ] && [ "$runng" != "no" ] && [ "$runng" != "No" ]; then
		               		printf "\n[!] Opss. looks like u wrong typing, try again!"
		               		continue
		       		fi

		            printf "done"
					printf "\n"
		            exit 1
			done
		fi
done