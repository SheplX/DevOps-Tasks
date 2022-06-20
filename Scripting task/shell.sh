echo "+--------------------------------------------------------------------------------------------------------------+"
echo "| ● Write a Bash shell or a python script which can:                                                           |"
echo "|   -Process a text file which has users and their properties in each line.                                    |"
echo "|   -Determine one by one if the ID number of the user (last column) is odd or even number if it's specified.  |"
echo "+--------------------------------------------------------------------------------------------------------------+"

input="test.txt"
while read -r _ _ rec_column3                              # checks record 3
do
  if [[ -z "$rec_column3" ]]; then                         # if record 3 is null, return invalid
    echo "This ID not found"; 
  elif ! [[ $rec_column3 =~ ^[0-9]+$ ]] ; then             # if record 3 is not a number, return not a number
    echo "This ID : '$rec_column3' is not a number";
  elif [[ $((rec_column3 % 2)) -eq 0 ]]; then              # if record 3 can divided by 2 & = 0, return its even
    echo "This ID : '$rec_column3' is EVEN";
  else 
    echo "This ID : '$rec_column3' is ODD"                 # else, return odd
  fi     
done < $input                                              # ending loop

echo "+---------------------------------------------------------------------------------------------------------------+"
echo "| ● Check whether that user has a routable, FQDN email address.                                                 |"
echo "|   - If so, write a message to stdout like: the ID of EMAIL is even|odd number.                                |"
echo "|   - If the user has no valid email address OR user ID, the script should silently continue to the next user.  |"
echo "+---------------------------------------------------------------------------------------------------------------+"

input="test.txt" 
regex='.com'                                                                            # regular expression menu
while read -r rec_column1 rec_column2 rec_column3                                       # checks record 2 record 3
do
    if [[ -z $rec_column3 ]]                                                            # if record 3 is empty, check next line
    then
        continue
    fi
    if [[ $rec_column2 =~ $regex ]]                                                     # if record 2 have anything from regex ".com" enter to the next condition
    then
      if [[ $((rec_column3 % 2)) -eq 0 ]]                                               # if record 3 can divided by 2 & = 0, return its even
      then
        echo "The email address of user : '$rec_column1' is valid and its ID is EVEN";
      else                                                                              # else, return odd
        echo "The email address of user : '$rec_column1' is valid and its ID is ODD"; 
      fi
    else                                                                                # else, continue
      continue
    fi
done < $input                                                                           # ending loop
echo "+---------------------------------------------------------------------------------------------------------------+"
