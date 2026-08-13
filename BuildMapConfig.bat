@echo off

set Source_Server=http://overpass.openstreetmap.ru/cgi/xapi_meta?
rem http://www.overpass-api.de/api/xapi_meta?
rem http://overpass.openstreetmap.ru/cgi/status STATUS
rem https://overpass.kumi.systems/api/xapi_meta?
rem https://overpass-api.de/api/map?bbox=-106.8736,28.2790,-105.2943,29.0358
rem https://api.openstreetmap.org/api/0.6/map?bbox=
rem %5B [ %5D ]
rem http://www.informationfreeway.org/api/0.6/*%5Bname=Sylt%5D
echo Source_Server 			%Source_Server%
set Home_DIR=C:\temp\DirectChihuahuaOSM\
echo Home_DIR 			%Home_DIR%
set osmosis_DIR=%Home_DIR%osmosis-0.49.2\bin\
echo osmosis_DIR 			%osmosis_DIR%
set osm_temp=%Home_DIR%osm-temp\
echo osm_temp 			%osm_temp%
set osmconvert=%Home_DIR%osmconvert64-0.8.8p.exe
echo osmconvert 			%osmconvert%
set Split_temp_DIR=%Home_DIR%split-temp\
echo Split_temp_DIR			%Split_temp_DIR%
set split_DIR=%Home_DIR%splitter-r654\
echo split_DIR 			%split_DIR%
set max_nodes=1600000
echo split max nodes			%max_nodes%
set mkgmap_DIR=%Home_DIR%mkgmap-r4924\
echo mkgmap_DIR 			%mkgmap_DIR% 
set draw_priority=15
echo draw priority 			%draw_priority% 
set max_jobs=5
echo mgmap max jobs 			%max_jobs% 
set Img_DIR=%Home_DIR%img\
echo Img_DIR 			%Img_DIR%
set DEM_DIR=%Home_DIR%dem\
echo DEM_DIR 			%DEM_DIR%
set input_DIR=%Home_DIR%input\
echo input_DIR 			%input_DIR%
set gmt="C:\Program Files (x86)\GMapTool\gmt\gmt.exe"
echo gmt 				%gmt%
set plain=c:\temp\ChihuahuaOSMPlain
echo plain 				%plain%
set full=c:\temp\ChihuahuaOSM
echo full 				%full%
set curves=C:\temp\DirectChihuahuaOSM\CurvasNivel
echo curves				%curves%