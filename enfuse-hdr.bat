SET Input_PATCH1=c:\hdr\hi
SET Input_PATCH2=c:\hdr\lo
SET OUTPUT_PATCH=c:\hdr\out

SET start=2
SET end=18


FOR /L %%i IN (%start%,1,%end%) DO (CALL :loopbody %%i)
GOTO :eof


:loopbody
enfuse.exe --soft-mask --exposure-weight=1.0 --saturation-weight=0.2 --contrast-weight=0.0 --entropy-weight=0.0 --exposure-optimum=0.4 --exposure-width=0.2 -v -o "%OUTPUT_PATCH%\%1.tiff" "%Input_PATCH1%\%1.tiff" "%Input_PATCH2%\%1.tiff"
GOTO :eof