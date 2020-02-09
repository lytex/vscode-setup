venvs=`echo $HOME/.virtualenvs/*/`
for venv in $venvs; do
	venv=`echo ${venv:: -1}`
	venv_script="$venv/bin/full-activate"
	if [ ! -f "$venv_script" ]; then
		echo "Creating full-activate script at $venv_script"
		echo -e ". $venv/bin/activate\nipython3" > "$venv_script"
	else
		echo "File already exists at $venv/bin/full-activate"  
	fi

	if [ ! -x "$venv_script" ]; then
		echo "Making full-activate script at $venv_script executable"
		chmod +x "$venv_script"
	fi
done
