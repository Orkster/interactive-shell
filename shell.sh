
. helpers.sh
. stat.sh

CREATE_USER "newOne"
SHOW_ME
UPDATE "cdExercise"
SHOW_ME
UPDATE "OH ITS WORK NICE"

SAVE_STAT


# exrcise for learning mkdir
function mkdirExercise {

	local input
	local correct="mkdir firstFolder"

	echo -e "\033[0;36mType 'mkdir firstFolder'"
	read -p "  -> " input

	function success {
		mkdir ./firstFolder
		echo -e "\033[0;32mCongratulations! Now you create your first folder!"
		echo -e "\033[0;33mmkdir\033[0m command is used for creating folders"
		echo -e "So in our case we created folder with name 'firstFolder'"
		next "cdExercise"
	}
	function error {
		restarting "mkdirExercise"
	}

	checkInput "$input" "$correct" success error
	
}

# exercise for learning cd
function cdExercise {

	local input
	local correct="cd firstFolder"

	echo -e "\033[0mCool! We have folder lets move into in"
	echo -e "\033[0;36mType 'cd firstFolder'"
	read -p "  ->  " input;

	function success {
		cd ./firstFolder
		echo -e "\033[0;32mCool. Now you in firstFolder, that you created before"
		next touchExercise
	}
	function error {
		restarting "cdExercise"
	}

	checkInput "$input" "$correct" success error
}

# exercise for learning touch command
function touchExercise {
	local input
	local correct="touch sample.txt"

	echo -e "\033[0mLets create one file in this folder"
	echo -e "\033[0;36mType 'touch sample.txt'"
	read -p "  -> " input

	function success {
		echo -e "\033[0;32mCool"
		touch ./sample.txt
		next "rmExercise"
	}
	function error {
		restarting "touchExercise"
	}

	checkInput "$input" "$correct" success error
}

# pwd exercise
function rmExercise {

	local input
	local correct="rm sample.txt"

	echo -e "\033[0mSo now you know how to create files and folders"
	echo -e "\033[0mLets learn how to delete files"
	echo -e "\033[0mLets delete sample.txt , that we create earlier"
	echo -e "\033[0;36mType 'rm sample.txt'"
	read -p "  -> " input

	function success {
		echo -e "\033[0;32mCool. You made it!"
		rm ./sample.txt
		next "pwdExercise"
	}
	function error {
		restarting "rmExercise"
	}

	checkInput "$input" "$correct" success error
}

function pwdExercise {
	local input
	local correct="pwd"

	echo -e "\033[0mIf you want to know in which folder you now,"
	echo -e "\033[0myou can type pwd command that display your current full path"
	echo -e "\033[0mLets try it"
	echo -e "\033[0;36mType 'pwd'"
	read -p "  -> " input

	function success {
		echo -e "\033[0mYour path : $(pwd)"
		echo -e "\033[0;32mNice! You made it!"
		rm ./sample.txt
	}
	function error {
		restarting "pwdExercise"
	}

	checkInput "$input" "$correct" success error
}

# loading next state
function next {
	local state=$1
	$state
}

# checking user input
function checkInput {

	local input=$1
	local success=$3
	local error=$4
	local correct=$2
	

	if [ "$input" = "$correct" ]; then
		$success
	elif [ "$input" = ":q" ]; then
		echo -e "\033[0mExit script..."
		exit 0;
	elif [ "$input" = ":h" ]; then
		echo -e "\033[0mauthor: Oleh Kuchuk version: 1.0"
	else
		$error
	fi
}

# restarting state on error
function restarting {
	local state=$1
	echo -e "\033[0;31mUncorrect input. Please, try again\033[0m"
	$state
}

function fancy_echo {
	local ftype=$1
	local text=$2

	case $ftype in 
		success ) ;;
		error ) ;;
		*) echo "error non type"
	esac
}

# inital function
function initialize {
	echo -e "\033[1;35mHolla, \033[0;33m$USER!\033[1;35m Welcome to interactive shell! \033[0m"
	echo -e "\033[1;35mDuring series of 10 tutorials you will learn basics of working with your shell"
	echo -e "So, Lets start!  \033[0m"
	echo -e "Type :q when you would like to exit script or :h for view script version  \033[0m"
	mkdirExercise
}

# initialize