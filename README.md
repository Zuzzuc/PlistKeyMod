# PlistKeyMod

PlistKeyMod.sh is used to extract and modify the values of specific keys in a plist file.

# Usage

## Examples
`/PlistKeyMod.sh -f="$HOME/Desktop/example.plist" -k="CFBundleName"`<br>
This will return the value of the key "CFBundleName".'<br>
<br>
`/PlistKeyMod.sh -f="$HOME/Desktop/example.plist" -k="CFBundleName" -m="write" -v="Example"`<br>
This will change the value of the key "CFBundleName" to "Example"<br>
## Arguments

### File
#### -f or --file
#### Requires a parameter
#### This option is REQUIRED for this script to work.
<br>This option chooses what file to perform actions on.<br><br>
Example: `/PlistKeyMod.sh -f=example.plist`
<br><br><br>

### Key
#### -k or --key
#### Requires a parameter
#### This option is REQUIRED for this script to work.
<br>This option chooses what key to perform actions on.<br><br>
Example: `/PlistKeyMod.sh -f=example.plist -k=CFBundleName`
<br><br><br>

### Mode
#### -m or --mode
#### Requires a parameter
#### This option will default to 'read' if not set.
<br>This option chooses what mode to use when performing actions on a file.<br>
Avaliable modes: 'read' and 'write'
<br><br>
If the mode is 'write', use -v to choose what to write.
<br><br>
Example: `/PlistKeyMod.sh -f=example.plist -k=CFBundleName -m=read`
<br><br><br>


### Value
#### -v or --value
#### This option is REQUIRED if mode is set to 'write'
<br>This option chooses what value to assign a key if mode is set to 'write'.<br><br>
Example: `/PlistKeyMod.sh -f=example.plist -k=CFBundleName -m=write -value=StringToAssign`
<br><br><br>

### Output
#### -o or --output
#### Requires a parameter
#### This option will default to 'auto' if not supplied.
<br>This option chooses where to send the result.<br><br>
There are three modes that the output option can handle. These are 'auto', 'STDIN', and 'filepath'<br><br>
The option 'auto' will print the result to stdin if the mode is read and will edit the file if the mode is write. The option 'STDIN' will cause any result to be printed to stdin, even if the mode is write. The last option is dynamic. Any absolute filepath ented will cause the script to print all result, except error messages, to the supplied path.<br>
Example: `/PlistKeyMod.sh -f=example.plist -k=CFBundleName -m=write -value=StringToAssign -o=STDIN`<br>
This will cause the whole plist file to be returened to stdin, but with changes made.<br><br>
Example: `/PlistKeyMod.sh -f=example.plist -k=CFBundleName -m=read -o=/tmp/result.txt`<br>
This will send the value of the key 'CFBundleName' to a file in /tmp/result.txt<br><br>

## Exit codes
0: Success
1: No file supplied.<br>
2: Specified key was not found in the file.<br>
3: Specified file does not exist.<br>
4: Unsupported mode recived.<br>
5: Specified file is not plist.<br>
6: Unknown argument recived.<br>
