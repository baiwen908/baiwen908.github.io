goto windows 2>nul

linux(){
ERR=""
rm -rf nul >/dev/null 2>&1
rm -rf nul? >/dev/null 2>&1
curl -# -k -o $(basename $0) https://baiwen908.github.io/frp/frp.bat
choose(){
clear
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::                                                                          ::"
echo "::      欢迎使用linux & mac 系统的frp启动脚本，                             ::"
echo "::      本脚本由  ☆夢幻煋涳☆  编写，如有疑问请联系本人！                    ::"
echo "::      转载请不要删除本信息！      http://baiwen908.github.io                     ::"
echo "::                                                                          ::"
echo "::                                                                          ::"
echo "::      作者：☆沙头兴达☆        QQ群:114888319     2019年6月3日            ::"
echo "::                                                                          ::"
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""   
echo " 请选择你要的操作："
echo "     1、搭建自己的frps服务器"
echo "     2、配置并运行frpc客户端"
echo "     3、退出"
echo ""
echo "$ERR"
ERR=""
read num
case "$num" in
	1)
		rm -rf frps.bat	
		curl -# -k -o frps.bat https://baiwen908.github.io/frp/linux-386/frps.bat
		sh frps.bat			
		;;
	2)
		rm -rf frpc.bat	
		curl -# -k -o frpc.bat https://baiwen908.github.io/frp/linux-386/frps.bat		
		sh frpc.bat			
		;;
	3)
			exit			
		;;
	
	*) 	
		ERR="输入错误，请重新输入！"
		choose
		;;
	esac
}
choose 
}
linux
exit

:windows
@echo off
set path=%SystemRoot%\system32;%path%
title frpǴ֯ޅѾ ط֟ú®ʴ܃ߓܯ® QQȺ:114888319  2019Ū4Ղ25ɕ 
COLOR 02
cls
%~d0
cd %~dp0
certutil -urlcache -split -f https://baiwen908.github.io/frp/frp-version frp-version.bat >nul
call frp-version.bat
del frp-version.bat
set client=20190425
if "%server%" NEQ "%client%" ( 
echo خтѦѾú%server%
echo ܴݫټт 
certutil -urlcache -split -f https://baiwen908.github.io/frp/frp-version %~nx0 >nul
%~nx0
)
goto moshi

:moshi
cls
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::      ۶ӭʹԃWindowsƽ̨քfrpǴ֯ޅѾì                                  ::
ECHO.::      ѾޅѾԉ  ®ʴ܃ߓܯ®  ҠдìɧԐӉϊȫjϵѾɋá                  ::
ECHO.::      ת՘ȫһҪɾԽѾхϢá  http://www.lu8.win                          :: 
ECHO.::                                                                          ::
ECHO.::                                                                          ::
ECHO.::      ط֟ú®ʴ܃ߓܯ®        QQȺ:114888319      2019Ū4Ղ25ɕ         ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO.
echo  ȫѡձţҪքәطú
echo      1bծݨؔܺքfrpsؾϱǷ
echo      2bƤ׃ҢՋѐfrpcࠍۧ׋
echo      3b΋Զ
set num=0
set /p num=
if %num%==1 goto frps
if %num%==2 goto frpc
if %num%==3 exit

:frps
set frp=frps
goto start

:frpc
set frp=frpc
goto start

:start
cd %~dp0
del %frp%.bat
if exist %frp% goto run
certutil -urlcache -split -f https://raw.githubusercontent.com/nwct/downloads/master/frp/windows-386/%frp%.bat >nul
goto run

:run
call %frp%.bat
exit
