Public Sub SaveAttachments()
Dim objOL As Outlook.Application
Dim objMsg As Outlook.MailItem 'Object
Dim objAttachments As Outlook.Attachments
Dim objSelection As Outlook.Selection
Dim i As Long
Dim lngCount As Long
Dim strFile As String
Dim strFolderpath As String
Dim strDeletedFiles As String

    ' Get the path to your My Documents folder
    strFolderpath = CreateObject("WScript.Shell").SpecialFolders(16)
    On Error Resume Next

    ' Instantiate an Outlook Application object.
    Set objOL = Application

    ' Get the collection of selected objects.
    Set objSelection = objOL.ActiveExplorer.Selection

' The attachment folder needs to exist
' You can change this to another folder name of your choice

    ' Set the Attachment folder.
    strFolderpath = strFolderpath & "\OLAttachments\"

    ' Check each selected item for attachments.
    For Each objMsg In objSelection

    Set objAttachments = objMsg.Attachments
    lngCount = objAttachments.Count
        
    If lngCount > 0 Then
    
    ' Use a count down loop for removing items
    ' from a collection. Otherwise, the loop counter gets
    ' confused and only every other item is removed.
    
    For i = lngCount To 1 Step -1
    
    ' Get the file name.
    strFile = objAttachments.Item(i).FileName
    
    dtDate = objMsg.SentOn
    sName = Format(dtDate, "yyyymmdd", vbUseSystemDayOfWeek, vbUseSystem)
    

    
    ' Combine with the path to the Temp folder.
    strFile = strFolderpath & sName & "\" & strFile
    
   CreateDir (strFolderpath & sName)
    
    ' Save the attachment as a file.
    objAttachments.Item(i).SaveAsFile strFile
    
    Next i
    End If
    
    Next
    
ExitSub:

Set objAttachments = Nothing
Set objMsg = Nothing
Set objSelection = Nothing
Set objOL = Nothing
End Sub

Sub CreateDir(strPath As String)
    Dim elm As Variant
    Dim strCheckPath As String

    strCheckPath = ""
    For Each elm In Split(strPath, "\")
        strCheckPath = strCheckPath & elm & "\"
        If Len(Dir(strCheckPath, vbDirectory)) = 0 Then MkDir strCheckPath
    Next
End Sub
