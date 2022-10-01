# Hawkey-HDR
Combined 2 and 3 HDR exposures into single directory.  

It produces images with 3 exposures. The first image has
exp = normal
Second image has exp = normal * 2^(increment)  
And the third image has exp = normal / 2^(increment + decrement)
In both 2 or 3 exposure mode all bright and dark images are stored in  
alternative sequences in the same directory.
Example 2 exp:
1-bright,2-dark,3-bright,4-dark,...
Example 3 exp:
1-normal,2-bright,3-dark,4-normal,5-bright,6-dark,...
The Increment and Decrement Exposure values were added in this version so that it is possible to control  
the exposure increase from normal and decrease from normal separately.  
  
This High Definition HDR app was made specifically to work with the Imagingsource UX178 camera.  
This particular camera has a double trigger requirement i.e. the trigger has to be applied twice to set the new exposure.  
Thus, for HDR 2EXP, 4 triggers are required to get the low and high exposure imagees,
and conversly for 3EXP 6 triggers are required.
The Hawkeye MSP430 fw was also modified to provide the 3 and 3 exposure selection.  
The selection is done by the REWIND switch. 
The REWIND switch is normally used to rewind film with the RUN switch turned off.
With the RUN switch ON, the REWIND switch has no affect normally, but in this version it  
is used to switch between the 2EXP and 3EXP mode.  
REWIND OFF - 2EXP mode  
REWIND ON - 3EXP mode  
Important note:
When stopping the Hawkeye turn the RUN switch off before the REWIND switch. Failing  
to do that may result in the last dark image missing.

Note: Hawkeye board V12 or higher and MSP FW are required for proper HDR operation to 
provide four or six camera triggers for a single external trigger. 
The firmware is available here. Download the workspace_v9.zip file and extract it
somewhere in the local drive.  
Then in Code Composer use File->Switch Workspace to load in this new wokspace.
The project that you want to build is  
freq_gen_12_hdr_ux178_2-3exp  
 
Usage:  
To run the sw download the files from this repo and go to the  HDR-UX178-1DIR-2-3-EXP-COMBINED-V1\HDR
.../bin/Release  
and run the HDR1.exe file.
The Device Settings window will pop up.  
Select the device and resolution as required and click OK.  
The Device Window will close and the app window will pop up.  

The directory path is set by the Path button. 
![Snap11](https://user-images.githubusercontent.com/48537944/143714863-9bede78c-5a75-41da-941d-d05f7d7bab9e.jpg)


The image numbering will be sequential. If you want the start number different than 1  
then enter it in the Img Number field or use the arrows.  
This can come in handy if the scan is stopped and restarted.
   
Then click on Trigger buton a few times.  
It will go from red to white. Leave it white for free run.  
Click Start.  
The camera preview will be displayed in the preview window.  
Click on ZoomIn and ZoomOut buttons and set the zoom as needed.  
Click on Settings button.  
The familiar camera settings will pop up.  
Set the color, partial scan etc  
Turn auto exposure off the exposure tab. The HDR runs in manual exposure. 
For 2EXP set the exposure somewhat overexposed so that the shadows are visible. 
Set Exp Dec to the number of stops times 10. I.e. for 1 stop decrement use number 10.
Do a test run to see if the decremnet is large enough to reduce the overexposure of bright areas.  
You can leave the settings window open or you can close it if no more adjustments are anticipated.
Click again on the Start button.
It should go white.  
Click on SaveConf button to save the device settings.  
Make sure the Start buttoon is not active, otherwise an exception will pop up.  
The next time when you run the app you can use the LoadConf to retrieve the settings.  
The settings are stored in device_state.txt file in the same directory where the app resides.  
Select the bit depth by clicking the Bit64 button. Do not do this if you want to leave the default 32 bit.
The Bit64 button will turn red indicating 64 bit mode.  
Make sure that the Start button is not active when you are doing this otherwise the app will crash.  
Essentially the start botton starts the live display and the bit depth and soem other camera critical settings can not be changed in Live mode.
Hit Load Exp to load the exposure value from the camera to the app.
Hit Disp Exp to see the actual exposure. This can be done at any point during scan.
Most of other settings can be changed in Live mode however.  
The SaveTiff button also can be set in Live mode.  
If SaveTiff button is active it will switch from default Jpeg format to Tiff.  

Click on Trigger button to activate external trigger.  
Click on ImgSave.  
It should turn red.(Keep an eye on this button when testing.  
It could flood your drive with images if trigger is left on FreeRun.  
Click on Start Button.  
The app is now ready for images.  
Run the scanner.
Scan Restarts
This app has the restart capability i.e. the scan can be stopped, the settings can be changed and then the scan can 
be continued from the point where it stopped. The Hawkeye firmware stays synched with the app so that the HDR sequence
stays in sync.
To restart the scan just turn off the Hawkeye RUN button. Turn off the app Start Button, Trigger and ImgSave in that  
order.  Turn Start back on and adjust the exposure etc to your liking.  
Once done turn Start off and then Trigger and ImgSave back on and finally Start back on.
Turn the Hawkeye RUN switch back on and the scan will resume back from where it stopped the
HDR image sequence will continue ininterrupted.  
It should be noted that the path and the image numbering sequence can be also changed before the Restart if 
that is required but should not be done while the can is running.  

BTW - you can run the scanner without running the Hawkeye. With the Hawkeye led on you can hit the  
sw trigger and that will save the images.  
![Snap9](https://user-images.githubusercontent.com/48537944/142745329-11937d96-d16c-446e-a617-2d46aa8a0a26.jpg)
The trigger has to be on and then the sw trigger button can be used to trigger the camera.  
Two triggers per imamge for 2EXP  
Three triggers per image for 3EXP  
This can be handy for troubleshooting of the issues.  

Note, once the scan process is complete you can use an app to convert the high and low images into HDR.  
The app that seems to work very well can be obtained from the following site: http://enblend.sourceforge.net/   
Download enfuse and use the enfuse-hdr.bat (included here in the repository) script to run combine the images.  
Alternatively, use the enfuse GUI. It is easier to use and it accepts many images.
http://software.bergmark.com/enfuseGUI/Main.html
There is also another app that might be worth looking into.
https://skylum.com/aurorahdr  

Additional notes:  
If tiff file transfer, is unreliable (occasional dropped frames), switch to jpeg. The difference is not perceptible not even on a large screen.The jpg files can be converted to a combined HDR tiff file, if needed, with Enfuse.

Can use basic script batch file to process 2 exposure HDR files in separate folders using Enfuse v4.2.
http://enblend.sourceforge.net/index.htm  
   
For single dir HDR use EnfuseGUI v2.1.3, this gui uses Enfuse v4.0 and makes the process very simple.
http://software.bergmark.com/enfuseGUI/Main.html

If one wanted to use the later command line Enfuse v4.2, there are included Droplets v0.2.1 by Erik Krause, there is also a newer v0.4.2 available, with added extra options like EXIF copy feature (not needed for this simple application). Because some changes have been made to Enfuse over time, these Enfuse droplets no longer function as they are, but with a very minor one line change, they still work.  
Change line from:- set enfuse_additional_parameters= --wExposure=1 --wSaturation=1 --wContrast=0  
To :- set enfuse_additional_parameters= --exposure-weight=1 --saturation-weight=0.2 --contrast-weight=0 --hard-mask  
http://www.erik-krause.de/enfuse_droplet.zip  
https://groups.google.com/g/hugin-ptx/c/3VuXOjVqZPk  

The TestBW button can be used to gather the image transfer process stats. If the stats show dropped transfers then  
your system is probably slow or you have a USB speed issue or poor quality USB cable or a few cables patches together.
Try running the performance tests on your computer. If it all fails then try to scan with Jpeg instead of Tiff.  
Possibly switching from 64 to 32 bit may help. 
