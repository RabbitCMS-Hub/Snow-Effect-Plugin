<%
'**********************************************
'**********************************************
'               _ _                 
'      /\      | (_)                
'     /  \   __| |_  __ _ _ __  ___ 
'    / /\ \ / _` | |/ _` | '_ \/ __|
'   / ____ \ (_| | | (_| | | | \__ \
'  /_/    \_\__,_| |\__,_|_| |_|___/
'               _/ | Digital Agency
'              |__/ 
' 
'* Project  : RabbitCMS
'* Developer: <Anthony Burak DURSUN>
'* E-Mail   : badursun@adjans.com.tr
'* Corp     : https://adjans.com.tr
'**********************************************
' LAST UPDATE: 28.10.2022 15:33 @badursun
'**********************************************

'**********************************************
' Class Structure for RabbitCMS PluginManagers
' 	- Private and Public Variables
' 	- class_register()
' 	- LoadPanel()
' 	- class_initialize()
' 	- class_terminate()
' 	- class_register()
' 	- GET PluginCode()
' 	- GET PluginName()
' 	- GET PluginVersion()
' 	- GET PluginCredits()

' 	- YOUR SUB/FUNC/PROPERTY
' 	- YOUR SUB/FUNC/PROPERTY
' 	- YOUR SUB/FUNC/PROPERTY
'**********************************************

' Response.Charset = "UTF-8"
' Response.Codepage = 65001
' Response.codepage = 1254
' Response.charset = "windows-1254"

Class Snow_Effect_Plugin
	Private PLUGIN_CODE, PLUGIN_DB_NAME, PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_CREDITS, PLUGIN_GIT, PLUGIN_DEV_URL, PLUGIN_FILES_ROOT, PLUGIN_ICON, PLUGIN_REMOVABLE, PLUGIN_ROOT, PLUGIN_FOLDER_NAME
	Private STATUS

	'---------------------------------------------------------------
	' Register Class
	'---------------------------------------------------------------
	Public Property Get class_register()
		DebugTimer ""& PLUGIN_CODE &" class_register() Start"
		
		' Check Register
		'------------------------------
		If CheckSettings("PLUGIN:"& PLUGIN_CODE &"") = True Then 
			DebugTimer ""& PLUGIN_CODE &" class_registered"
			Exit Property
		End If

		' Register Settings
		'------------------------------
		a=GetSettings("PLUGIN:"& PLUGIN_CODE &"", PLUGIN_CODE)
		a=GetSettings(""&PLUGIN_CODE&"_PLUGIN_NAME", PLUGIN_NAME)
		a=GetSettings(""&PLUGIN_CODE&"_CLASS", "Snow_Effect_Plugin")
		a=GetSettings(""&PLUGIN_CODE&"_REGISTERED", ""& Now() &"")
		a=GetSettings(""&PLUGIN_CODE&"_CODENO", "336")
		a=GetSettings(""&PLUGIN_CODE&"_ACTIVE", "0")
		a=GetSettings(""&PLUGIN_CODE&"_FOLDER", PLUGIN_FOLDER_NAME)

		' Plugin Settings
		'------------------------------

		' Register Settings
		'------------------------------
		DebugTimer ""& PLUGIN_CODE &" class_register() End"
	End Property
	'---------------------------------------------------------------
	' Register Class
	'---------------------------------------------------------------

	'---------------------------------------------------------------
	' Plugin Admin Panel Extention
	'---------------------------------------------------------------
	Public sub LoadPanel()
		'--------------------------------------------------------
		' Main Page
		'--------------------------------------------------------
		With Response
			'------------------------------------------------------------------------------------------
				PLUGIN_PANEL_MASTER_HEADER This()
			'------------------------------------------------------------------------------------------
			.Write "<div class=""row"">"
			.Write "    <div class=""col-lg-6 col-sm-12"">"
			.Write 			QuickSettings("select", ""& PLUGIN_CODE &"_OPTION_1", "Buraya Title", "0#Seçenek 1|1#Seçenek 2|2#Seçenek 3", TO_DB)
			.Write "    </div>"
			.Write "    <div class=""col-lg-6 col-sm-12"">"
			.Write 			QuickSettings("number", ""& PLUGIN_CODE &"_OPTION_2", "Buraya Title", "", TO_DB)
			.Write "    </div>"
			.Write "    <div class=""col-lg-12 col-sm-12"">"
			.Write 			QuickSettings("tag", ""& PLUGIN_CODE &"_OPTION_3", "Buraya Title", "", TO_DB)
			.Write "    </div>"
			.Write "</div>"
		End With
	End Sub
	'---------------------------------------------------------------
	'
	'---------------------------------------------------------------

	'---------------------------------------------------------------
	' Class First Init
	'---------------------------------------------------------------
	Private Sub class_initialize()
    	'-------------------------------------------------------------------------------------
    	' PluginTemplate Main Variables
    	'-------------------------------------------------------------------------------------
    	PLUGIN_CODE  			= "SNOWFALL"
    	PLUGIN_NAME 			= "Snow Effect Plugin"
    	PLUGIN_VERSION 			= "1.0.0"
    	PLUGIN_GIT 				= "https://github.com/RabbitCMS-Hub/Snow-Effect-Plugin"
    	PLUGIN_DEV_URL 			= "https://adjans.com.tr"
    	PLUGIN_FILES_ROOT 		= PLUGIN_VIRTUAL_FOLDER(This)
    	PLUGIN_ICON 			= "zmdi-pin-help"
    	PLUGIN_REMOVABLE 		= True
    	PLUGIN_CREDITS 			= "@badursun Anthony Burak DURSUN"
    	PLUGIN_ROOT 			= PLUGIN_DIST_FOLDER_PATH(This)
    	PLUGIN_FOLDER_NAME 		= "Snow-Effect-Plugin"

    	PLUGIN_DB_NAME 			= ""
    	'-------------------------------------------------------------------------------------
    	' PluginTemplate Main Variables
    	'-------------------------------------------------------------------------------------

    	STATUS = Cint( GetSettings(""&PLUGIN_CODE&"_ACTIVE", "0") )

    	If STATUS = 1 Then 
			PLUGIN_ADD_TO This, "JS", "js/snowfall.js"

    	End If

    	'-------------------------------------------------------------------------------------
    	' PluginTemplate Register App
    	'-------------------------------------------------------------------------------------
    	class_register()
	End Sub
	'---------------------------------------------------------------
	' Class First Init
	'---------------------------------------------------------------

	'---------------------------------------------------------------
	' Class Terminate
	'---------------------------------------------------------------
	Private sub class_terminate()

	End Sub
	'---------------------------------------------------------------
	' Class Terminate
	'---------------------------------------------------------------

	'---------------------------------------------------------------
	' Plugin Defines
	'---------------------------------------------------------------
	Public Property Get PluginCode() 		: PluginCode = PLUGIN_CODE 					: End Property
	Public Property Get PluginName() 		: PluginName = PLUGIN_NAME 					: End Property
	Public Property Get PluginVersion() 	: PluginVersion = PLUGIN_VERSION 			: End Property
	Public Property Get PluginGit() 		: PluginGit = PLUGIN_GIT 					: End Property
	Public Property Get PluginDevURL() 		: PluginDevURL = PLUGIN_DEV_URL 			: End Property
	Public Property Get PluginFolder() 		: PluginFolder = PLUGIN_FILES_ROOT 			: End Property
	Public Property Get PluginIcon() 		: PluginIcon = PLUGIN_ICON 					: End Property
	Public Property Get PluginRemovable() 	: PluginRemovable = PLUGIN_REMOVABLE 		: End Property
	Public Property Get PluginCredits() 	: PluginCredits = PLUGIN_CREDITS 			: End Property
	Public Property Get PluginRoot() 		: PluginRoot = PLUGIN_ROOT 					: End Property
	Public Property Get PluginFolderName() 	: PluginFolderName = PLUGIN_FOLDER_NAME 	: End Property
	Public Property Get PluginDBTable() 	: PluginDBTable = IIf(Len(PLUGIN_DB_NAME)>2, "tbl_plugin_"&PLUGIN_DB_NAME, "") 	: End Property

	Private Property Get This()
		This = Array(PluginCode, PluginName, PluginVersion, PluginGit, PluginDevURL, PluginFolder, PluginIcon, PluginRemovable, PluginCredits, PluginRoot, PluginFolderName, PluginDBTable )
	End Property
	'---------------------------------------------------------------
	' Plugin Defines
	'---------------------------------------------------------------




End Class 
%>
