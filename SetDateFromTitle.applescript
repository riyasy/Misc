(* 

Batch change the timestamp of multiple files at once
When files from old cameras are imported 
into Photos app, the date of the file gets set
to the imported time. Ideally we expect the time
to be taken from the exif or from the created or
modified time stamp. But this doesn't happen for 
some files.
This causes the file to be shown on the wrong 
time line. Taking each photo or video  and adjusting the 
timestamp is difficult.
This script takes the timestamp from the filename
and sets it to date attribute which is used by
Photos app.
The script requires the filename to start with 
the following format
YYYYMMDD_HHMMSS.
If your current file name is not in this format,
please use some tool to change it to that format
first.
I use Advanced Renamer tool in Windows.
I usually rename all photos/videos from
all my photos and cameras in this format
for easy searching.

Some Ideas were borrowed from these links.
https://gist.github.com/RichardHyde/3386ac57b55455b71140
https://discussions.apple.com/docs/DOC-250000327

*)



(* select at least 1 file in Photos *)
tell application "Photos"
	activate
	set selectedFile to (get selection)
	if (selectedFile is {}) or (the length of selectedFile < 1) then
		error "Please select at least one image."
	else
		
		repeat with i from 1 to count of selectedFile
			
			set currentFile to item i of selectedFile
			set currentFileTimeStamp to (the date of currentFile) as date
			
			set currentFileFileName to filename of currentFile
			
			set adjustedTimeStamp to the current date
			set the month of adjustedTimeStamp to (1 as integer)
			set the day of adjustedTimeStamp to (1 as integer)
			
			set the year of adjustedTimeStamp to (text 1 thru 4 of currentFileFileName)
			set the month of adjustedTimeStamp to (text 5 thru 6 of currentFileFileName)
			set the day of adjustedTimeStamp to (text 7 thru 8 of currentFileFileName)
			
			set the time of adjustedTimeStamp to 0
			
			set the hours of adjustedTimeStamp to (text 10 thru 11 of currentFileFileName)
			set the minutes of adjustedTimeStamp to (text 12 thru 13 of currentFileFileName)
			set the seconds of adjustedTimeStamp to (text 14 thru 15 of currentFileFileName)
			
			
			tell currentFile
				set the date of currentFile to (adjustedTimeStamp) as date
			end tell
			
			
		end repeat
	end if
	return "Adjusted the date and time of " & (the length of selectedFile) & " videos"
end tell

