@echo off
rem ################################################################################
rem #                                                                              #
rem #  Script Name: BuidlMap.bat                                                   #
rem #  Description:                                                                #
rem #                                                                              #
rem # 1. Creates garmin maps from OSM info                                         #
rem # -109.344,25.414 to -102.054,34.306
rem #                                                                              #
rem ################################################################################

echo(
echo(
echo ....STARTING BuildMap.bat v2025-04-23 %TIME%
echo(

set Source_Server=http://overpass.openstreetmap.ru/cgi/xapi_meta?
rem http://www.overpass-api.de/api/xapi_meta?
rem http://overpass.openstreetmap.ru/cgi/status STATUS
rem https://overpass.kumi.systems/api/xapi_meta?
rem https://overpass-api.de/api/map?bbox=-106.8736,28.2790,-105.2943,29.0358
rem https://api.openstreetmap.org/api/0.6/map?bbox=
rem %5B [ %5D ]
rem http://www.informationfreeway.org/api/0.6/*%5Bname=Sylt%5D
echo Source_Server %Source_Server%
set Home_DIR=C:\temp\DirectChihuahuaOSM\
echo Home_DIR %Home_DIR%
set osmosis_DIR=%Home_DIR%osmosis-0.49.2\bin\
echo osmosis_DIR %osmosis_DIR%
set osm_temp=%Home_DIR%osm-temp\
echo osm_temp %osm_temp%
set osmconvert=%Home_DIR%osmconvert64-0.8.8p.exe
set Split_temp_DIR=%Home_DIR%split-temp\
echo Split_temp_DIR %Split_temp_DIR%
set split_DIR=%Home_DIR%splitter-r654\
echo split_DIR %split_DIR%
set mkgmap_DIR=%Home_DIR%mkgmap-r4923\
echo mkgmap_DIR %mkgmap_DIR% 
set Img_DIR=%Home_DIR%img\
echo Img_DIR %Img_DIR%
set DEM_DIR=%Home_DIR%dem\
echo DEM_DIR %DEM_DIR%
set input_DIR=%Home_DIR%input\
echo input_DIR %input_DIR%

echo(
java --version
echo(

rem its recomended use extract.bbbike.org extract (osm 7z) and extract to osmosis temp (Chihuahua.osm) to save steps get_data and join_section

IF "%~1"=="" goto usage
IF "%~1"=="10" goto get_data_section_10
IF "%~1"=="20" goto get_data_section_20
IF "%~1"=="30" goto get_data_section_30
IF "%~1"=="40" goto get_data_section_40
IF "%~1"=="50" goto get_data_section_50
IF "%~1"=="60" goto get_data_section_60
IF "%~1"=="70" goto get_data_section_70
IF "%~1"=="80" goto get_data_section_80
IF "%~1"=="90" goto get_data_section_90
IF "%~1"=="--split" goto split_section
IF "%~1"=="--make" goto mkgmap_section
IF "%~1"=="--join" goto join_section_osmosis

:usage

echo(
echo Option "%~1" not found
echo "BuildMap 10" get data section 10
echo "BuildMap 20" get data section 20
echo "BuildMap 30" get data section 30
echo "BuildMap 40" get data section 40
echo "BuildMap 50" get data section 50
echo "BuildMap 60" get data section 60
echo "BuildMap 70" get data section 70
echo "BuildMap 80" get data section 80
echo "BuildMap 90" get data section 90
echo "BuildMap --join"  go directly to join_section_osmosis
echo "BuildMap --split" go directly to split_section
echo "BuildMap --make"  go directly to mkgmap_section

echo .... exit 100 .... %TIME%
exit /b 100


rem curl --parallel --keepalive-time 5 --output C:\temp\DirectChihuahuaOSM\input\ChihuahuaOSM93.osm --url "http://overpass.openstreetmap.ru/cgi/xapi_meta?*%5Bbbox=-102.864,27.39,-102.054,28.378%%5D"

rem curl --parallel --keepalive-time 5 --output C:\temp\DirectChihuahuaOSM\input\ChihuahuaOSM83.osm --url "http://www.overpass-api.de/api/xapi_meta?*%5Bbbox=-103.674,27.39,-102.864,28.3

:get_data_section_10
echo(
echo GET OSM DATA 1 %TIME%
echo 51.9Mb average	
echo 11	105Mb 0:38
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM11.osm --url "%Source_Server%*%%5Bbbox=-109.344,25.414,-108.534,26.402%%5D"
echo 12	039Mb 0:23
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM12.osm --url "%Source_Server%*%%5Bbbox=-109.344,26.402,-108.534,27.39%%5D"
echo 13	025Mb 0:25
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM13.osm --url "%Source_Server%*%%5Bbbox=-109.344,27.39,-108.534,28.378%%5D"
echo 14	030Mb 0:16
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM14.osm --url "%Source_Server%*%%5Bbbox=-109.344,28.378,-108.534,29.366%%5D"
echo 15	024Mb 0:17
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM15.osm --url "%Source_Server%*%%5Bbbox=-109.344,29.366,-108.534,30.354%%5D"
echo 16	019Mb 0:11
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM16.osm --url "%Source_Server%*%%5Bbbox=-109.344,30.354,-108.534,31.342%%5D"
echo 17	135Mb 0:45
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM17.osm --url "%Source_Server%*%%5Bbbox=-109.344,31.342,-108.534,32.33%%5D"
echo 18	049Mb 0:22
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM18.osm --url "%Source_Server%*%%5Bbbox=-109.344,32.33,-108.534,33.318%%5D"
echo 19	074Mb 0:31
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM19.osm --url "%Source_Server%*%%5Bbbox=-109.344,33.318,-108.534,34.306%%5D"

rem goto join_section_osmconvert


:get_data_section_20
echo 21	113Mb 0:43
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM21.osm --url "%Source_Server%*%%5Bbbox=-108.534,25.414,-107.724,26.402%%5D"
echo 22	047Mb 0:21
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM22.osm --url "%Source_Server%*%%5Bbbox=-108.534,26.402,-107.724,27.39%%5D"
echo 23	037Mb 0:16
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM23.osm --url "%Source_Server%*%%5Bbbox=-108.534,27.39,-107.724,28.378%%5D"
echo 24	025Mb 0:15
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM24.osm --url "%Source_Server%*%%5Bbbox=-108.534,28.378,-107.724,29.366%%5D"
echo 25	029Mb 0:17
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM25.osm --url "%Source_Server%*%%5Bbbox=-108.534,29.366,-107.724,30.354%%5D"
echo 26	021Mb 0:15
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM26.osm --url "%Source_Server%*%%5Bbbox=-108.534,30.354,-107.724,31.342%%5D"
echo 27	027Mb 0:21
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM27.osm --url "%Source_Server%*%%5Bbbox=-108.534,31.342,-107.724,32.33%%5D"
echo 28	094Mb 0:42
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM28.osm --url "%Source_Server%*%%5Bbbox=-108.534,32.33,-107.724,33.318%%5D"
echo 29	067Mb 0:30
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM29.osm --url "%Source_Server%*%%5Bbbox=-108.534,33.318,-107.724,34.306%%5D"

rem goto join_section_osmconvert

:get_data_section_30
echo 31	054Mb 0:33
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM31.osm --url "%Source_Server%*%%5Bbbox=-107.724,25.414,-106.914,26.402%%5D"
echo 32	035Mb 0:21
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM32.osm --url "%Source_Server%*%%5Bbbox=-107.724,26.402,-106.914,27.39%%5D"
echo 33	039Mb 0:25
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM33.osm --url "%Source_Server%*%%5Bbbox=-107.724,27.39,-106.914,28.378%%5D"
echo 34	031Mb 0:10
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM34.osm --url "%Source_Server%*%%5Bbbox=-107.724,28.378,-106.914,29.366%%5D"
echo 35	020Mb 0:11
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM35.osm --url "%Source_Server%*%%5Bbbox=-107.724,29.366,-106.914,30.354%%5D"
echo 36	057Mb 0:29
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM36.osm --url "%Source_Server%*%%5Bbbox=-107.724,30.354,-106.914,31.342%%5D"
echo 37	059Mb 0:25
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM37.osm --url "%Source_Server%*%%5Bbbox=-107.724,31.342,-106.914,32.33%%5D"
echo 38	074Mb 0:28
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM38.osm --url "%Source_Server%*%%5Bbbox=-107.724,32.33,-106.914,33.318%%5D"
echo 39	090Mb 0:40
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM39.osm --url "%Source_Server%*%%5Bbbox=-107.724,33.318,-106.914,34.306%%5D"

goto join_section_osmconvert
rem pause

:get_data_section_40
echo GET OSM DATA 2 %TIME%
echo 38.0Mb average
echo 41	028Mb 0:15
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM41.osm --url "%Source_Server%*%%5Bbbox=-106.914,25.414,-106.104,26.402%%5D"
echo 42	031Mb 0:17
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM42.osm --url "%Source_Server%*%%5Bbbox=-106.914,26.402,-106.104,27.39%%5D"
echo 43	044Mb 0:21
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM43.osm --url "%Source_Server%*%%5Bbbox=-106.914,27.39,-106.104,28.378%%5D"
echo 44	075Mb 0:40
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM44.osm --url "%Source_Server%*%%5Bbbox=-106.914,28.378,-106.104,29.366%%5D"
echo 45	019Mb 0:23
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM45.osm --url "%Source_Server%*%%5Bbbox=-106.914,29.366,-106.104,30.354%%5D"
echo 46	018Mb 0:13
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM46.osm --url "%Source_Server%*%%5Bbbox=-106.914,30.354,-106.104,31.342%%5D"
echo 47	266Mb 1:24
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM47.osm --url "%Source_Server%*%%5Bbbox=-106.914,31.342,-106.104,32.33%%5D"
echo 48	043Mb 0:21
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM48.osm --url "%Source_Server%*%%5Bbbox=-106.914,32.33,-106.104,33.318%%5D"
echo 49	052Mb 0:29
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM49.osm --url "%Source_Server%*%%5Bbbox=-106.914,33.318,-106.104,34.306%%5D"

rem goto join_section_osmconvert

:get_data_section_50
echo 51	024Mb 0:13
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM51.osm --url "%Source_Server%*%%5Bbbox=-106.104,25.414,-105.294,26.402%%5D"
echo 52	043Mb 0:19
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM52.osm --url "%Source_Server%*%%5Bbbox=-106.104,26.402,-105.294,27.39%%5D"
echo 53	053Mb 0:21
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM53.osm --url "%Source_Server%*%%5Bbbox=-106.104,27.39,-105.294,28.378%%5D"
echo 54	058Mb 0:23
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM54.osm --url "%Source_Server%*%%5Bbbox=-106.104,28.378,-105.294,29.366%%5D"
echo 55	009Mb 0:09
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM55.osm --url "%Source_Server%*%%5Bbbox=-106.104,29.366,-105.294,30.354%%5D"
echo 56	018Mb 0:07
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM56.osm --url "%Source_Server%*%%5Bbbox=-106.104,30.354,-105.294,31.342%%5D"
echo 57	019Mb 0:15
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM57.osm --url "%Source_Server%*%%5Bbbox=-106.104,31.342,-105.294,32.33%%5D"
echo 58	047Mb 0:27
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM58.osm --url "%Source_Server%*%%5Bbbox=-106.104,32.33,-105.294,33.318%%5D"
echo 59	030Mb 0:17
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM59.osm --url "%Source_Server%*%%5Bbbox=-106.104,33.318,-105.294,34.306%%5D"

rem goto join_section_osmconvert

:get_data_section_60
echo 61	021Mb 0:10
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM61.osm --url "%Source_Server%*%%5Bbbox=-105.294,25.414,-104.484,26.402%%5D"
echo 62	020Mb 0:12
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM62.osm --url "%Source_Server%*%%5Bbbox=-105.294,26.402,-104.484,27.39%%5D"
echo 63	021Mb 0:13
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM63.osm --url "%Source_Server%*%%5Bbbox=-105.294,27.39,-104.484,28.378%%5D"
echo 64	015Mb 0:11
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM64.osm --url "%Source_Server%*%%5Bbbox=-105.294,28.378,-104.484,29.366%%5D"
echo 65	023Mb 0:16
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM65.osm --url "%Source_Server%*%%5Bbbox=-105.294,29.366,-104.484,30.354%%5D"
echo 66	019Mb 0:11
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM66.osm --url "%Source_Server%*%%5Bbbox=-105.294,30.354,-104.484,31.342%%5D"
echo 67	023Mb 0:17
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM67.osm --url "%Source_Server%*%%5Bbbox=-105.294,31.342,-104.484,32.33%%5D"
echo 68	022Mb 0:20
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM68.osm --url "%Source_Server%*%%5Bbbox=-105.294,32.33,-104.484,33.318%%5D"
echo 69	035Mb 0:20
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM69.osm --url "%Source_Server%*%%5Bbbox=-105.294,33.318,-104.484,34.306%%5D"

goto join_section_osmconvert
rem pause

:get_data_section_70
echo GET OSM DATA 3 %TIME%
echo 19.0Mb average
echo 71	016Mb 0:11
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM71.osm --url "%Source_Server%*%%5Bbbox=-104.484,25.414,-103.674,26.402%%5D"
echo 72	009Mb 0:06
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM72.osm --url "%Source_Server%*%%5Bbbox=-104.484,26.402,-103.674,27.39%%5D"
echo 73	007Mb 0:04
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM73.osm --url "%Source_Server%*%%5Bbbox=-104.484,27.39,-103.674,28.378%%5D"
echo 74	021Mb 0:10
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM74.osm --url "%Source_Server%*%%5Bbbox=-104.484,28.378,-103.674,29.366%%5D"
echo 75	029Mb 0:21
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM75.osm --url "%Source_Server%*%%5Bbbox=-104.484,29.366,-103.674,30.354%%5D"
echo 76	022Mb 0:12
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM76.osm --url "%Source_Server%*%%5Bbbox=-104.484,30.354,-103.674,31.342%%5D"
echo 77	057Mb 0:17
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM77.osm --url "%Source_Server%*%%5Bbbox=-104.484,31.342,-103.674,32.33%%5D"
echo 78	135Mb 0:31
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM78.osm --url "%Source_Server%*%%5Bbbox=-104.484,32.33,-103.674,33.318%%5D"
echo 79	015Mb 0:12
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM79.osm --url "%Source_Server%*%%5Bbbox=-104.484,33.318,-103.674,34.306%%5D"

rem goto join_section_osmconvert

:get_data_section_80
echo 81	078Mb 0:33
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM81.osm --url "%Source_Server%*%%5Bbbox=-103.674,25.414,-102.864,26.402%%5D"
echo 82	007Mb 0:08
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM82.osm --url "%Source_Server%*%%5Bbbox=-103.674,26.402,-102.864,27.39%%5D"
echo 83	005Mb 0:04
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM83.osm --url "%Source_Server%*%%5Bbbox=-103.674,27.39,-102.864,28.378%%5D"
echo 84	021Mb 0:11
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM84.osm --url "%Source_Server%*%%5Bbbox=-103.674,28.378,-102.864,29.366%%5D"
echo 85	026Mb 0:14
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM85.osm --url "%Source_Server%*%%5Bbbox=-103.674,29.366,-102.864,30.354%%5D"
echo 86	029Mb 0:15
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM86.osm --url "%Source_Server%*%%5Bbbox=-103.674,30.354,-102.864,31.342%%5D"
echo 87	132Mb 0:16
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM87.osm --url "%Source_Server%*%%5Bbbox=-103.674,31.342,-102.864,32.33%%5D"
echo 88	126Mb 0:16
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM88.osm --url "%Source_Server%*%%5Bbbox=-103.674,32.33,-102.864,33.318%%5D"
echo 89	016Mb 0:12
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM89.osm --url "%Source_Server%*%%5Bbbox=-103.674,33.318,-102.864,34.306%%5D"

rem goto join_section_osmconvert

:get_data_section_90
echo 91	011Mb 0:13
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM91.osm --url "%Source_Server%*%%5Bbbox=-102.864,25.414,-102.054,26.402%%5D"
echo 92	010Mb 0:07
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM92.osm --url "%Source_Server%*%%5Bbbox=-102.864,26.402,-102.054,27.39%%5D"
echo 93	005Mb 0:03
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM93.osm --url "%Source_Server%*%%5Bbbox=-102.864,27.39,-102.054,28.378%%5D"
echo 94	010Mb 0:06
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM94.osm --url "%Source_Server%*%%5Bbbox=-102.864,28.378,-102.054,29.366%%5D"
echo 95	021Mb 0:08
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM95.osm --url "%Source_Server%*%%5Bbbox=-102.864,29.366,-102.054,30.354%%5D"
echo 96	022Mb 0:14
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM96.osm --url "%Source_Server%*%%5Bbbox=-102.864,30.354,-102.054,31.342%%5D"
echo 97	099Mb 0:37
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM97.osm --url "%Source_Server%*%%5Bbbox=-102.864,31.342,-102.054,32.33%%5D"
echo 98	051Mb 0:24
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM98.osm --url "%Source_Server%*%%5Bbbox=-102.864,32.33,-102.054,33.318%%5D"
echo 99	030Mb 0:17
cmd /c curl.exe --parallel --keepalive-time 5 --output %input_DIR%ChihuahuaOSM99.osm --url "%Source_Server%*%%5Bbbox=-102.864,33.318,-102.054,34.306%%5D"

rem pause

goto join_section_osmconvert

:join_section_osmosis
echo(
echo JOIN THE DATA - multiple osm files into one and trim using osmosis %TIME%
echo(

REM a file not found error in the next steps could be a Java misconfiguration
@echo on
cmd /c %osmosis_DIR%osmosis.bat^
 --rx %input_DIR%ChihuahuaOSM11.osm --rx %input_DIR%ChihuahuaOSM12.osm --rx %input_DIR%ChihuahuaOSM13.osm --rx %input_DIR%ChihuahuaOSM14.osm --rx %input_DIR%ChihuahuaOSM15.osm --rx %input_DIR%ChihuahuaOSM16.osm --rx %input_DIR%ChihuahuaOSM17.osm --rx %input_DIR%ChihuahuaOSM18.osm --rx %input_DIR%ChihuahuaOSM19.osm^
 --rx %input_DIR%ChihuahuaOSM21.osm --rx %input_DIR%ChihuahuaOSM22.osm --rx %input_DIR%ChihuahuaOSM23.osm --rx %input_DIR%ChihuahuaOSM24.osm --rx %input_DIR%ChihuahuaOSM25.osm --rx %input_DIR%ChihuahuaOSM26.osm --rx %input_DIR%ChihuahuaOSM27.osm --rx %input_DIR%ChihuahuaOSM28.osm --rx %input_DIR%ChihuahuaOSM29.osm^
 --rx %input_DIR%ChihuahuaOSM31.osm --rx %input_DIR%ChihuahuaOSM32.osm --rx %input_DIR%ChihuahuaOSM33.osm --rx %input_DIR%ChihuahuaOSM34.osm --rx %input_DIR%ChihuahuaOSM35.osm --rx %input_DIR%ChihuahuaOSM36.osm --rx %input_DIR%ChihuahuaOSM37.osm --rx %input_DIR%ChihuahuaOSM38.osm --rx %input_DIR%ChihuahuaOSM39.osm^
 --rx %input_DIR%ChihuahuaOSM41.osm --rx %input_DIR%ChihuahuaOSM42.osm --rx %input_DIR%ChihuahuaOSM43.osm --rx %input_DIR%ChihuahuaOSM44.osm --rx %input_DIR%ChihuahuaOSM45.osm --rx %input_DIR%ChihuahuaOSM46.osm --rx %input_DIR%ChihuahuaOSM47.osm --rx %input_DIR%ChihuahuaOSM48.osm --rx %input_DIR%ChihuahuaOSM49.osm^
 --rx %input_DIR%ChihuahuaOSM51.osm --rx %input_DIR%ChihuahuaOSM52.osm --rx %input_DIR%ChihuahuaOSM53.osm --rx %input_DIR%ChihuahuaOSM54.osm --rx %input_DIR%ChihuahuaOSM55.osm --rx %input_DIR%ChihuahuaOSM56.osm --rx %input_DIR%ChihuahuaOSM57.osm --rx %input_DIR%ChihuahuaOSM58.osm --rx %input_DIR%ChihuahuaOSM59.osm^
 --rx %input_DIR%ChihuahuaOSM61.osm --rx %input_DIR%ChihuahuaOSM62.osm --rx %input_DIR%ChihuahuaOSM63.osm --rx %input_DIR%ChihuahuaOSM64.osm --rx %input_DIR%ChihuahuaOSM65.osm --rx %input_DIR%ChihuahuaOSM66.osm --rx %input_DIR%ChihuahuaOSM67.osm --rx %input_DIR%ChihuahuaOSM68.osm --rx %input_DIR%ChihuahuaOSM69.osm^
 --rx %input_DIR%ChihuahuaOSM71.osm --rx %input_DIR%ChihuahuaOSM72.osm --rx %input_DIR%ChihuahuaOSM73.osm --rx %input_DIR%ChihuahuaOSM74.osm --rx %input_DIR%ChihuahuaOSM75.osm --rx %input_DIR%ChihuahuaOSM76.osm --rx %input_DIR%ChihuahuaOSM77.osm --rx %input_DIR%ChihuahuaOSM78.osm --rx %input_DIR%ChihuahuaOSM79.osm^
 --rx %input_DIR%ChihuahuaOSM81.osm --rx %input_DIR%ChihuahuaOSM82.osm --rx %input_DIR%ChihuahuaOSM83.osm --rx %input_DIR%ChihuahuaOSM84.osm --rx %input_DIR%ChihuahuaOSM85.osm --rx %input_DIR%ChihuahuaOSM86.osm --rx %input_DIR%ChihuahuaOSM87.osm --rx %input_DIR%ChihuahuaOSM88.osm --rx %input_DIR%ChihuahuaOSM89.osm^
 --rx %input_DIR%ChihuahuaOSM91.osm --rx %input_DIR%ChihuahuaOSM92.osm --rx %input_DIR%ChihuahuaOSM93.osm --rx %input_DIR%ChihuahuaOSM94.osm --rx %input_DIR%ChihuahuaOSM95.osm --rx %input_DIR%ChihuahuaOSM96.osm --rx %input_DIR%ChihuahuaOSM97.osm --rx %input_DIR%ChihuahuaOSM98.osm --rx %input_DIR%ChihuahuaOSM99.osm^
 --merge --merge --merge --merge --merge --merge --merge --merge --merge^
 --merge --merge --merge --merge --merge --merge --merge --merge --merge^
 --merge --merge --merge --merge --merge --merge --merge --merge --merge^
 --merge --merge --merge --merge --merge --merge --merge --merge --merge^
 --merge --merge --merge --merge --merge --merge --merge --merge --merge^
 --merge --merge --merge --merge --merge --merge --merge --merge --merge^
 --merge --merge --merge --merge --merge --merge --merge --merge --merge^
 --merge --merge --merge --merge --merge --merge --merge --merge --merge^
 --merge --merge --merge --merge --merge --merge --merge --merge^
 --bounding-box top=34.304 left=-109.344 bottom=25.414 right=-102.053 --sort --write-xml %osm_temp%Chihuahua.osm

@echo off
 rem --wx %Home_DIR%ChihuahuaOSM.osm
IF %ERRORLEVEL% NEQ 0 ( 
	echo ....ERROR 100 - %ERRORLEVEL%....%TIME%
	exit /b 100
)
REM error on wrong number of merges (merges must be one less than files)
REM org.openstreetmap.osmosis.core.OsmosisRuntimeException: The following named pipes () and 35 default pipes have not been terminated with appropriate output sinks.
REM error on osm data faulty
REM SEVERE: Thread for task 1-rx failed
REM org.openstreetmap.osmosis.core.OsmosisRuntimeException: An output error has occurred, aborting.

REM org.openstreetmap.osmosis.core.pipeline.common.ActiveTaskManager waitForCompletion
REM org.openstreetmap.osmosis.core.Osmosis main
REM SEVERE: Execution aborted.
REM ????


goto split_section


:split_section
echo(
echo SPLIT SECTION - make osm into pbf %TIME%
echo(


rem java -jar C:\temp\DirectChihuahuaOSM\splitter-r653\splitter.jar --help
@echo on
del /q %Split_temp_DIR%

@echo(

java -jar %split_DIR%splitter.jar --resolution=13 --max-areas=512 --max-threads=5 --max-nodes=2400000 --mapid=24740001 --precomp-sea=%Home_DIR%sea-latest.zip^
 --geonames-file=%Home_DIR%cities15000.zip --output-dir=%Split_temp_DIR% %osm_temp%Chihuahua.osm
@echo off


IF %ERRORLEVEL% NEQ 0 ( 
	echo ....ERROR 300 - %ERRORLEVEL% .... %TIME%
	exit /b 300
)

rem cities file https://download.geonames.org/export/dump/


rem styles
rem 	
rem https://github.com/wosch/bbbike-world/tree/world/etc/mkgmap/style
rem https://github.com/ligfietser/mkgmap-style-sheets/tree/master/styles/Openfietsmap%20full
rem https://github.com/Jorisbo/Mkgmap-Mapnik-Style-Garmin
rem https://github.com/aiomaster/aiostyles
rem https://wiki.openstreetmap.org/wiki/GroundTruth_Standard_Garmin_Types



:mkgmap_section
echo(
echo MKGMAP SECTION - make pbf into img %TIME%
echo(	

@echo on

del /q %Img_DIR%

@echo(

java -jar %mkgmap_DIR%mkgmap.jar --verbose --max-jobs=5 --keep-going --family-id=6775 --product-id=1 --remove-short-arcs --route --location-autofill=bounds,is_in,nearest^
 --index --show-profiles=1 --make-opposite-cycleways --housenumbers --generate-sea=land-tag=natural=land  --precomp-sea=%Home_DIR%sea-latest.zip^
 --bounds=%Home_DIR%bounds-latest.zip --output-dir=%Img_DIR% --mapname=24740001 --area-name="Chihuahua" --code-page=1252 --improve-overview --order-by-decreasing-area^
 --allow-reverse-merge --remove-ovm-work-files "--style-file=%Home_DIR%styles\default" --check-styles --dem=%DEM_DIR% --dem-dists=3312,13248,26512,53024 --dem-interpolation=auto^
 --family-name="ChihuahuaOSM crisol.snowdrift175@passinbox.com" --process-destination --process-exits ^
 --fix-roundabout-direction --merge-lines --polygon-size-limits=24:12,18:10,16:8 --drive-on=detect,right --copyright-message=" crisol.snowdrift175@passinbox.com "^
 --region-name="Chihuahua Texas New Mexico Coahuila Durango OSM" --draw-priority=15 --levels=0:24,1:22,2:20,3:18,4:16,5:14 --make-poi-index^
 --link-pois-to-ways --split-name-index --road-name-config=%Home_DIR%styles\roadNameConfig.txt^
 --add-pois-to-areas --pois-to-areas-placement="entrance=main;entrance=yes;building=entrance" -add-pois-to-lines=mid^
 --overview-dem-dist=276160 %Split_temp_DIR%*.pbf

@echo off

IF %ERRORLEVEL% NEQ 0 ( 
	echo ....ERROR 400 - %ERRORLEVEL% .... %TIME%
	exit /b 400
)

rem bounds and sea preconfig files https://www.thkukuk.de/osm/data/

rem --bounds=%Home_DIR%bounds-latest.zip --output-dir=%Img_DIR% --mapname=24740001 --area-name="Chihuahua" --code-page=1252 --improve-overview --order-by-decreasing-area^
rem C:\temp\DirectChihuahuaOSM\styles\default\CFMaster.TYP
rem --dem-interpolation=auto
rem --dem-interpolation=bilinear
rem --levels=0:24,1:22,2:20,3:18,4:16,5:14
rem --overview-levels = 4:17,5:16,6:15,7:14,8:13 
rem --dem-dists=3312,13248,26512,53024
rem --overview-dem-dist=276160 349MB 
rem --overview-dem-dist=165580
rem --overview-dem-dist=55000  349MB 669MB
rem --preserve-element-order ^
rem --link-pois-to-ways make barriers part of routes
rem --transparent (makes it not routable)
rem --hide-gmapsupp-on-pc sets bit to not copy from device to pc
rem --description="Chihuahua Texas New Mexico Coahuila Durango OSM" 
rem --gmapsupp --hide-gmapsupp-on-pc 
rem -reduce-point-density=4 --reduce-point-density-polygon=8
rem --add-pois-to-areas --pois-to-areas-placement="entrance=main;entrance=yes;building=entrance" -add-pois-to-lines=mid^
rem --simplify-lines=23:2.6,22:4.2,21:5.4,20:6 --simplify-polygons=23:2.6,22:4.2,21:5.4,20:6
rem --split-name-index #increase index size but improves search?

rem start javaw.exe -Xmx12G -Djava.util.logging.config.file=logging.properties --add-opens java.base/java.util=ALL-UNNAMED -jar OsmAndMapCreator.jar

REM disable next line if osmand map should be created
goto end_section

:OsmAnd_Map_Creator
echo(
%Home_DIR%\makeOsmAnd.bat


IF %ERRORLEVEL% NEQ 0 ( 
	echo ....ERROR 500 - %ERRORLEVEL% .... %TIME%
	exit /b 500
)



:end_section
echo(
echo ....SUCCESS 0 .... %TIME%
exit /b 0
