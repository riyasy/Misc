tell application "Photos"	set imageSel to selection	if imageSel is {} then		error "Please select an image."	else		set theNames to {"file start"}		repeat with im in imageSel			set end of theNames to filename of im		end repeat		set end of theNames to "file end"	end ifend tellset {TID, text item delimiters} to {text item delimiters, linefeed}set theNames to theNames as textset text item delimiters to TIDset testFile to POSIX path of (path to desktop) & "testFile.txt"try	set fileDescriptor to open for access testFile with write permission	write theNames to fileDescriptor	close access fileDescriptoron error	try		close testFile	end tryend try