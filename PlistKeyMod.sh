#!/bin/bash
# License: The MIT License (MIT)
# Author Zuzzuc https://github.com/Zuzzuc/

if [ "$(caller 0)" != "" ];then
	exit_mode="return"
else
	exit_mode="exit"
fi

print_usage(){
	echo -e "Usage is PlistKeyMod.sh -[fkmvh]=[value]"
}

catch_err(){
	# Input is $1, where $1 is the error code description to display.
	if [ -z $2 ];then
		case "$1" in
   		 	1)
   				echo "($1) No file supplied."
   				;;
   			2)
   				echo "($1) Specified key, '$key', was not found in the file."
   				;;
   			3)
   				echo "($1) File '$file' does not exist."
   				;;
   			4)
   				echo "($1) Mode '$mode' is not supported."
   				;;
   			5)
   				echo "($1) File recived is not a plist."
   				;;
   			6)
   				echo "Unknown argument supplied. Failing arg is '$3'"
   				;;
   			*)
   				echo "Unknown error code. No default message to display."
   			;;
   		esac
   	else
   		echo "$2"
   	fi
   	error_code=$1
}

# Setup
file=""
mode="read"
key=""
value=""
output="auto" # Default var.


# Handle input
if [ "$*" != "" ];then	
	for i in "$@";do					
		case "$i" in		
		"$0")
    		continue
    		;;
    	-f=*|--file=*)
   			f="${i#*=}" && f="${f/\\/}" && f="${f%${f##*[![:space:]]}}"
   			if [ "${f:${#f}-6}" == ".plist" ];then
   				file="$f"
   			else
   				# File is not a plist.
   				catch_err "5" && $exit_mode $error_code
   			fi
   			;;
   		-k=*|--key=*)
   			key="${i#*=}"
   			;;
   		-m=*|--mode=*)
   			mode="${i#*=}"
   			;;
   		-v=*|--value=*)
   			value="${i#*=}"
   			;;
   		-o=*|--output=*)
   		 	output="${i#*=}"
   			;;
   		-h|--help)
   			# Print help.
   			print_usage
   			;;
   		*)
   			# Unknown argument.
   			catch_err "6" "" "$i" && $exit_mode $error_code
   			;;
		esac
	done
else
	# User sent no arguments.
	catch_err "1" && $exit_mode $error_code
fi

if [ "$output" != "STDIN" ] && [ "$output" != "auto" ];then
	output="${output/\\/}" && output="${output%${output##*[![:space:]]}}"
	mkdir -p "${output%/*}"
fi

if [ "$mode" == "read" ] || [ -z $mode ];then
	if [ ! -z $file ];then
		file="${file/\\/}" && file="${file%${file##*[![:space:]]}}"
		if [ -f "$file" ];then
		r="$(awk "/$key/{getline; print}" "$file")" && r="${r#"${r%%[![:blank:]]*}"}"
			if [ "$output" == "auto" ] || [ "$output" == "STDIN" ];then
				if [ "$r" != "" ];then
					echo "$r"
				else
					catch_err "2" && $exit_mode $error_code
				fi
			else
				if [ "$r" != "" ];then
					echo "$r" > "$output"
				else
					catch_err "2" && $exit_mode $error_code
				fi
			fi
		else
			# File does not exist
			catch_err "3" && $exit_mode $error_code
		fi
	else
		# No filepath supplied.
		catch_err "1" && $exit_mode $error_code
	fi
elif [ "$mode" == "write" ];then
	if line="$(grep -n "$key" "$file")";then
		linenr="$((${line/:*/}+1))"
		line="${line/*:/}"
		
		if [ "$output" == "auto" ] && [ "$output" != "STDIN" ];then
			sed -i '' -e "$linenr s%>.*</%>$value</%" "$file"
		else
			sed -e "$linenr s%>.*</%>$value</%" "$file"
		fi
	else
		# Didnt find key.
		catch_err "2" && $exit_mode $error_code
	fi
else
	# If mode isnt supported. 
	catch_err "4" && $exit_mode $error_code
fi