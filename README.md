# PlistKeyMod

PlistKeyMod can either be used to retrieve or set a value of a key in a plist file. 

# Usage

## Examples
<br>
Example: `/PlistKeyMod.sh -f="$HOME/Desktop/example.plist" -k="CFBundleName"`
This will return the value of the key "CFBundleName".
<br>
Example: `/PlistKeyMod.sh -f="$HOME/Desktop/example.plist" -k="CFBundleName" -m="write" -v="Example"`
This will change the value of the key "CFBundleName" to "Example"
<br>

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
