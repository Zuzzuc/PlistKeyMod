# PlistKeyMod

PlistKeyMod can either be used to reterive or set a value of a key in a plist file. 

# Usage

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
#### This option will default to 'read' if not set.
<br>This option chooses what value to assign a key if mode is set to 'write'.<br><br>
Example: `/PlistKeyMod.sh -f=/PlistKeyMod.sh -f=example.plist -k=CFBundleName -`
<br><br><br>
