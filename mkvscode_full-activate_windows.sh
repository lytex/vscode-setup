# Change CONDA_PATH to match your local installation
# $HOMEPATH is C:\Users\{username}, 
# $LOCALAPPDATA is C:\Users\{username}\AppData\Local
# see https://stackoverflow.com/a/39917371 for more system variables

# Windows strings, use \\
CONDA_PATH="$LOCALAPPDATA\\Continuum\\Anaconda3"
ACTIVATE_PATH="$CONDA_PATH\\Scripts\\Activate.bat"

# bash strings, use /
CONDA_PATH_BASH="/$(echo $CONDA_PATH | sed s/\\\\/\\//g | sed s/://g)"
VENV_PREPATH="/envs"
VENV_POSTPATH="Lib/venv/scripts/common/"
venvs=$(echo $CONDA_PATH_BASH$VENV_PREPATH/*)
for venv in $venvs; do
	echo "$venv/$VENV_POSTPATH"
	venv_script="$venv/full-activate.bat"
	if [ ! -f "$venv_script" ]; then
		echo "Creating full-activate script at $venv_script"
		echo -e "call $ACTIVATE_PATH\r\ncall conda activate $(basename $venv)\r\nipython3" > "$venv_script"
	else
		echo "File already exists at $venv_script" 
		rm "$venv_script"
	fi

	if [ ! -x "$venv_script" ]; then
		echo "Making full-activate script at $venv_script executable"
		chmod +x "$venv_script"
	fi
done
